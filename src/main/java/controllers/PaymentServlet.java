package controllers;

import configuration.jdbcConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            request.setAttribute("message", "Session expired. Please book again.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
            return;
        }

        String username = (String) session.getAttribute("username");
        Integer userId = (Integer) session.getAttribute("user_id");
        Integer packageId = (Integer) session.getAttribute("package_id");

        String service = (String) session.getAttribute("service");
        Object priceObj = session.getAttribute("price");
        String date = (String) session.getAttribute("date");
        String time = (String) session.getAttribute("time");
        String address = (String) session.getAttribute("address");
        String contact = (String) session.getAttribute("contact");
        String notes = (String) session.getAttribute("notes");

        if (username == null || userId == null || service == null || priceObj == null || packageId == null) {
            request.setAttribute("message", "Incomplete session data. Please book again.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
            return;
        }

        double price = Double.parseDouble(priceObj.toString());

        // Payment details
        String cardName = request.getParameter("card_name");
        String cardNumber = request.getParameter("card_number");
        String cvv = request.getParameter("cvv");

        try (Connection conn = jdbcConnection.getConnection()) {

            // 1️⃣ Get how many employees are required for this package
            PreparedStatement pkgPs = conn.prepareStatement(
                    "SELECT assign_emp FROM packages WHERE id=?"
            );
            pkgPs.setInt(1, packageId);
            ResultSet pkgRs = pkgPs.executeQuery();

            int requiredEmployees = 1;
            if (pkgRs.next()) {
                requiredEmployees = pkgRs.getInt("assign_emp");
            }

            // 2️⃣ Fetch available employees
            PreparedStatement empPs = conn.prepareStatement(
                    "SELECT id FROM addemployee WHERE status='Available' LIMIT ?"
            );
            empPs.setInt(1, requiredEmployees);
            ResultSet rsEmp = empPs.executeQuery();

            List<Integer> employeeList = new ArrayList<>();
            while (rsEmp.next()) {
                employeeList.add(rsEmp.getInt("id"));
            }

            // If not enough employees available
            if (employeeList.size() < requiredEmployees) {
                request.setAttribute("message", "Not enough cleaners available right now. Try later.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
                return;
            }

            // 3️⃣ Insert booking
            String bookingSql = "INSERT INTO user_booking " +
                    "(user_id, service_name, booking_date, booking_time, address, contact_number, extra_notes, status, price) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, 'Pending', ?)";

            PreparedStatement bookingPs = conn.prepareStatement(bookingSql, Statement.RETURN_GENERATED_KEYS);
            bookingPs.setInt(1, userId);
            bookingPs.setString(2, service);
            bookingPs.setDate(3, Date.valueOf(date));
            bookingPs.setTime(4, Time.valueOf(time + ":00"));
            bookingPs.setString(5, address);
            bookingPs.setString(6, contact);
            bookingPs.setString(7, notes);
            bookingPs.setDouble(8, price);
            bookingPs.executeUpdate();

            ResultSet rsBooking = bookingPs.getGeneratedKeys();
            int bookingId = 0;
            if (rsBooking.next()) {
                bookingId = rsBooking.getInt(1);
            }

            // 4️⃣ Insert all assigned employees into user_booking_employees
            PreparedStatement ubEmpPs = conn.prepareStatement(
                    "INSERT INTO user_booking_employees (booking_id, employee_id) VALUES (?, ?)"
            );

            for (int empId : employeeList) {
                ubEmpPs.setInt(1, bookingId);
                ubEmpPs.setInt(2, empId);
                ubEmpPs.executeUpdate();
            }

            // 5️⃣ Mark each employee as Unavailable
            PreparedStatement updEmp = conn.prepareStatement(
                    "UPDATE addemployee SET status='Unavailable' WHERE id=?"
            );
            for (int empId : employeeList) {
                updEmp.setInt(1, empId);
                updEmp.executeUpdate();
            }

            // 6️⃣ Insert payment details
            String paymentSql = "INSERT INTO payments " +
                    "(booking_id, user_id, package_name, amount, card_holder_name, card_number, payment_status) " +
                    "VALUES (?, ?, ?, ?, ?, ?, 'Success')" ;

            PreparedStatement payPs = conn.prepareStatement(paymentSql);
            payPs.setInt(1, bookingId);
            payPs.setInt(2, userId);
            payPs.setString(3, service);
            payPs.setDouble(4, price);
            payPs.setString(5, cardName);
            payPs.setString(6, cardNumber);
            payPs.executeUpdate();

            // 7️⃣ Clear session
            session.removeAttribute("service");
            session.removeAttribute("price");
            session.removeAttribute("date");
            session.removeAttribute("time");
            session.removeAttribute("address");
            session.removeAttribute("contact");
            session.removeAttribute("notes");
            session.removeAttribute("package_id");

            // 8️⃣ Success page
            request.setAttribute("message", "✅ Payment successful! Booking confirmed with "
                    + requiredEmployees + " cleaners.");
            request.getRequestDispatcher("home.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "❌ Payment failed. Try again.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }
}

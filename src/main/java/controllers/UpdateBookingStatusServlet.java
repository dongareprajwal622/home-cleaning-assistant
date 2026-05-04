package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UpdateBookingStatusServlet")
public class UpdateBookingStatusServlet extends HttpServlet {

    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/home_assistant";
        String user = "root";
        String pass = "Root@123";
        return DriverManager.getConnection(url, user, pass);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookingId = Integer.parseInt(request.getParameter("booking_id"));
        String employeeIds = request.getParameter("employee_ids"); // comma-separated list
        String newStatus = request.getParameter("new_status");

        System.out.println("Employee IDs received: " + employeeIds);
        System.out.println("New Status: " + newStatus);

        if (employeeIds == null || employeeIds.trim().isEmpty()) {
            response.getWriter().println("Error: No employees found for this booking.");
            return;
        }

        // Convert comma-separated IDs to array
        String[] empArray = employeeIds.split(",");

        try (Connection con = getConnection()) {

            // 1️⃣ Update booking status
            String updateBooking = "UPDATE user_booking SET status = ? WHERE booking_id = ?";
            PreparedStatement ps = con.prepareStatement(updateBooking);
            ps.setString(1, newStatus);
            ps.setInt(2, bookingId);
            ps.executeUpdate();

            // 2️⃣ Update ALL employees' status
            String updateEmpStatus;

            if ("Completed".equalsIgnoreCase(newStatus) ||
                    "Cancelled".equalsIgnoreCase(newStatus)) {

                updateEmpStatus = "UPDATE addemployee SET status='Available' WHERE id=?";

            } else {
                // Pending, Paid, etc. = Employees remain unavailable
                updateEmpStatus = "UPDATE addemployee SET status='Unavailable' WHERE id=?";
            }

            PreparedStatement psEmp = con.prepareStatement(updateEmpStatus);

            for (String empId : empArray) {
                int id = Integer.parseInt(empId.trim());
                psEmp.setInt(1, id);
                psEmp.executeUpdate();
            }

            response.sendRedirect("view_booking.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

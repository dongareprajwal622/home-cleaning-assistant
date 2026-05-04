package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/assignEmployee")
public class AssignEmployeeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookingId = Integer.parseInt(request.getParameter("booking_id"));
        int employeeId = Integer.parseInt(request.getParameter("employee_id"));

        Connection con = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_assistant", "root", "Root@123");

            // 1️⃣ Update booking to assign employee
            String updateBooking = "UPDATE bookings SET employee_id=?, status='assigned' WHERE id=?";
            ps1 = con.prepareStatement(updateBooking);
            ps1.setInt(1, employeeId);
            ps1.setInt(2, bookingId);
            ps1.executeUpdate();

            // 2️⃣ Update employee availability to busy
            String updateEmployee = "UPDATE add_emp SET availability='busy' WHERE id=?";
            ps2 = con.prepareStatement(updateEmployee);
            ps2.setInt(1, employeeId);
            ps2.executeUpdate();

            // Redirect back to bookings page with success message
            response.sendRedirect("view_booking.jsp?msg=Employee+assigned+successfully");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("view_booking.jsp?msg=Error+assigning+employee");
        } finally {
            try {
                if (ps1 != null) ps1.close();
                if (ps2 != null) ps2.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

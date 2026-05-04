package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/CheckAvailabilityServlet")
public class CheckAvailabilityServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_assistant", "root", "Root@123");

            // Step 1: Only check for available employee (do not mark unavailable yet)
            ps = con.prepareStatement("SELECT id, name FROM addemployee WHERE status = 'Available' LIMIT 1");
            rs = ps.executeQuery();

            if (rs.next()) {
                int empId = rs.getInt("id");
                String empName = rs.getString("name");

                // Step 2: Forward to booking page with available employee info
                request.setAttribute("empId", empId);
                request.setAttribute("empName", empName);
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            } else {
                // Step 3: Redirect if no employee is available
                response.sendRedirect("package.jsp?available=false");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
}

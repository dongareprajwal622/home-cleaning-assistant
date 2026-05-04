package controllers;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/SubmitFeedbackServlet")
public class SubmitFeedbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int bookingId = Integer.parseInt(request.getParameter("booking_id"));
        int userId = (int) session.getAttribute("user_id"); // ✅ from session
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/home_assistant",
                    "root",
                    "Root@123"
            );

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO booking_feedback (booking_id, user_id, rating, comment) VALUES (?, ?, ?, ?)"
            );

            ps.setInt(1, bookingId);
            ps.setInt(2, userId);
            ps.setInt(3, rating);
            ps.setString(4, comment);

            ps.executeUpdate();
            con.close();

            response.sendRedirect("my_bookings.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

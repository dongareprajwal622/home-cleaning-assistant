package controllers;

import configuration.jdbcConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String gmail = request.getParameter("gmail");
        String password = request.getParameter("password");

        try (Connection conn = jdbcConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE email=? AND password_hash=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, gmail);
            stmt.setString(2, password); // later replace with BCrypt
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // ✅ success
                HttpSession session = request.getSession();
                session.setAttribute("user_id", rs.getInt("id"));
                session.setAttribute("username", rs.getString("username"));
                response.sendRedirect("home.jsp");
            } else {
                // ❌ invalid
                request.setAttribute("errorMessage", "Invalid Gmail or Password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}

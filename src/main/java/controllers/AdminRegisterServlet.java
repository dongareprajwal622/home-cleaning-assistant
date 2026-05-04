package controllers;

import configuration.jdbcConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Admin;
import services.AdminService;
import java.io.IOException;

@WebServlet("/admin_register")
public class AdminRegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password_hash1");

        Admin admin = new Admin();
        admin.setUsername(username);
        admin.setEmail(email);
        admin.setPassword(password);

        try {
            AdminService service = new AdminService(jdbcConnection.getConnection());
            boolean success = service.register(admin);
            if (success) {
                resp.sendRedirect("admin_login.jsp");
            } else {
                resp.getWriter().write("Admin registration failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("Error during admin registration.");
        }
    }
}

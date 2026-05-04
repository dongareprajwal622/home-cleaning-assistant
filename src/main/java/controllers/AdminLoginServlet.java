package controllers;

import configuration.jdbcConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;
import services.AdminService;

import java.io.IOException;

@WebServlet("/admin_login")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            AdminService service = new AdminService(jdbcConnection.getConnection());
            Admin admin = service.login(username, password);

            if (admin != null) {
                // ✅ Login Success
                HttpSession session = req.getSession();
                session.setAttribute("admin", admin); // store admin object in session
                resp.sendRedirect("admindash.jsp");
            } else {
                // ❌ Login Failed
                req.setAttribute("error", "Invalid username or password");
                req.getRequestDispatcher("admin_login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("Something went wrong during admin login.");
        }
    }
}

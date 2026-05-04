package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/PackageServlet")
public class PackageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/home_assistant?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "Root@123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        int id = 0;
        try {
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.trim().isEmpty()) {
                id = Integer.parseInt(idParam);
            }
        } catch (Exception ignored) {}

        String icon = request.getParameter("icon");
        String title = request.getParameter("title");
        String price = request.getParameter("price");
        String feature1 = request.getParameter("feature1");
        String feature2 = request.getParameter("feature2");
        String feature3 = request.getParameter("feature3");
        String description = request.getParameter("description");

        // 🟩 NEW FIELD — how many employees needed for this package
        int assignEmp = 1;
        try {
            String empParam = request.getParameter("assign_emp");
            if (empParam != null && !empParam.trim().isEmpty()) {
                assignEmp = Integer.parseInt(empParam);
            }
        } catch (Exception ignored) {}

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            PreparedStatement ps = null;

            // ADD PACKAGE
            if ("add".equalsIgnoreCase(action)) {
                ps = con.prepareStatement(
                        "INSERT INTO packages (icon, title, price, feature1, feature2, feature3, description, assign_emp) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
                );
                ps.setString(1, icon);
                ps.setString(2, title);
                ps.setString(3, price);
                ps.setString(4, feature1);
                ps.setString(5, feature2);
                ps.setString(6, feature3);
                ps.setString(7, description);
                ps.setInt(8, assignEmp);
                ps.executeUpdate();
            }

            // UPDATE PACKAGE
            else if ("update".equalsIgnoreCase(action)) {
                ps = con.prepareStatement(
                        "UPDATE packages SET icon=?, title=?, price=?, feature1=?, feature2=?, feature3=?, description=?, assign_emp=? WHERE id=?"
                );
                ps.setString(1, icon);
                ps.setString(2, title);
                ps.setString(3, price);
                ps.setString(4, feature1);
                ps.setString(5, feature2);
                ps.setString(6, feature3);
                ps.setString(7, description);
                ps.setInt(8, assignEmp);
                ps.setInt(9, id);
                ps.executeUpdate();
            }

            // DELETE PACKAGE
            else if ("delete".equalsIgnoreCase(action)) {
                ps = con.prepareStatement("DELETE FROM packages WHERE id=?");
                ps.setInt(1, id);
                ps.executeUpdate();
            }

            if (ps != null) ps.close();
            con.close();

            response.sendRedirect("admin_packages.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}

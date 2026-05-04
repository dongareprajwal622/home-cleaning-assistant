package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;

@WebServlet("/TeamServlet")
@MultipartConfig
public class TeamServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/home_assistant", "root", "Root@123");

            // ===================================================================
            // 1️⃣ ADD TEAM MEMBER
            // ===================================================================
            if ("add".equals(action)) {

                String name = request.getParameter("name");
                String role = request.getParameter("role");
                String experience = request.getParameter("experience");
                String specialty = request.getParameter("specialty");
                String rating = request.getParameter("rating");

                Part imagePart = request.getPart("image");
                String fileName = null;

                if (imagePart != null && imagePart.getSize() > 0) {

                    fileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();

                    String uploadPath = getServletContext().getRealPath("/") + "uploads";
                    File uploadDir = new File(uploadPath);

                    if (!uploadDir.exists()) uploadDir.mkdirs();

                    imagePart.write(uploadPath + File.separator + fileName);
                }

                PreparedStatement pst = con.prepareStatement(
                        "INSERT INTO team_members(name, role, experience, specialty, rating, image_path) VALUES (?,?,?,?,?,?)");

                pst.setString(1, name);
                pst.setString(2, role);
                pst.setString(3, experience);
                pst.setString(4, specialty);
                pst.setString(5, rating);
                pst.setString(6, fileName != null ? "uploads/" + fileName : null);

                pst.executeUpdate();
                response.sendRedirect("adminteam.jsp");
            }

            // ===================================================================
            // 2️⃣ UPDATE TEAM MEMBER
            // ===================================================================
            else if ("update".equals(action)) {

                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String role = request.getParameter("role");
                String experience = request.getParameter("experience");
                String specialty = request.getParameter("specialty");
                String rating = request.getParameter("rating");

                Part imagePart = request.getPart("image");
                String fileName = null;

                if (imagePart != null && imagePart.getSize() > 0) {

                    fileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();

                    String uploadPath = getServletContext().getRealPath("/") + "uploads";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdirs();

                    imagePart.write(uploadPath + File.separator + fileName);

                    // Update with image
                    PreparedStatement pst = con.prepareStatement(
                            "UPDATE team_members SET name=?, role=?, experience=?, specialty=?, rating=?, image_path=? WHERE id=?");

                    pst.setString(1, name);
                    pst.setString(2, role);
                    pst.setString(3, experience);
                    pst.setString(4, specialty);
                    pst.setString(5, rating);
                    pst.setString(6, "uploads/" + fileName);
                    pst.setInt(7, id);
                    pst.executeUpdate();

                } else {

                    // Update without image
                    PreparedStatement pst = con.prepareStatement(
                            "UPDATE team_members SET name=?, role=?, experience=?, specialty=?, rating=? WHERE id=?");

                    pst.setString(1, name);
                    pst.setString(2, role);
                    pst.setString(3, experience);
                    pst.setString(4, specialty);
                    pst.setString(5, rating);
                    pst.setInt(6, id);
                    pst.executeUpdate();
                }

                response.sendRedirect("adminteam.jsp");
            }

            // ===================================================================
            // 3️⃣ DELETE TEAM MEMBER
            // ===================================================================
            else if ("delete".equals(action)) {

                int id = Integer.parseInt(request.getParameter("id"));

                PreparedStatement pst = con.prepareStatement(
                        "DELETE FROM team_members WHERE id=?");

                pst.setInt(1, id);
                pst.executeUpdate();

                response.sendRedirect("adminteam.jsp");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

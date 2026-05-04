package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;
import configuration.jdbcConnection; // import your connection class

@WebServlet("/AddTeamServlet")
@MultipartConfig
public class AddTeamServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String role = request.getParameter("role");
        String experience = request.getParameter("experience");
        String specialty = request.getParameter("specialty");
        int rating = Integer.parseInt(request.getParameter("rating"));

        // Handle image upload
        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();
        String uploadDirPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadDirPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        String uploadPath = uploadDirPath + File.separator + fileName;
        filePart.write(uploadPath);

        String imagePath = "uploads/" + fileName;

        try {
            Connection con = jdbcConnection.getConnection(); // use centralized connection
            String sql = "INSERT INTO team_members (name, role, experience, specialty, rating, image_path) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, role);
            ps.setString(3, experience);
            ps.setString(4, specialty);
            ps.setInt(5, rating);
            ps.setString(6, imagePath);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("admindash.jsp");// redirect after success

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

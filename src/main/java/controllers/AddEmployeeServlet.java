package controllers;

import java.io.File;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import configuration.jdbcConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Employee;

@WebServlet("/AddEmployeeServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 15
)
public class AddEmployeeServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection con = jdbcConnection.getConnection();
            String selectSQL = "SELECT * FROM addEmployee";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(selectSQL);

            List<Employee> employees = new ArrayList<>();
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setId(rs.getInt("id"));
                emp.setName(rs.getString("name"));
                emp.setPhone(rs.getString("contact"));
                emp.setPhoto(rs.getString("photo"));
                emp.setStatus(rs.getString("status"));
                employees.add(emp);
            }

            request.setAttribute("employees", employees);
            request.getRequestDispatcher("addemp.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id"); // will be null for new employee
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String status = request.getParameter("status");

        Part filePart = request.getPart("photo");
        String photoPath = null;

        if(filePart != null && filePart.getSize() > 0){
            String fileName = extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()) uploadDir.mkdir();
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            photoPath = UPLOAD_DIR + "/" + fileName;
        }

        try {
            Connection con = jdbcConnection.getConnection();
            if(id != null && !id.isEmpty()){
                // UPDATE existing employee
                String updateSQL;
                if(photoPath != null){
                    updateSQL = "UPDATE addEmployee SET name=?, contact=?, status=?, photo=? WHERE id=?";
                } else {
                    updateSQL = "UPDATE addEmployee SET name=?, contact=?, status=? WHERE id=?";
                }
                PreparedStatement pst = con.prepareStatement(updateSQL);
                pst.setString(1, name);
                pst.setLong(2, Long.parseLong(contact));
                pst.setString(3, status);
                if(photoPath != null){
                    pst.setString(4, photoPath);
                    pst.setInt(5, Integer.parseInt(id));
                } else {
                    pst.setInt(4, Integer.parseInt(id));
                }
                pst.executeUpdate();
            } else {
                // INSERT new employee
                String insertSQL = "INSERT INTO addEmployee (name, contact, status, photo) VALUES (?, ?, ?, ?)";
                PreparedStatement pst = con.prepareStatement(insertSQL);
                pst.setString(1, name);
                pst.setLong(2, Long.parseLong(contact));
                pst.setString(3, status);
                pst.setString(4, photoPath);
                pst.executeUpdate();
            }

            // reload employee list
            doGet(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }


    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                return new File(token.split("=")[1].replace("\"", "")).getName();
            }
        }
        return "";
    }
}

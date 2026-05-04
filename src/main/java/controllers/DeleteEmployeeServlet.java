package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import configuration.jdbcConnection;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if(id != null && !id.isEmpty()){
            try {
                Connection con = jdbcConnection.getConnection();
                PreparedStatement pst = con.prepareStatement("DELETE FROM addEmployee WHERE id=?");
                pst.setInt(1, Integer.parseInt(id));
                pst.executeUpdate();
            } catch(Exception e){
                e.printStackTrace();
            }
        }

        response.sendRedirect("AddEmployeeServlet"); // redirect to refresh table
    }
}

package controllers;

import configuration.jdbcConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Registration;
import services.Proservices;

import javax.management.relation.Role;
import java.io.IOException;

@WebServlet("/register")
public class register  extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String password_hash = req.getParameter("password_hash1");



        Registration reg=new Registration();
        reg.setUsername(username);
        reg.setEmail(email);
        reg.setPassword_hash(password_hash);
        reg.setMobile(Long.parseLong(mobile));



        System.out.println("Student Data:- "+reg);

        try {
            Proservices obj= new Proservices(jdbcConnection.getConnection());
            boolean b=obj.registeration(reg);

            if(b){
                System.out.println("inserted");
                resp.sendRedirect("login.jsp");// this show when we want to redirect data .
            }
            else {
                System.out.println("not inserted");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }




    }
}

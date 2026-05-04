package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/home_assistant";
        String user = "root";
        String pass = "Root@123";
        return DriverManager.getConnection(url, user, pass);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if(username == null){
            request.setAttribute("message", "You must be logged in to book a service.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        String serviceTitle = request.getParameter("service");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String notes = request.getParameter("notes");

        double price = 0.0;
        int packageId = 0;

        // --- Get package price from DB ---
        try (Connection conn = getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT id, price FROM packages WHERE title=?");
            ps.setString(1, serviceTitle);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                packageId = rs.getInt("id");
                String priceStr = rs.getString("price").trim().replace("₹", ""); // remove any symbols/spaces
                price = Double.parseDouble(priceStr); // now convert safely
            }
        } catch(Exception e) {
            e.printStackTrace();
            price = 200; // fallback only if DB fails
        }


        // --- Store in session for PaymentServlet ---
        session.setAttribute("service", serviceTitle);
        session.setAttribute("price", price);
        session.setAttribute("date", date);
        session.setAttribute("time", time);
        session.setAttribute("address", address);
        session.setAttribute("contact", contact);
        session.setAttribute("notes", notes);
        session.setAttribute("package_id", packageId);

        // --- Get user_id ---
        try(Connection conn = getConnection()){
            PreparedStatement ps = conn.prepareStatement("SELECT id FROM users WHERE username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) session.setAttribute("user_id", rs.getInt("id"));
        } catch(Exception e){ e.printStackTrace(); }

        request.getRequestDispatcher("payment.jsp").forward(request, response);
    }
}

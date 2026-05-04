package services;

import model.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminService {
    private Connection conn;

    public AdminService(Connection conn) {
        this.conn = conn;
    }

    public boolean register(Admin admin) throws Exception {
        String sql = "INSERT INTO admins (username, email, password) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, admin.getUsername());
        ps.setString(2, admin.getEmail());
        ps.setString(3, admin.getPassword());
        int rows = ps.executeUpdate();
        return rows > 0;
    }

    public Admin login(String username, String password) throws Exception {
        String sql = "SELECT * FROM admins WHERE username = ? AND password = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Admin admin = new Admin();
            admin.setId(rs.getInt("id"));
            admin.setUsername(rs.getString("username"));
            admin.setEmail(rs.getString("email"));
            return admin;
        }
        return null;
    }
}

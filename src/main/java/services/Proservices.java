package services;

import controllers.register;
import model.Registration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Proservices {
    Connection conn;
    public Proservices(Connection connection) {
        super();
        this.conn=connection;
    }

    public boolean registeration(Registration reg) throws SQLException {
        String query = "INSERT INTO users(username, email, mobile, password_hash) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, reg.getUsername());
        ps.setString(2, reg.getEmail());
        ps.setLong(3, reg.getMobile());
        ps.setString(4, reg.getPassword_hash()); // should already be hashed

        int i = ps.executeUpdate();
        return i == 1;
    }
}

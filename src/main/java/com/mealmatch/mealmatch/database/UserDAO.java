package com.mealmatch.mealmatch.database;

import com.mealmatch.mealmatch.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public User validateCredentials(String email, String password) {
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, email);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getString("username"),
                            rs.getString("email"),
                            rs.getString("password")
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println("Database error during login: " + e.getMessage());
        }

        return null;
    }
}

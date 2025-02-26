/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Huy Lee
 */

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;
import utils.DBContext;
import utils.PasswordHashing;
public class UserDAO {
    public User login(String email, String password) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM Account WHERE email = ? AND is_delete = 0";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    try {
                        String storedHash = rs.getString("password").trim();
                        String inputHash = PasswordHashing.hashPassword(password);
                        System.out.println("Stored hash: " + storedHash);
                        System.out.println("Input hash: " + inputHash);
                        
                        if (storedHash.equals(inputHash)) {
                            User user = new User();
                            user.setId(rs.getInt("id"));
                            user.setFullName(rs.getString("full_name").trim());
                            user.setEmail(rs.getString("email").trim());
                            user.setRoleId(rs.getInt("roleId"));
                            user.setPhone(rs.getString("phone"));
                            user.setAddress(rs.getString("address"));
                            user.setGender(rs.getBoolean("gender"));
                            user.setDob(rs.getString("dob"));
                            user.setAvatar(rs.getString("avatar"));
                            user.setGoogleId(rs.getString("googleID"));
                            user.setCreateDate(rs.getString("create_date"));
                            user.setIsDelete(rs.getBoolean("is_delete"));
                            System.out.println("User found: " + user.getFullName());
                            return user;
                        } else {
                            System.out.println("Password mismatch");
                        }
                    } catch (NoSuchAlgorithmException e) {
                        System.out.println("Hash error: " + e.getMessage());
                        e.printStackTrace();
                    }
                } else {
                    System.out.println("No user found with email: " + email);
                }
            }
        }
        return null;
    }

    public static void main(String[] args) {
        try {
            UserDAO dao = new UserDAO();
            
            User newUser = new User("Test User", "test@gmail.com", "password123", 1);
            System.out.println("User registered successfully");
            
            Thread.sleep(1000);
            
            User loggedUser = dao.login("test@gmail.com", "password123");
            if (loggedUser != null) {
                System.out.println("Login successful for: " + loggedUser.getFullName());
            } else {
                System.out.println("Login failed");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

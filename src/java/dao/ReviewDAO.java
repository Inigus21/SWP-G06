package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Review;
import utils.DBContext;

/**
 * Data Access Object for Review entity
 */
public class ReviewDAO {
    
    /**
     * Get all reviews for a specific tour
     * @param tourId The tour ID
     * @return List of reviews for the tour
     */
    public List<Review> getReviewsByRating(int rating) throws ClassNotFoundException {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.*, u.full_name, u.avatar, f.feedback "
                + "FROM review r "
                + "JOIN account u ON r.account_id = u.id "
                + "LEFT JOIN feedback f ON r.id = f.review_id "
                + "WHERE r.rating = ? AND r.is_delete = 0 "
                + "ORDER BY r.created_date DESC";
        
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, rating);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("id"));
                review.setTourId(rs.getInt("tour_id"));
                review.setAccountId(rs.getInt("account_id"));
                review.setRating(rs.getInt("rating"));
                review.setComment(rs.getString("comment"));
                review.setCreatedDate(rs.getTimestamp("created_date"));
                review.setDeletedDate(rs.getTimestamp("deleted_date"));
                review.setIsDelete(rs.getBoolean("is_delete"));
                review.setUserName(rs.getString("full_name"));
                review.setUserAvatar(rs.getString("avatar"));
                
                // Add feedback if exists
                review.setFeedback(rs.getString("feedback"));
                
                reviews.add(review);
            }
        } catch (SQLException e) {
            System.out.println("Error getReviewsByRating: " + e.getMessage());
            e.printStackTrace(); // Add stack trace for better debugging
        }
        
        return reviews;
    }
}

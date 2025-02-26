/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.City;
import model.Tour;
import utils.DBContext;

/**
 *
 * @author Tuan
 */
public class TourDAO {
    private static final int TOURS_PER_PAGE = 6;

    public int getTotalTours() throws SQLException, ClassNotFoundException {
        String sql = "SELECT COUNT(*) FROM tours";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
    public List<Tour> getToursByPage(int page) throws SQLException, ClassNotFoundException {
        List<Tour> tours = new ArrayList<>();
        String sql = "SELECT t.*, c.name as departure_city FROM tours t "
                + "JOIN city c ON t.departure_location_id = c.id "
                + "ORDER BY t.id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, (page - 1) * TOURS_PER_PAGE);
            ps.setInt(2, TOURS_PER_PAGE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Tour tour = new Tour();
                tour.setId(rs.getInt("id"));
                tour.setName(rs.getString("name"));
                tour.setImg(rs.getString("img"));
                tour.setPriceAdult(rs.getDouble("price_adult"));
                tour.setDepartureCity(rs.getString("departure_city"));
                tour.setDuration(rs.getString("duration"));
                tours.add(tour);
            }
        }
        return tours;
    }

    public List<Tour> getAllTours() throws SQLException, ClassNotFoundException {
        List<Tour> tours = new ArrayList<>();
        String sql = "SELECT t.*, c.name as departure_city FROM tours t "
                + "JOIN city c ON t.departure_location_id = c.id";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Tour tour = new Tour();
                tour.setId(rs.getInt("id"));
                tour.setName(rs.getString("name"));
                tour.setImg(rs.getString("img"));
                tour.setPriceAdult(rs.getDouble("price_adult"));
                tour.setDepartureCity(rs.getString("departure_city"));
                tour.setDuration(rs.getString("duration"));
                tours.add(tour);
            }
        }
        return tours;
    }
}

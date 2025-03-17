package dao;

import model.Trip;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;
import utils.DBContext;
import java.util.logging.Logger;
import java.util.logging.Level;

public class TripDAO {

    private static final Logger LOGGER = Logger.getLogger(TripDAO.class.getName());

    public List<Trip> getTripsByTourAndMonth(int tourId, int month, int year) {
        List<Trip> trips = new ArrayList<>();
        String sql = "SELECT * FROM trip WHERE tour_id = ? AND MONTH(departure_date) = ? AND YEAR(departure_date) = ? AND is_delete = 0 ORDER BY departure_date";
        try (Connection conn = DBContext.getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, tourId);
            st.setInt(2, month);
            st.setInt(3, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Trip trip = new Trip();
                trip.setId(rs.getInt("id"));
                trip.setTourId(rs.getInt("tour_id"));
                trip.setDepartureCityId(rs.getInt("departure_city_id"));
                trip.setDestinationCityId(rs.getInt("destination_city_id"));
                trip.setDepartureDate(rs.getTimestamp("departure_date"));
                trip.setReturnDate(rs.getTimestamp("return_date"));
                trip.setStartTime(rs.getString("start_time"));
                trip.setEndTime(rs.getString("end_time"));
                trip.setAvailableSlot(rs.getInt("available_slot"));
                trip.setStatus(rs.getString("status"));
                trips.add(trip);
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
        return trips;
    }

    public Trip getTripById(int tripId) {
        String sql = "SELECT * FROM trip WHERE id = ? AND is_delete = 0";
        try (Connection conn = DBContext.getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, tripId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Trip trip = new Trip();
                trip.setId(rs.getInt("id"));
                trip.setTourId(rs.getInt("tour_id"));
                trip.setDepartureCityId(rs.getInt("departure_city_id"));
                trip.setDestinationCityId(rs.getInt("destination_city_id"));
                trip.setDepartureDate(rs.getTimestamp("departure_date"));
                trip.setReturnDate(rs.getTimestamp("return_date"));
                trip.setStartTime(rs.getString("start_time"));
                trip.setEndTime(rs.getString("end_time"));
                trip.setAvailableSlot(rs.getInt("available_slot"));
                trip.setStatus(rs.getString("status"));
                return trip;
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Trip> getTripsByTourId(int tourId) {
        List<Trip> trips = new ArrayList<>();
        String sql = "SELECT * FROM trip WHERE tour_id = ? AND is_delete = 0 ORDER BY departure_date";
        try (Connection conn = DBContext.getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, tourId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Trip trip = new Trip();
                trip.setId(rs.getInt("id"));
                trip.setTourId(rs.getInt("tour_id"));
                trip.setDepartureCityId(rs.getInt("departure_city_id"));
                trip.setDestinationCityId(rs.getInt("destination_city_id"));
                trip.setDepartureDate(rs.getTimestamp("departure_date"));
                trip.setReturnDate(rs.getTimestamp("return_date"));
                trip.setStartTime(rs.getString("start_time"));
                trip.setEndTime(rs.getString("end_time"));
                trip.setAvailableSlot(rs.getInt("available_slot"));
                trip.setStatus(rs.getString("status"));
                trip.setCreatedDate(rs.getTimestamp("created_date"));
                trip.setDeletedDate(rs.getTimestamp("deleted_date"));
                trip.setIsDelete(rs.getBoolean("is_delete"));
                trips.add(trip);
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
        return trips;
    }

    /**
     * Get the total count of trips for a specific tour
     *
     * @param tourId The tour ID
     * @return Total number of trips
     */
    public int getTotalTripsByTourId(int tourId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT COUNT(*) FROM trip WHERE tour_id = ? AND is_delete = 0";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, tourId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    /**
     * Get paginated trips for a specific tour
     *
     * @param tourId The tour ID
     * @param page The page number (1-based)
     * @param itemsPerPage Number of items per page
     * @return List of trips for the requested page
     */
    public List<Trip> getTripsByTourIdPaginated(int tourId, int page, int itemsPerPage) throws SQLException, ClassNotFoundException {
        List<Trip> trips = new ArrayList<>();
        String sql = "SELECT * FROM trip WHERE tour_id = ? AND is_delete = 0 "
                + "ORDER BY departure_date DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, tourId);
            ps.setInt(2, (page - 1) * itemsPerPage);
            ps.setInt(3, itemsPerPage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Trip trip = new Trip();
                trip.setId(rs.getInt("id"));
                trip.setTourId(rs.getInt("tour_id"));
                trip.setDepartureCityId(rs.getInt("departure_city_id"));
                trip.setDestinationCityId(rs.getInt("destination_city_id"));
                trip.setDepartureDate(rs.getTimestamp("departure_date"));
                trip.setReturnDate(rs.getTimestamp("return_date"));
                trip.setStartTime(rs.getString("start_time"));
                trip.setEndTime(rs.getString("end_time"));
                trip.setAvailableSlot(rs.getInt("available_slot"));
                trip.setStatus(rs.getString("status"));
                trips.add(trip);
            }
        }
        return trips;
    }

public void addTrip(Trip trip) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO trip (tour_id, departure_date, return_date, start_time, end_time, available_slot, status, is_delete) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Gán giá trị vào PreparedStatement
            stmt.setInt(1, trip.getTourId());
            stmt.setTimestamp(2, trip.getDepartureDate());
            stmt.setTimestamp(3, trip.getReturnDate());
            stmt.setString(4, trip.getStartTime());
            stmt.setString(5, trip.getEndTime());
            stmt.setInt(6, trip.getAvailableSlot());
            stmt.setString(7, trip.getStatus());
            stmt.setBoolean(8, false); // is_delete (mặc định là false)

            // Ghi log câu SQL
            LOGGER.log(Level.INFO, "Executing SQL: {0}", stmt);

            // Thực thi truy vấn
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted == 0) {
                throw new SQLException("Failed to insert trip, no rows affected.");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error inserting trip", e);
            throw e;
        }
    }


    public void updateTrip(Trip trip) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE trip SET departure_date = ?, return_date = ?, start_time = ?, end_time = ?, available_slot = ?, status = ? WHERE id = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setTimestamp(1, trip.getDepartureDate());
            stmt.setTimestamp(2, trip.getReturnDate());
            stmt.setString(3, trip.getStartTime());
            stmt.setString(4, trip.getEndTime());
            stmt.setInt(5, trip.getAvailableSlot());
            stmt.setString(6, trip.getStatus());
            stmt.setInt(7, trip.getId());

            stmt.executeUpdate();
        }
    }

    public void deleteTrip(int tripId) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE trip SET is_delete = 1 WHERE id = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, tripId);
            stmt.executeUpdate();
        }
    }

    public Trip getAvailableTripForTour(int tourId, int requiredSlots) throws SQLException, ClassNotFoundException {
        // First, let's print all trips for this tour to diagnose what's happening
        String debugSql = "SELECT id, tour_id, departure_date, available_slot, is_delete FROM trip WHERE tour_id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement debugStmt = conn.prepareStatement(debugSql)) {
            
            debugStmt.setInt(1, tourId);
            
            System.out.println("DEBUG - All trips for tour " + tourId + ":");
            try (ResultSet rs = debugStmt.executeQuery()) {
                while (rs.next()) {
                    System.out.println("Trip ID: " + rs.getInt("id") + 
                                      ", Departure: " + rs.getTimestamp("departure_date") + 
                                      ", Available Slots: " + rs.getInt("available_slot") + 
                                      ", Is Deleted: " + rs.getBoolean("is_delete"));
                }
            }
        }
        
        // Get the database server's current date
        String currentDateSql = "SELECT GETDATE() AS db_current_date";
        java.sql.Timestamp dbCurrentDate = null;
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(currentDateSql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                dbCurrentDate = rs.getTimestamp("db_current_date");
                System.out.println("DEBUG - Database current date: " + dbCurrentDate);
            }
        }
        
        // Try a simpler query that only compares dates, not datetimes
        String simpleDateSql = 
            "SELECT * FROM trip " +
            "WHERE tour_id = ? " +
            "AND CONVERT(date, departure_date) >= CONVERT(date, GETDATE()) " +
            "AND available_slot >= ? " +
            "AND is_delete = 0 " +
            "ORDER BY departure_date ASC";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement simpleStmt = conn.prepareStatement(simpleDateSql)) {
            
            simpleStmt.setInt(1, tourId);
            simpleStmt.setInt(2, requiredSlots);
            
            System.out.println("Executing simple date query for tourId=" + tourId + ", requiredSlots=" + requiredSlots);
            
            try (ResultSet rs = simpleStmt.executeQuery()) {
                if (rs.next()) {
                    Trip trip = mapTrip(rs);
                    System.out.println("Found available trip: ID=" + trip.getId() + 
                                      ", Departure=" + trip.getDepartureDate() + 
                                      ", Available Slots=" + trip.getAvailableSlot());
                    return trip;
                } else {
                    System.out.println("No available trips found for tour " + tourId + " requiring " + requiredSlots + " slots");
                }
            }
        }
        
        return null;
    }
    
    private Trip mapTrip(ResultSet rs) throws SQLException {
        Trip trip = new Trip();
        trip.setId(rs.getInt("id"));
        trip.setDepartureCityId(rs.getInt("departure_city_id"));
        trip.setDestinationCityId(rs.getInt("destination_city_id"));
        trip.setTourId(rs.getInt("tour_id"));
        trip.setDepartureDate(rs.getTimestamp("departure_date"));
        trip.setReturnDate(rs.getTimestamp("return_date"));
        trip.setStartTime(rs.getString("start_time"));
        trip.setEndTime(rs.getString("end_time"));
        trip.setAvailableSlot(rs.getInt("available_slot"));
        trip.setCreatedDate(rs.getTimestamp("created_date"));
        trip.setDeletedDate(rs.getTimestamp("deleted_date"));
        trip.setIsDelete(rs.getBoolean("is_delete"));
        return trip;
    }
}

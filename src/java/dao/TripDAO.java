package dao;

import model.Trip;
import utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import dao.BookingDAO;

/**
 * Data Access Object for Trip model
 */
public class TripDAO {
    
    /**
     * Get trips for a specific tour and month
     * @param tourId The tour ID
     * @param month The month (1-12)
     * @param year The year
     * @return List of trips for the specified tour and month
     */
    public List<Trip> getTripsByTourAndMonth(int tourId, int month, int year) {
        List<Trip> trips = new ArrayList<>();
        String sql = "SELECT * FROM trip WHERE tour_id = ? AND MONTH(departure_date) = ? AND YEAR(departure_date) = ? AND is_delete = 0 ORDER BY departure_date";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, tourId);
            stmt.setInt(2, month);
            stmt.setInt(3, year);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    trips.add(mapTrip(rs));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error getting trips by tour and month: " + e.getMessage());
        }
        
        return trips;
    }
    
    /**
     * Get the total count of trips for a specific tour
     * @param tourId The tour ID
     * @return Total number of trips for the tour
     * @throws SQLException If a database access error occurs
     * @throws ClassNotFoundException If the database driver class is not found
     */
    public int getTotalTripsByTourId(int tourId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT COUNT(*) FROM trip WHERE tour_id = ? AND is_delete = 0";
        
        try (Connection conn = DBContext.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, tourId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        
        return 0;
    }
    
    /**
     * Get paginated trips for a specific tour
     * @param tourId The tour ID
     * @param page The page number (1-based)
     * @param itemsPerPage Number of items per page
     * @return List of trips for the requested page
     * @throws SQLException If a database access error occurs
     * @throws ClassNotFoundException If the database driver class is not found
     */
    public List<Trip> getTripsByTourIdPaginated(int tourId, int page, int itemsPerPage) throws SQLException, ClassNotFoundException {
        List<Trip> trips = new ArrayList<>();
        // SQL Server compatible query with OFFSET-FETCH
        String sql = "SELECT * FROM trip WHERE tour_id = ? AND is_delete = 0 " +
                     "ORDER BY departure_date DESC " +
                     "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        
        try (Connection conn = DBContext.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, tourId);
            stmt.setInt(2, (page - 1) * itemsPerPage);
            stmt.setInt(3, itemsPerPage);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    trips.add(mapTrip(rs));
                }
            }
        }
        
        return trips;
    }
    
    /**
     * Get available trip for a tour with closest departure date
     * @param tourId The tour ID
     * @param requiredSlots Limit to trips departing within this many slots
     * @return The closest available trip or null if none found
     * @throws SQLException If a database access error occurs
     * @throws ClassNotFoundException If the database driver class is not found
     */
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
    
    /**
     * Get all trips for a tour
     * @param tourId The tour ID
     * @return List of trips
     */
    public List<Trip> getTripsByTourId(int tourId) {
        List<Trip> trips = new ArrayList<>();
        // Only select columns we're sure exist based on the database diagram
        String sql = "SELECT id, tour_id, departure_date, return_date, start_time, end_time, available_slot FROM trip WHERE tour_id = ? ORDER BY departure_date ASC";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, tourId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    trips.add(mapTrip(rs));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error getting trips by tour ID: " + e.getMessage());
            e.printStackTrace(); // Add stack trace for better debugging
        }
        
        return trips;
    }
    
    /**
     * Get a trip by its ID
     * @param tripId The trip ID
     * @return The trip or null if not found
     */
    public Trip getTripById(int tripId) {
        String sql = "SELECT * FROM trip WHERE id = ? AND is_delete = 0";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, tripId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapTrip(rs);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error getting trip by ID: " + e.getMessage());
        }
        
        return null;
    }
    
    /**
     * Create a new trip
     * @param trip The trip to create
     * @return The ID of the created trip, or -1 if an error occurred
     */
    public int createTrip(Trip trip) {
        String sql = "INSERT INTO trip (departure_city_id, destination_city_id, tour_id, departure_date, " +
                     "return_date, start_time, end_time, available_slot, created_date, is_delete) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, GETDATE(), 0)";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            // Debug output to verify values being inserted
            System.out.println("Creating trip with the following values:");
            System.out.println("Tour ID: " + trip.getTourId());
            System.out.println("Departure City ID: " + trip.getDepartureCityId());
            System.out.println("Destination City ID: " + trip.getDestinationCityId());
            System.out.println("Departure Date: " + trip.getDepartureDate());
            System.out.println("Return Date: " + trip.getReturnDate());
            System.out.println("Start Time: " + trip.getStartTime());
            System.out.println("End Time: " + trip.getEndTime());
            System.out.println("Available Slots: " + trip.getAvailableSlot());
            
            stmt.setInt(1, trip.getDepartureCityId());
            stmt.setInt(2, trip.getDestinationCityId());
            stmt.setInt(3, trip.getTourId());
            stmt.setTimestamp(4, trip.getDepartureDate());
            stmt.setTimestamp(5, trip.getReturnDate());
            stmt.setString(6, trip.getStartTime());
            stmt.setString(7, trip.getEndTime());
            stmt.setInt(8, trip.getAvailableSlot());
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        int newId = rs.getInt(1);
                        System.out.println("Successfully created trip with ID: " + newId);
                        return newId;
                    }
                }
            }
            
            System.out.println("No rows affected or no generated keys returned");
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error creating trip: " + e.getMessage());
            e.printStackTrace();
        }
        
        return -1;
    }
    
    /**
     * Update a trip
     * @param trip The trip to update
     * @return True if successful, false otherwise
     */
    public boolean updateTrip(Trip trip) {
        // First check if this trip has bookings
        BookingDAO bookingDAO = new BookingDAO();
        if (bookingDAO.tripHasBookings(trip.getId())) {
            System.out.println("Cannot update trip #" + trip.getId() + " as it has associated bookings");
            return false;
        }
        
        String sql = "UPDATE trip SET departure_city_id = ?, destination_city_id = ?, tour_id = ?, " +
                     "departure_date = ?, return_date = ?, start_time = ?, end_time = ?, " +
                     "available_slot = ?, is_delete = ? WHERE id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            // Debug output to verify values being updated
            System.out.println("Updating trip with the following values:");
            System.out.println("Trip ID: " + trip.getId());
            System.out.println("Tour ID: " + trip.getTourId());
            System.out.println("Departure City ID: " + trip.getDepartureCityId());
            System.out.println("Destination City ID: " + trip.getDestinationCityId());
            System.out.println("Departure Date: " + trip.getDepartureDate());
            System.out.println("Return Date: " + trip.getReturnDate());
            System.out.println("Start Time: " + trip.getStartTime());
            System.out.println("End Time: " + trip.getEndTime());
            System.out.println("Available Slots: " + trip.getAvailableSlot());
            System.out.println("Is Delete: " + trip.isIsDelete());
            
            stmt.setInt(1, trip.getDepartureCityId());
            stmt.setInt(2, trip.getDestinationCityId());
            stmt.setInt(3, trip.getTourId());
            stmt.setTimestamp(4, trip.getDepartureDate());
            stmt.setTimestamp(5, trip.getReturnDate());
            stmt.setString(6, trip.getStartTime());
            stmt.setString(7, trip.getEndTime());
            stmt.setInt(8, trip.getAvailableSlot());
            stmt.setInt(9, trip.isIsDelete() ? 1 : 0); // Convert boolean to int for SQL Server
            stmt.setInt(10, trip.getId());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error updating trip: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Update only the availability of a trip
     * @param tripId The trip ID
     * @param availableSlot The new available slot count
     * @return True if successful, false otherwise
     */
    public boolean updateTripAvailability(int tripId, int availableSlot) {
        // This method should be allowed even if the trip has bookings
        // because available slots can change due to bookings
        String sql = "UPDATE trip SET available_slot = ? WHERE id = ? AND is_delete = 0";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, availableSlot);
            stmt.setInt(2, tripId);
            
            System.out.println("Updating trip availability: tripId=" + tripId + ", newAvailableSlot=" + availableSlot);
            
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Update trip availability result: " + (rowsAffected > 0 ? "Success" : "Failed"));
            
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error updating trip availability: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Soft delete a trip by setting is_delete to true
     * @param tripId The trip ID to soft delete
     * @return true if the operation was successful, false otherwise
     */
    public boolean softDeleteTrip(int tripId) {
        // First check if this trip has bookings
        BookingDAO bookingDAO = new BookingDAO();
        if (bookingDAO.tripHasBookings(tripId)) {
            System.out.println("Cannot delete trip #" + tripId + " as it has associated bookings");
            return false;
        }
        
        String sql = "UPDATE trip SET is_delete = 1, deleted_date = CURRENT_TIMESTAMP WHERE id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            System.out.println("Soft deleting trip with ID: " + tripId);
            stmt.setInt(1, tripId);
            
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows affected by delete: " + rowsAffected);
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error soft deleting trip: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Map a ResultSet row to a Trip object
     * @param rs The ResultSet
     * @return The mapped Trip
     * @throws SQLException If a database access error occurs
     */
    private Trip mapTrip(ResultSet rs) throws SQLException {
        Trip trip = new Trip();
        trip.setId(rs.getInt("id"));
        
        // Check if departure_city_id exists in the result set
        try {
            trip.setDepartureCityId(rs.getInt("departure_city_id"));
        } catch (SQLException e) {
            // Column might not exist, set a default value
            trip.setDepartureCityId(0);
        }
        
        // Check if destination_city_id exists in the result set
        try {
            trip.setDestinationCityId(rs.getInt("destination_city_id"));
        } catch (SQLException e) {
            // Column might not exist, set a default value
            trip.setDestinationCityId(0);
        }
        
        trip.setTourId(rs.getInt("tour_id"));
        trip.setDepartureDate(rs.getTimestamp("departure_date"));
        trip.setReturnDate(rs.getTimestamp("return_date"));
        trip.setStartTime(rs.getString("start_time"));
        trip.setEndTime(rs.getString("end_time"));
        trip.setAvailableSlot(rs.getInt("available_slot"));
        
        // Check if these date fields exist
        try {
            trip.setCreatedDate(rs.getTimestamp("created_date"));
        } catch (SQLException e) {
            // Column might not exist
            trip.setCreatedDate(null);
        }
        
        try {
            trip.setDeletedDate(rs.getTimestamp("deleted_date"));
        } catch (SQLException e) {
            // Column might not exist
            trip.setDeletedDate(null);
        }
        
        try {
            trip.setIsDelete(rs.getBoolean("is_delete"));
        } catch (SQLException e) {
            // Column might not exist
            trip.setIsDelete(false);
        }
        
        return trip;
    }
}
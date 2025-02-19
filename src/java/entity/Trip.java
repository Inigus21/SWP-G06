/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.security.Timestamp;
import java.time.LocalTime;

/**
 *
 * @author Tuan
 */
public class Trip {
    private int id;
    private long departureCityId;
    private long destinationCityId;
    private long tourId;
    private Timestamp departureDate;
    private Timestamp returnDate;
    private LocalTime startTime;
    private LocalTime endTime;
    private int availableSlot;
    private String status;
    private Timestamp createdDate;
    private Timestamp deletedDate;
    private boolean isDeleted;

    public Trip() {
    }

    public Trip(int id, long departureCityId, long destinationCityId, long tourId, Timestamp departureDate, Timestamp returnDate, LocalTime startTime, LocalTime endTime, int availableSlot, String status, Timestamp createdDate, Timestamp deletedDate, boolean isDeleted) {
        this.id = id;
        this.departureCityId = departureCityId;
        this.destinationCityId = destinationCityId;
        this.tourId = tourId;
        this.departureDate = departureDate;
        this.returnDate = returnDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.availableSlot = availableSlot;
        this.status = status;
        this.createdDate = createdDate;
        this.deletedDate = deletedDate;
        this.isDeleted = isDeleted;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getDepartureCityId() {
        return departureCityId;
    }

    public void setDepartureCityId(long departureCityId) {
        this.departureCityId = departureCityId;
    }

    public long getDestinationCityId() {
        return destinationCityId;
    }

    public void setDestinationCityId(long destinationCityId) {
        this.destinationCityId = destinationCityId;
    }

    public long getTourId() {
        return tourId;
    }

    public void setTourId(long tourId) {
        this.tourId = tourId;
    }

    public Timestamp getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(Timestamp departureDate) {
        this.departureDate = departureDate;
    }

    public Timestamp getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Timestamp returnDate) {
        this.returnDate = returnDate;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    public int getAvailableSlot() {
        return availableSlot;
    }

    public void setAvailableSlot(int availableSlot) {
        this.availableSlot = availableSlot;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public Timestamp getDeletedDate() {
        return deletedDate;
    }

    public void setDeletedDate(Timestamp deletedDate) {
        this.deletedDate = deletedDate;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "Trip{" + "id=" + id + ", departureCityId=" + departureCityId + ", destinationCityId=" + destinationCityId + ", tourId=" + tourId + ", departureDate=" + departureDate + ", returnDate=" + returnDate + ", startTime=" + startTime + ", endTime=" + endTime + ", availableSlot=" + availableSlot + ", status=" + status + ", createdDate=" + createdDate + ", deletedDate=" + deletedDate + ", isDeleted=" + isDeleted + '}';
    }
    
}

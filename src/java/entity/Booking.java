/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.security.Timestamp;

/**
 *
 * @author Tuan
 */
public class Booking {

    private int id;
    private int tripId;
    private int accountId;
    private int customerNumber;
    private Timestamp createdDate;
    private Timestamp deletedDate;
    private boolean isDeleted;

    public Booking() {
    }

    public Booking(int id, int tripId, int accountId, int customerNumber, Timestamp createdDate, Timestamp deletedDate, boolean isDeleted) {
        this.id = id;
        this.tripId = tripId;
        this.accountId = accountId;
        this.customerNumber = customerNumber;
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

    public int getTripId() {
        return tripId;
    }

    public void setTripId(int tripId) {
        this.tripId = tripId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getCustomerNumber() {
        return customerNumber;
    }

    public void setCustomerNumber(int customerNumber) {
        this.customerNumber = customerNumber;
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
        return "Booking{" + "id=" + id + ", tripId=" + tripId + ", accountId=" + accountId + ", customerNumber=" + customerNumber + ", createdDate=" + createdDate + ", deletedDate=" + deletedDate + ", isDeleted=" + isDeleted + '}';
    }

}

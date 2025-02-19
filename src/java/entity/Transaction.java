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
public class Transaction {

    private int id;
    private int bookingId;
    private String transactionType;
    private double amount;
    private String description;
    private Timestamp transactionDate;
    private String status;
    private Timestamp createdDate;
    private Timestamp deletedDate;
    private boolean isDeleted;

    public Transaction() {
    }

    public Transaction(int id, int bookingId, String transactionType, double amount, String description, Timestamp transactionDate, String status, Timestamp createdDate, Timestamp deletedDate, boolean isDeleted) {
        this.id = id;
        this.bookingId = bookingId;
        this.transactionType = transactionType;
        this.amount = amount;
        this.description = description;
        this.transactionDate = transactionDate;
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

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Timestamp transactionDate) {
        this.transactionDate = transactionDate;
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
        return "Transaction{" + "id=" + id + ", bookingId=" + bookingId + ", transactionType=" + transactionType + ", amount=" + amount + ", description=" + description + ", transactionDate=" + transactionDate + ", status=" + status + ", createdDate=" + createdDate + ", deletedDate=" + deletedDate + ", isDeleted=" + isDeleted + '}';
    }

}

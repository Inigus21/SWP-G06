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
public class Review {

    private int id;
    private int tourId;
    private int accountId;
    private int rating;
    private String comment;
    private Timestamp createdDate;
    private Timestamp deletedDate;
    private boolean isDeleted;

    public Review() {
    }

    public Review(int id, int tourId, int accountId, int rating, String comment, Timestamp createdDate, Timestamp deletedDate, boolean isDeleted) {
        this.id = id;
        this.tourId = tourId;
        this.accountId = accountId;
        this.rating = rating;
        this.comment = comment;
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

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
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
        return "Review{" + "id=" + id + ", tourId=" + tourId + ", accountId=" + accountId + ", rating=" + rating + ", comment=" + comment + ", createdDate=" + createdDate + ", deletedDate=" + deletedDate + ", isDeleted=" + isDeleted + '}';
    }

}

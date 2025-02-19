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
public class Promotion {
    private int id;
    private String title;
    private double discountPercentage;
    private Timestamp startDate;
    private Timestamp endDate;
    private Timestamp createdDate;
    private Timestamp deletedDate;
    private boolean isDeleted;

    public Promotion() {
    }

    public Promotion(int id, String title, double discountPercentage, Timestamp startDate, Timestamp endDate, Timestamp createdDate, Timestamp deletedDate, boolean isDeleted) {
        this.id = id;
        this.title = title;
        this.discountPercentage = discountPercentage;
        this.startDate = startDate;
        this.endDate = endDate;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(double discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
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
        return "Promotion{" + "id=" + id + ", title=" + title + ", discountPercentage=" + discountPercentage + ", startDate=" + startDate + ", endDate=" + endDate + ", createdDate=" + createdDate + ", deletedDate=" + deletedDate + ", isDeleted=" + isDeleted + '}';
    }
    
}

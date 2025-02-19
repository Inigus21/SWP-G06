/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Timestamp;

/**
 *
 * @author nguye
 */
public class Account {
   private long id;
   private String role;
   private String email;
   private String passwordHash;
   private String fullName;
   private Timestamp dob;
   private String gender;
   private String phoneNumber;
   private String address;
   private String avatar;
   private String googleId;
   private Timestamp createdAt;
   private boolean isDeleted;

    public Account() {
    }

    public Account(long id, String role, String email, String passwordHash, String fullName, Timestamp dob, String gender, String phoneNumber, String address, String avatar, String googleId, Timestamp createdAt, boolean isDeleted) {
        this.id = id;
        this.role = role;
        this.email = email;
        this.passwordHash = passwordHash;
        this.fullName = fullName;
        this.dob = dob;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.avatar = avatar;
        this.googleId = googleId;
        this.createdAt = createdAt;
        this.isDeleted = isDeleted;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Timestamp getDob() {
        return dob;
    }

    public void setDob(Timestamp dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getGoogleId() {
        return googleId;
    }

    public void setGoogleId(String googleId) {
        this.googleId = googleId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", role=" + role + ", email=" + email + ", passwordHash=" + passwordHash + ", fullName=" + fullName + ", dob=" + dob + ", gender=" + gender + ", phoneNumber=" + phoneNumber + ", address=" + address + ", avatar=" + avatar + ", googleId=" + googleId + ", createdAt=" + createdAt + ", isDeleted=" + isDeleted + '}';
    }
}

package com.explorevietnam.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import com.explorevietnam.enums.Role;

import jakarta.persistence.*;
import lombok.*;

@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Getter
@Setter
@Builder
@Table(name = "accounts")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
    private List<Booking> bookings;

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Review> reviews;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role;

    @Column(nullable = false, length = 255)
    private String email;

    @Column(nullable = false, length = 255)
    private String passwordHash;

    @Column(name = "full_name", nullable = false, length = 255)
    private String fullName;

    private LocalDate dob;

    @Column(length = 500)
    private String address;

    @Column(length = 255)
    private String avatar;

    @Column(length = 255)
    private String googleId;

    @CreatedDate
    @Column(name = "created_date", nullable = false, updatable = false)
    public LocalDateTime createdDate;

    @LastModifiedDate
    @Column(name = "deleted_date")
    public LocalDateTime deletedDate;

    @Column(name = "is_delete", nullable = false)
    public boolean isDelete;
}
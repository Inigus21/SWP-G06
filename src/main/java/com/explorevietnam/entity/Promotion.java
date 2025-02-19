package com.explorevietnam.entity;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

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
@Table(name = "promotions")
public class Promotion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToMany
    @JoinTable(name = "tour_promotion", joinColumns = @JoinColumn(name = "promotion_id"), inverseJoinColumns = @JoinColumn(name = "tour_id"))
    private List<Tour> tours;

    private String title;

    @Column(name = "discount_percentage", nullable = false)
    private float discountPercentage;

    private LocalTime startTime; // Giờ bắt đầu

    private LocalTime endTime; // Giờ kết thúc

    @CreatedDate
    @Column(name = "created_date", nullable = false, updatable = false)
    private LocalDateTime createdDate;

    @LastModifiedDate
    @Column(name = "deleted_date")
    private LocalDateTime deletedDate;

    @Column(name = "is_delete", nullable = false)
    private boolean isDelete;
}

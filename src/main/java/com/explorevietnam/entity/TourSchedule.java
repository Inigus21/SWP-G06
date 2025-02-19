package com.explorevietnam.entity;

import java.time.LocalDateTime;

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
@Table(name = "tour_schedules")
public class TourSchedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    @JoinColumn(name = "tour_id", nullable = false)
    private Tour tour;

    @Column(name = "day_number", nullable = false)
    private int dayNumber;

    @Column(length = 1500)
    private String itinerary;

    @Column(length = 1500)
    private String description;

    @CreatedDate
    @Column(name = "created_date", nullable = false, updatable = false)
    public LocalDateTime createdDate;

    @LastModifiedDate
    @Column(name = "deleted_date")
    public LocalDateTime deletedDate;

    @Column(name = "is_delete", nullable = false)
    public boolean isDelete;
}

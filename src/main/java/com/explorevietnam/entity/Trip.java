package com.explorevietnam.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import com.explorevietnam.enums.TripStatus;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.*;

@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Getter
@Setter
@Builder
@Table(name = "trips")
public class Trip {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    @JoinColumn(name = "departure_city_id", nullable = false)
    private City departureCity;

    @ManyToOne
    @JoinColumn(name = "destination_city_id", nullable = false)
    private City destinationCity;

    @ManyToOne
    @JoinColumn(name = "tour_id", nullable = false)
    private Tour tour;

    @OneToMany(mappedBy = "trip", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Booking> bookings;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private TripStatus status;
    private int avaiableSlot; // Số ghế trống

    private LocalDate departureDate; // Ngày khởi hành

    private LocalDate returnDate; // Ngày về

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

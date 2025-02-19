package com.explorevietnam.entity;

import jakarta.persistence.Table;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.*;

@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Getter
@Setter
@Builder
@Table(name = "cities")
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(length = 150, nullable = false)
    private String name;

    // Mối quan hệ 1-n với Trip (khởi hành)
    @OneToMany(mappedBy = "departureCity", cascade = CascadeType.ALL)
    private List<Trip> departureTrips;

    // Mối quan hệ 1-n với Trip (điểm đến)
    @OneToMany(mappedBy = "destinationCity", cascade = CascadeType.ALL)
    private List<Trip> destinationTrips;

    // Mối quan hệ 1-n với Tour (khởi hành)
    @OneToMany(mappedBy = "departureCity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Tour> tours;
}

package com.explorevietnam.entity;

import java.util.List;
import com.explorevietnam.enums.Region;
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
@Table(name = "tours")
public class Tour {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "departure_city_id", nullable = false)
    private City departureCity;

    @ManyToMany(mappedBy = "tours")
    private List<Promotion> promotions;

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TourImg> imgs;

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Trip> trips;

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Review> reviews;

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Post> posts;

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TourSchedule> schedules;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Region region;

    @Column(name = "image_url")
    private String imageUrl; // Ảnh đại diện

    @Column(length = 500)
    private String name;

    @Column(name = "children_price", nullable = false)
    private long childrenPrice;

    @Column(name = "adult_price", nullable = false)
    private long adultPrice;

    @Column(name = "suitable_for", length = 100)
    private String suitableFor;

    @Column(name = "best_time", length = 100)
    private String bestTime;

    @Column(length = 100)
    private String cuisine;

    @Column(length = 100)
    private String duration;

    @Column(length = 1000)
    private String sightseeing;

    @Column(name = "max_capacity", nullable = false)
    private int maxCapacity;
}

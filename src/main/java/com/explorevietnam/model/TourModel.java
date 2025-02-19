package com.explorevietnam.model;

import com.explorevietnam.enums.Region;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TourModel {
    private long id;
    private String imageUrl; // Ảnh đại diện
    private String name;
    private long childrenPrice;
    private long adultPrice;
    private String suitableFor;
    private String bestTime;
    private String cuisine;
    private String duration;
    private String sightseeing;
    private int maxCapacity;
    private Region region;
}

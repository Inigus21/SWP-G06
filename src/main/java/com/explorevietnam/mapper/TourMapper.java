package com.explorevietnam.mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.explorevietnam.entity.Tour;
import com.explorevietnam.model.TourModel;

@Mapper(componentModel = "spring")
public interface TourMapper {

    // Maps a Tour entity to a TourModel
    TourModel toTourModel(Tour tour);

    // Maps a list of Tour entities to a list of TourModels
    List<TourModel> toTourModelList(List<Tour> tours);

    // Maps a TourModel to a Tour entity
    @Mapping(target = "posts", ignore = true) // Ignore the association with posts
    @Mapping(target = "reviews", ignore = true) // Ignore the association with reviews
    @Mapping(target = "imgs", ignore = true) // Ignore the association with imgs
    @Mapping(target = "trips", ignore = true) // Ignore the association with trips
    @Mapping(target = "schedules", ignore = true) // Ignore the association with schedules
    @Mapping(target = "promotions", ignore = true) // Ignore the association with employees
    Tour toTourEntity(TourModel tourModel);

}

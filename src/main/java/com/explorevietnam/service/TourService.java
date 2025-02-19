package com.explorevietnam.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.explorevietnam.entity.Tour;
import com.explorevietnam.mapper.TourMapper;
import com.explorevietnam.model.TourModel;
import com.explorevietnam.repository.TourRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TourService {

    private final TourRepository tourRepository;

    private final TourMapper tourMapper;

    public List<TourModel> getAllTours() {
        List<Tour> tours = this.tourRepository.findAll();
        return tourMapper.toTourModelList(tours);
    }

}
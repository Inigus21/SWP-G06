package com.explorevietnam.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.explorevietnam.model.TourModel;
import com.explorevietnam.service.TourService;

import jakarta.servlet.http.HttpServletResponse;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class HomepageController {
    private final TourService tourService;

    public HomepageController(TourService tourService) {
        this.tourService = tourService;
    }

    @GetMapping("/tours")
    public ResponseEntity<?> redirectToHomepagEntity(HttpServletResponse response) throws IOException {
        List<TourModel> tours = tourService.getAllTours();
        return ResponseEntity.status(HttpStatus.CREATED).body(tours);
    }
}

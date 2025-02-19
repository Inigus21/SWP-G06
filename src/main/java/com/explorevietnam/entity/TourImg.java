package com.explorevietnam.entity;

import java.time.LocalDateTime;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Getter
@Setter
@Builder
@Table(name = "tour_images")
public class TourImg {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "tour_id", nullable = false)
    private Tour tour;

    @Column(name = "img", length = 255, nullable = false)
    private String imgUrl;

    @CreatedDate
    @Column(name = "created_date", nullable = false, updatable = false)
    public LocalDateTime createdDate;

    @LastModifiedDate
    @Column(name = "deleted_date")
    public LocalDateTime deletedDate;

    @Column(name = "is_delete", nullable = false)
    public boolean isDelete;
}
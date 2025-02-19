/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Tuan
 */
public class TourPromotion {
    private int tourId;
    private int promotionId;

    public TourPromotion() {
    }

    public TourPromotion(int tourId, int promotionId) {
        this.tourId = tourId;
        this.promotionId = promotionId;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    @Override
    public String toString() {
        return "TourPromotion{" + "tourId=" + tourId + ", promotionId=" + promotionId + '}';
    }
    
}

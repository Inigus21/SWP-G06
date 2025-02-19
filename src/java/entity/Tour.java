/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Tuan
 */
public class Tour {
    private long id;
    private long categoryId;
    private String img;
    private String region;
    private String name;
    private double priceChildren;
    private double priceAdult;
    private String suitableFor;
    private String bestTime;
    private String cuisine;
    private String duration;
    private String sightseeing;
    private int availableSlot;
    private int maxCapacity;
    private int departureLocationId;

    public Tour() {
    }

    public Tour(long id, long categoryId, String img, String region, String name, double priceChildren, double priceAdult, String suitableFor, String bestTime, String cuisine, String duration, String sightseeing, int availableSlot, int maxCapacity, int departureLocationId) {
        this.id = id;
        this.categoryId = categoryId;
        this.img = img;
        this.region = region;
        this.name = name;
        this.priceChildren = priceChildren;
        this.priceAdult = priceAdult;
        this.suitableFor = suitableFor;
        this.bestTime = bestTime;
        this.cuisine = cuisine;
        this.duration = duration;
        this.sightseeing = sightseeing;
        this.availableSlot = availableSlot;
        this.maxCapacity = maxCapacity;
        this.departureLocationId = departureLocationId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPriceChildren() {
        return priceChildren;
    }

    public void setPriceChildren(double priceChildren) {
        this.priceChildren = priceChildren;
    }

    public double getPriceAdult() {
        return priceAdult;
    }

    public void setPriceAdult(double priceAdult) {
        this.priceAdult = priceAdult;
    }

    public String getSuitableFor() {
        return suitableFor;
    }

    public void setSuitableFor(String suitableFor) {
        this.suitableFor = suitableFor;
    }

    public String getBestTime() {
        return bestTime;
    }

    public void setBestTime(String bestTime) {
        this.bestTime = bestTime;
    }

    public String getCuisine() {
        return cuisine;
    }

    public void setCuisine(String cuisine) {
        this.cuisine = cuisine;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getSightseeing() {
        return sightseeing;
    }

    public void setSightseeing(String sightseeing) {
        this.sightseeing = sightseeing;
    }

    public int getAvailableSlot() {
        return availableSlot;
    }

    public void setAvailableSlot(int availableSlot) {
        this.availableSlot = availableSlot;
    }

    public int getMaxCapacity() {
        return maxCapacity;
    }

    public void setMaxCapacity(int maxCapacity) {
        this.maxCapacity = maxCapacity;
    }

    public int getDepartureLocationId() {
        return departureLocationId;
    }

    public void setDepartureLocationId(int departureLocationId) {
        this.departureLocationId = departureLocationId;
    }

    @Override
    public String toString() {
        return "Tour{" + "id=" + id + ", categoryId=" + categoryId + ", img=" + img + ", region=" + region + ", name=" + name + ", priceChildren=" + priceChildren + ", priceAdult=" + priceAdult + ", suitableFor=" + suitableFor + ", bestTime=" + bestTime + ", cuisine=" + cuisine + ", duration=" + duration + ", sightseeing=" + sightseeing + ", availableSlot=" + availableSlot + ", maxCapacity=" + maxCapacity + ", departureLocationId=" + departureLocationId + '}';
    }
    
}

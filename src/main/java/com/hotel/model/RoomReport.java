package com.hotel.model;

public class RoomReport {

    int id;
    int year;
    int month;
    int room_type;
    int occupancy_rate; // plus 1000
    int average_price;
    int revenue;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getRoom_type() {
        return room_type;
    }

    public void setRoom_type(int room_type) {
        this.room_type = room_type;
    }

    public int getOccupancy_rate() {
        return occupancy_rate;
    }

    public void setOccupancy_rate(int occupancy_rate) {
        this.occupancy_rate = occupancy_rate;
    }

    public int getAverage_price() {
        return average_price;
    }

    public void setAverage_price(int average_price) {
        this.average_price = average_price;
    }

    public int getRevenue() {
        return revenue;
    }

    public void setRevenue(int revenue) {
        this.revenue = revenue;
    }
}

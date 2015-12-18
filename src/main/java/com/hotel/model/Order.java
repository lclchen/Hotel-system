package com.hotel.model;

public class Order {
    public static int ORDER_ROOMTYPE_SINGLE = 1;//it should be in the model "room"
    public static int ORDER_ROOMTYPE_DOUBLE = 2;
    public static int ORDER_ROOMTYPE_TRIPLE = 3;

    public static int ORDER_STATE_RESERVATION = 1;
    public static int ORDER_STATE_LIVEIN = 2;
    public static int ORDER_STATE_CHECKOUT = 3;
    public static int ORDER_STATE_CANCEL = 4;
    public static int ORDER_STATE_OVERDUE = 5;

    public int id;
    public int customer_id;
    public int hotel_id;
    public int staff_id;
    public int room_type;
    public int room_id;
    public String bookin_time;
    public String deadline;
    public String checkin_time;
    public String checkout_time;
    public int price;
    public String price_unit;
    public int state;
    public String remarks;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getHotel_id() {
        return hotel_id;
    }

    public void setHotel_id(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public int getRoom_type() {
        return room_type;
    }

    public void setRoom_type(int room_type) {
        this.room_type = room_type;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getBookin_time() {
        return bookin_time;
    }

    public void setBookin_time(String bookin_time) {
        this.bookin_time = bookin_time;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getCheckin_time() {
        return checkin_time;
    }

    public void setCheckin_time(String checkin_time) {
        this.checkin_time = checkin_time;
    }

    public String getCheckout_time() {
        return checkout_time;
    }

    public void setCheckout_time(String checkout_time) {
        this.checkout_time = checkout_time;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPrice_unit() {
        return price_unit;
    }

    public void setPrice_unit(String price_unit) {
        this.price_unit = price_unit;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}

package com.hotel.model;

public class CustomerValueAnalysis {

    int id;
    int customer_id;
    int revenue;
    String revenue_unit;
    int default_amount;
    String default_unit;
    int default_times;

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

    public int getRevenue() {
        return revenue;
    }

    public String getRevenue_unit() {
        return revenue_unit;
    }

    public void setRevenue_unit(String revenue_unit) {
        this.revenue_unit = revenue_unit;
    }

    public void setRevenue(int revenue) {
        this.revenue = revenue;
    }

    public int getDefault_amount() {
        return default_amount;
    }

    public void setDefault_amount(int default_amount) {
        this.default_amount = default_amount;
    }

    public String getDefault_unit() {
        return default_unit;
    }

    public void setDefault_unit(String default_unit) {
        this.default_unit = default_unit;
    }

    public int getDefault_times() {
        return default_times;
    }

    public void setDefault_times(int default_times) {
        this.default_times = default_times;
    }
}

package com.hotel.dao;

import java.util.List;

import com.hotel.model.Order;

public interface OrderDao {

    public Order getOrder(int order_id);
    public boolean addOrder(Order order);
    public boolean modifyOrder(Order order);
    public boolean removeOrder(int order_id);
    public List<Order> getOrderList();

}

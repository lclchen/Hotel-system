package com.hotel.dao.impl;

import com.hotel.model.Order;
import com.hotel.dao.OrderDao;

import java.util.*;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDaoImpl implements OrderDao{

    private NamedParameterJdbcTemplate template;

    @Autowired
    public OrderDaoImpl(DataSource ds) {
        template = new NamedParameterJdbcTemplate(ds);
    }

    @Override
    public Order getOrder(int order_id) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id", order_id);
        String sql = "SELECT * FROM order_record WHERE id=:id";

        List<Order> list = template.query(
                sql,
                params,
                orderMapper);

        if(list != null && !list.isEmpty()) {
            return list.get(0);
        }
        return new Order();
    }

    @Override
    public boolean addOrder(Order order) {
        //....
        return false;
    }

    @Override
    public boolean modifyOrder(Order order) {
        //......
        return false;
    }

    @Override
    public boolean removeOrder(int order_id) {
        //......not allow not
        return false;
    }

    @Override
    public List<Order> getOrderList() {
        Map<String, Object> params = new HashMap<String, Object>();
        String sql = "SELECT * FROM order_record";

        List<Order> list = template.query(
                sql,
                params,
                orderMapper);

        if(list != null) {
            return list;
        }
        return new ArrayList<Order>();
    }

    private RowMapper<Order> orderMapper = (rs, rowNum) -> {
        Order o = new Order();

        o.setId(rs.getInt("id"));
        o.setCustomer_id(rs.getInt("customer_id"));
        o.setHotel_id(rs.getInt("hotel_id"));
        o.setStaff_id(rs.getInt("staff_id"));
        o.setRoom_type(rs.getInt("room_type"));
        o.setRoom_id(rs.getInt("room_id"));
        o.setBookin_time(rs.getString("bookin_time"));
        o.setDeadline(rs.getString("deadline"));
        o.setCheckin_time(rs.getString("checkin_time"));
        o.setCheckout_time(rs.getString("checkout_time"));
        o.setPrice(rs.getInt("price"));
        o.setPrice_unit(rs.getString("price_unit"));
        o.setState(rs.getInt("state"));
        o.setRemarks(rs.getString("remarks"));

        return o;
    };
}

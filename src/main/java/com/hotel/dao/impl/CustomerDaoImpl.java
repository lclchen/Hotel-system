package com.hotel.dao.impl;

import com.hotel.model.CustomerValueAnalysis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.util.*;

import com.hotel.dao.CustomerDao;
import com.hotel.model.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao{
    private NamedParameterJdbcTemplate template;

    @Autowired
    public CustomerDaoImpl(DataSource ds) {
        template = new NamedParameterJdbcTemplate(ds);
    }

    @Override
    public Customer getCustomerbyId(int id) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id", id);
        String sql = "SELECT * FROM customer WHERE id=:id";

        List<Customer> list = template.query(
                sql,
                params,
                customerMapper);

        if(list != null && !list.isEmpty()) {
            return list.get(0);
        }
        return new Customer();
    }

    private RowMapper<Customer> customerMapper = (rs, rowNum) -> {
        Customer c = new Customer();

        c.setId(rs.getInt("id"));
        c.setName(rs.getString("name"));
        c.setIdcard(rs.getString("idcard"));
        c.setGender(rs.getString("gender"));
        c.setTel(rs.getString("tel"));
        c.setEmail(rs.getString("email"));
        c.setNationality(rs.getString("nationality"));
        c.setBirthday(rs.getString("birthday"));
        c.setAddress(rs.getString("address"));
        c.setVip_level(rs.getInt("vip_level"));
        c.setRemarks(rs.getString("remarks"));

        return c;
    };
}

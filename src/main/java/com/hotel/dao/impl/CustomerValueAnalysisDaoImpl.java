package com.hotel.dao.impl;

import com.hotel.model.CustomerValueAnalysis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.util.*;

import com.hotel.dao.CustomerValueAnalysisDao;

@Repository
public class CustomerValueAnalysisDaoImpl implements CustomerValueAnalysisDao{


    private NamedParameterJdbcTemplate template;

    @Autowired
    public CustomerValueAnalysisDaoImpl(DataSource ds) {
        template = new NamedParameterJdbcTemplate(ds);
    }

    @Override
    public List<CustomerValueAnalysis> getOneCustomerYearRecord(int customer_id) {
        List<CustomerValueAnalysis> result = new ArrayList<>();
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("customer_id", customer_id);

        Date dateNow = new Date();
        int monthNow = dateNow.getMonth() + 1;
        int yearNow = dateNow.getYear() - 1 + 1900;

        for(int i=1; i<=12; i++) {
            if(monthNow >= 13){
                monthNow = 1;
                yearNow ++;
            }
            String monthStr = monthNow < 10? "0" + monthNow : ""+monthNow;
            String sql = "SELECT * FROM customer_value_analysis" + "_" + yearNow + monthStr + " WHERE customer_id=:customer_id";
            monthNow ++;
            List<CustomerValueAnalysis> list = null;

            try{
                list = template.query(
                        sql,
                        params,
                        customer_value_analysisMapper);
            }catch(Exception e){}

            CustomerValueAnalysis monthResult = null;
            if (list != null && !list.isEmpty()) {
                monthResult = list.get(0);
            }else{
                monthResult = new CustomerValueAnalysis();
                monthResult.setDefault_times(0);
                monthResult.setDefault_unit("RMB");
                monthResult.setDefault_amount(0);
                monthResult.setRevenue(0);
                monthResult.setRevenue_unit("RMB");
                monthResult.setId(customer_id);
            }
            result.add(monthResult);
        }

        return result;
    }

    @Override
    public List<CustomerValueAnalysis> getAverageCustomerYearRecord() {
        return getOneCustomerYearRecord(-1);
    }

    @Override
    public List<Map> getCustomersSumRecord() {
        List<Map> emptyResult = new ArrayList<>();
        Map<String, Object> params = new HashMap<String, Object>();

        String sql = "SELECT customer.*,customer_value_analysis.revenue,"
                + "customer_value_analysis.revenue,"
                + "customer_value_analysis.revenue_unit,"
                + "customer_value_analysis.default_amount,"
                + "customer_value_analysis.default_unit,"
                + "customer_value_analysis.default_times"
                +" FROM customer,customer_value_analysis where customer.id=customer_value_analysis.customer_id";
        List<Map> result = template.query(
                sql,
                params,
                customer_infoMapper);
        if (result != null) {
            return result;
        }
        return emptyResult;
    }

    private RowMapper<CustomerValueAnalysis> customer_value_analysisMapper = (rs, rowNum) -> {
        CustomerValueAnalysis c = new CustomerValueAnalysis();

        c.setId(rs.getInt("id"));
        c.setCustomer_id(rs.getInt("customer_id"));
        c.setRevenue(rs.getInt("revenue"));
        c.setRevenue_unit(rs.getString("revenue_unit"));
        c.setDefault_amount(rs.getInt("default_amount"));
        c.setDefault_unit(rs.getString("default_unit"));
        c.setDefault_times(rs.getInt("default_times"));

        return c;
    };

    private RowMapper<Map> customer_infoMapper = (rs, rowNum) -> {
        Map<String, Object> c = new HashMap<>();

        c.put("id", rs.getInt("id"));
        c.put("name", rs.getString("name"));
        c.put("idcard", rs.getString("idcard"));
        c.put("gender", rs.getString("gender"));
        c.put("tel", rs.getString("tel"));
        c.put("email", rs.getString("email"));
        c.put("nationality", rs.getString("nationality"));
        c.put("birthday", rs.getString("birthday"));
        c.put("address", rs.getString("address"));
        c.put("vip_level", rs.getInt("vip_level"));
        c.put("remarks", rs.getString("remarks"));

        c.put("revenue", rs.getInt("revenue"));
        c.put("revenue_unit", rs.getString("revenue_unit"));
        c.put("default_amount", rs.getInt("default_amount"));
        c.put("revenue_unit", rs.getString("revenue_unit"));
        c.put("default_times", rs.getInt("default_times"));

        return c;
    };

}

package com.hotel.dao.impl;

import com.hotel.model.CustomerValueAnalysis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.util.*;

import com.hotel.dao.IncomeReportDao;
import com.hotel.model.IncomeReport;

@Repository
public class IncomeReportDaoImpl implements IncomeReportDao{

    private NamedParameterJdbcTemplate template;

    @Autowired
    public IncomeReportDaoImpl(DataSource ds) {
        template = new NamedParameterJdbcTemplate(ds);
    }

    @Override
    public IncomeReport getYearIncomeReport(int year) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("year", year);

        String sql = "SELECT * FROM income_report WHERE year=:year";

        List<IncomeReport> list = template.query(
                sql,
                params,
                incomeReportMapper);

        IncomeReport result = null;
        if(list != null && !list.isEmpty()) {
            return list.get(0);
        }
        return new IncomeReport();
    }

    private RowMapper<IncomeReport> incomeReportMapper = (rs, rowNum) -> {
        IncomeReport i = new IncomeReport();

        i.setId(rs.getInt("id"));
        i.setYear(rs.getInt("year"));
        i.setRoom_single(rs.getInt("room_single"));
        i.setRoom_double(rs.getInt("room_double"));
        i.setRoom_triple(rs.getInt("room_triple"));
        i.setFood_chinese(rs.getInt("food_chinese"));
        i.setFood_western(rs.getInt("food_western"));
        i.setFood_buffet(rs.getInt("food_buffet"));
        i.setAgency_ticket(rs.getInt("agency_ticket"));
        i.setAgency_airline(rs.getInt("agency_airline"));
        i.setAgency_railway(rs.getInt("agency_railway"));
        i.setAgency_car_rental(rs.getInt("agency_car_rental"));
        i.setOther_park(rs.getInt("other_park"));
        i.setOther_gym(rs.getInt("other_gym"));
        i.setOther_natatorium(rs.getInt("other_natatorium"));

        return i;
    };
}

package com.hotel.dao.impl;

import com.hotel.dao.RoomReportDao;
import com.hotel.model.RoomReport;

import java.util.*;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RoomReportDaoImpl implements RoomReportDao{

    private NamedParameterJdbcTemplate template;

    @Autowired
    public RoomReportDaoImpl(DataSource ds) {
        template = new NamedParameterJdbcTemplate(ds);
    }

    @Override
    public List<RoomReport> getYearRoomReport(int year) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("year", year);

        String sql = "SELECT * FROM room_report WHERE year=:year";

        List<RoomReport> list = template.query(
                sql,
                params,
                roomReportMapper);

        if(list != null) {
            return list;
        }
        return new ArrayList<>();
    }

    @Override
    public RoomReport getRoomReport(int year, int month) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("year", year);
        params.put("month", month);

        String sql = "SELECT * FROM room_report WHERE year=:year and month=:month";

        List<RoomReport> list = template.query(
                sql,
                params,
                roomReportMapper);

        if(list != null && !list.isEmpty()) {
            return list.get(0);
        }

        RoomReport result = new RoomReport();
        result.setAverage_price(0);
        result.setRevenue(0);
        result.setOccupancy_rate(0);
        return result;
    }

    @Override
    public List<RoomReport> getRoomReportTwelveMonths(int start_year, int start_month) {
        List<RoomReport> result = new ArrayList<>();
        for(int i=1; i<=12; i++){
            result.add(getRoomReport(start_year, start_month));
            start_month++;
            if(start_month >= 13){
                start_month = 1;
                start_year ++;
            }
        }
        return result;
    }

    private RowMapper<RoomReport> roomReportMapper = (rs, rowNum) -> {
        RoomReport r = new RoomReport();

        r.setId(rs.getInt("id"));
        r.setYear(rs.getInt("year"));
        r.setMonth(rs.getInt("month"));
        r.setRoom_type(rs.getInt("room_type"));
        r.setOccupancy_rate(rs.getInt("occupancy_rate"));
        r.setAverage_price(rs.getInt("average_price"));
        r.setRevenue(rs.getInt("revenue"));

        return r;
    };
}

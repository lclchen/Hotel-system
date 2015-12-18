package com.hotel.dao;

import com.hotel.model.RoomReport;

import java.util.List;

public interface RoomReportDao {

    public List<RoomReport> getYearRoomReport(int year);
    public RoomReport getRoomReport(int year, int month);
    public List<RoomReport> getRoomReportTwelveMonths(int start_year, int start_month);
}

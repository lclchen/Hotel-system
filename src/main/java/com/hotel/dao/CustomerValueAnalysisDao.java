package com.hotel.dao;

import com.hotel.model.CustomerValueAnalysis;

import java.util.List;
import java.util.Map;

public interface CustomerValueAnalysisDao {

    List<CustomerValueAnalysis> getOneCustomerYearRecord(int customer_id);

    List<CustomerValueAnalysis> getAverageCustomerYearRecord();

    List<Map> getCustomersSumRecord();

}

package com.hotel.service.impl;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

import com.hotel.model.CustomerValueAnalysis;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.dao.*;
import com.hotel.model.*;
import com.hotel.util.PasswordUtil;

@Service
public class HotelService {
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private CustomerValueAnalysisDao customerValueAnalysisDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private CustomerDao customerDao;
	@Autowired
	private IncomeReportDao incomeReportDao;
	@Autowired
	private RoomReportDao roomReportDao;

	public User getUserbyId(int id) {
		return userDao.getUserbyId(id);
	}

	public User getUserbyUsername(String username) {
		return userDao.getUserbyUsername(username);
	}
	
	public LoginResult checkUser(User user) {
		LoginResult result = new LoginResult();
		User userFound = userDao.getUserbyUsername(user.getUsername());
		if(userFound == null) {
			result.setError("Invalid username");
		} else if(!PasswordUtil.verifyPassword(user.getPassword(), userFound.getPassword())) {
			result.setError("Invalid password");
		} else {
			result.setUser(userFound);
		}
		return result;
	}
	
	public void registerUser(User user) {
		user.setPassword(PasswordUtil.hashPassword(user.getPassword()));
		userDao.registerUser(user);
	}

	public List<Map> getAllCustomersValueSumList() {
		return customerValueAnalysisDao.getCustomersSumRecord();
	}

	public List<CustomerValueAnalysis> getOneCustomerYearRecord(int id) {
		return customerValueAnalysisDao.getOneCustomerYearRecord(id);
	}

	public List<CustomerValueAnalysis> getAverageCustomerYearRecord() {
		return customerValueAnalysisDao.getAverageCustomerYearRecord();
	}

	public Customer getCustomerInfo(int id) {
		return customerDao.getCustomerbyId(id);
	}

	public List<Order> getAllOrders() {
		return orderDao.getOrderList();
	}

	public Order getOrder(int order_id) {
		return orderDao.getOrder(order_id);
	}

	public IncomeReport getYearIncomeReport(int year) {
		return incomeReportDao.getYearIncomeReport(year);
	}

	public List<RoomReport> getRoomReportTwelveMonths(int year, int month) {
		return roomReportDao.getRoomReportTwelveMonths(year, month);
	}
}

package com.hotel.dao;

import com.hotel.model.User;

public interface UserDao {

	User getUserbyId(int id);
	User getUserbyUsername(String username);
	void registerUser(User user);

}

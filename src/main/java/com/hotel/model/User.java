package com.hotel.model;

import spark.utils.StringUtils;

public class User {
	public static int ROLE_CUSTOMER = 1;
	public static int ROLE_RECEPTIONIST = 2;
	public static int ROLE_SALESMANAGER = 3;

	private int id;
	private String username;
	private String password;
	private String nickname;
	private int role;
	private int info_id;
	private String create_time;
	private String update_time;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String registerValidate() {
		String error = null;
		
		if(StringUtils.isEmpty(username)) {
			error = "You have to enter a username";
		} else if(StringUtils.isEmpty(password)) {
			error = "You have to enter a password";
		} else if(role <= 0 || role >= 4) {
			error = "Not such role type";
		}
		
		return error;
	}
}

package com.hotel.dao.impl;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hotel.dao.UserDao;
import com.hotel.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	private NamedParameterJdbcTemplate template;

	@Autowired
	public UserDaoImpl(DataSource ds) {
		template = new NamedParameterJdbcTemplate(ds);
	}

	@Override
	public User getUserbyId(int id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);

		String sql = "SELECT * FROM user WHERE id=:id";

		List<User> list = template.query(
				sql,
				params,
				userMapper);

		User result = null;
		if(list != null && !list.isEmpty()) {
			result = list.get(0);
		}

		return result;
	}

	@Override
	public User getUserbyUsername(String username) {
		Map<String, Object> params = new HashMap<String, Object>();
        params.put("username", username);
        
		String sql = "SELECT * FROM user WHERE username=:username";
		
        List<User> list = template.query(
                    sql,
                    params,
                    userMapper);
        
        User result = null;
        if(list != null && !list.isEmpty()) {
        	result = list.get(0);
        }
        
		return result;
	}

	@Override
	public void registerUser(User user) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("username", user.getUsername());
		params.put("password", user.getPassword());
		params.put("nickname", user.getNickname());
		params.put("role", user.getRole());

		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		params.put("create_time", df.format(date));
		params.put("update_time", df.format(date));

		String sql = "insert into user (username, password, nickname, role, create_time, update_time) " +
				"values (:username, :password, :nickname, :role, :create_time, :update_time)";

		template.update(sql, params);
	}


	private RowMapper<User> userMapper = (rs, rowNum) -> {
		User u = new User();
		
		u.setId(rs.getInt("id"));
		u.setUsername(rs.getString("username"));
		u.setPassword(rs.getString("password"));
		u.setNickname(rs.getString("nickname"));
		u.setRole(rs.getInt("role"));
		u.setInfo_id(rs.getInt("info_id"));
		u.setCreate_time(rs.getString("create_time"));
		u.setUpdate_time(rs.getString("update_time"));
		
		return u;
	};
}

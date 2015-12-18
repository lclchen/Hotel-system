package com.hotel.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class DatabaseConfig {

	@Bean
	public DataSource dataSource() {

		DriverManagerDataSource db = new DriverManagerDataSource();
		db.setDriverClassName("com.mysql.jdbc.Driver");
		db.setUrl("jdbc:mysql://localhost:3306/hotel_system");
		db.setUsername("root");
		db.setPassword("sdsd");

		return db;
	}

}

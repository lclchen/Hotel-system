package com.hotel;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.hotel.config.WebConfig;
import com.hotel.service.impl.HotelService;

@Configuration
@ComponentScan({ "com.hotel" })
public class App {
	
	public static void main(String[] args) {
    	AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(App.class);
    	new WebConfig(ctx.getBean(HotelService.class));
        ctx.registerShutdownHook();
    }
}

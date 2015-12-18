package com.hotel.config;

import static spark.Spark.before;
import static spark.Spark.get;
import static spark.Spark.halt;
import static spark.Spark.post;
import static spark.Spark.port;
import static spark.SparkBase.staticFileLocation;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.eclipse.jetty.util.MultiMap;
import org.eclipse.jetty.util.UrlEncoded;
import org.json.*;

import com.hotel.util.JsonTransformer;
import com.hotel.model.LoginResult;
import com.hotel.model.User;
import com.hotel.service.impl.HotelService;

import spark.ModelAndView;
import spark.Request;
import spark.template.freemarker.FreeMarkerEngine;
import spark.utils.StringUtils;

public class WebConfig {
	
	private static final String USER_SESSION_ID = "user";
	private HotelService service;
	 

	public WebConfig(HotelService service) {
		this.service = service;
		port(80);
		staticFileLocation("/public");
		setupRoutes();
	}
	
	private void setupRoutes() {

		get("api/room_report", (req, res) -> {
			String year = req.queryParams("year");
			String month = req.queryParams("month");
			return service.getRoomReportTwelveMonths(Integer.valueOf(year), Integer.valueOf(month));
		}, new JsonTransformer());


		get("api/income_report", (req, res) -> {
			String year = req.queryParams("year");
			return service.getYearIncomeReport(Integer.valueOf(year));
		}, new JsonTransformer());


		get("api/customer", (req, res) -> {
			String id_str = req.queryParams("id");
			return service.getCustomerInfo(Integer.valueOf(id_str));
		}, new JsonTransformer());


		get("api/customer_value/list", (req, res) -> {
			return service.getAllCustomersValueSumList();
		}, new JsonTransformer());


		get("api/customer_value", (req, res) -> {
			return service.getOneCustomerYearRecord(-1);
		}, new JsonTransformer());
		post("api/customer_value", (req, res) -> {
			//String name2 = req.headers("name");
			String body = req.body();
            JSONObject json = new JSONObject(body);
            int id = json.getInt("id");
			//return service.getAllCustomersValueSumList();
			//String id_str = req.queryParams("id");
			return service.getOneCustomerYearRecord(id);
		}, new JsonTransformer());


		get("api/order/list", (req, res) -> {
			return service.getAllOrders();
		}, new JsonTransformer());


		get("api/order", (req, res) -> {
			String id_str = req.queryParams("id");
			return service.getOrder(Integer.valueOf(id_str));
		}, new JsonTransformer());


		//****************** Above is ajax API, Below is web page****************

		before("/", (req, res) -> {
			User user = getAuthenticatedUser(req);
			if(user == null) {
				res.redirect("/login");
				halt();
			}else{
				res.redirect("/main");
				halt();
			}
		});


		get("/main", (req, res) -> {
			Map<String, Object> map = new HashMap<>();
			User user = getAuthenticatedUser(req);
			map.put("nickname", user.getNickname());
			map.put("role", user.getRole());
			return new ModelAndView(map, "main/main.ftl");
		}, new FreeMarkerEngine());
		before("/main", (req, res) -> {
			User authUser = getAuthenticatedUser(req);
			if(authUser == null) {
				res.redirect("/login");
				halt();
			}
		});


		get("/analysis", (req, res) -> {
			Map<String, Object> map = new HashMap<>();
			User user = getAuthenticatedUser(req);
			map.put("nickname", user.getNickname());
			map.put("role", user.getRole());
			return new ModelAndView(map, "main/analysis.ftl");
		}, new FreeMarkerEngine());
		before("/analysis", (req, res) -> {
			User authUser = getAuthenticatedUser(req);
			if(authUser == null) {
				res.redirect("/login");
				halt();
			}else if (authUser.getRole() != 3) {
				res.redirect("/main");
				halt();
			}
		});


		get("/crm", (req, res) -> {
			Map<String, Object> map = new HashMap<>();
			User user = getAuthenticatedUser(req);
			map.put("nickname", user.getNickname());
			map.put("role", user.getRole());
			return new ModelAndView(map, "main/crm.ftl");
		}, new FreeMarkerEngine());
		before("/crm", (req, res) -> {
			User authUser = getAuthenticatedUser(req);
			if(authUser == null) {
				res.redirect("/login");
				halt();
			}else if (authUser.getRole() != 3) {
				res.redirect("/main");
				halt();
			}
		});


		get("/report", (req, res) -> {
			Map<String, Object> map = new HashMap<>();
			User user = getAuthenticatedUser(req);
			map.put("nickname", user.getNickname());
			map.put("role", user.getRole());
			return new ModelAndView(map, "main/report.ftl");
		}, new FreeMarkerEngine());
		before("/report", (req, res) -> {
			User authUser = getAuthenticatedUser(req);
			if(authUser == null) {
				res.redirect("/login");
				halt();
			}else if (authUser.getRole() != 3) {
				res.redirect("/main");
				halt();
			}
		});


		get("/login", (req, res) -> {
			Map<String, Object> map = new HashMap<>();
			if(req.queryParams("success") != null) {
				map.put("message", "Register successfully!");
			}
			return new ModelAndView(map, "login.ftl");
        }, new FreeMarkerEngine());
		post("/login", (req, res) -> {
			Map<String, Object> map = new HashMap<>();
			User user = new User();
			try {
				MultiMap<String> params = new MultiMap<String>();
				UrlEncoded.decodeTo(req.body(), params, "UTF-8", -1);
				BeanUtils.populate(user, params);
			} catch (Exception e) {
				halt(501);
				return null;
			}
			LoginResult result = service.checkUser(user);
			if(result.getUser() != null) {
				addAuthenticatedUser(req, result.getUser());
				res.redirect("/");
				halt();
			} else {
				map.put("error", result.getError());
				return new ModelAndView(map, "login.ftl");
			}
			map.put("username", user.getUsername());
			return new ModelAndView(map, "main/main.ftl");
        }, new FreeMarkerEngine());
		before("/login", (req, res) -> {
			User authUser = getAuthenticatedUser(req);
			if(authUser != null) {
				res.redirect("/");
				halt();
			}
		});


		get("/register", (req, res) -> {
			Map<String, Object> map = new HashMap<>();
			return new ModelAndView(map, "register.ftl");
        }, new FreeMarkerEngine());
		post("/register", (req, res) -> {
			Map<String, Object> map = new HashMap<>();
			User user = new User();
			try {
				MultiMap<String> params = new MultiMap<String>();
				UrlEncoded.decodeTo(req.body(), params, "UTF-8", -1);
				BeanUtils.populate(user, params);
			} catch (Exception e) {
				halt(501);
				return null;
			}
			String error = user.registerValidate();
			if(StringUtils.isEmpty(error)) {
				User existingUser = service.getUserbyUsername(user.getUsername());
				if(existingUser == null) {
					service.registerUser(user);
					res.redirect("/login?success=1");
					halt();
				} else {
					error = "The username is already taken";
				}
			}
			map.put("error", error);
			map.put("username", user.getUsername());
			return new ModelAndView(map, "register.ftl");
        }, new FreeMarkerEngine());
		before("/register", (req, res) -> {
			User authUser = getAuthenticatedUser(req);
			if(authUser != null) {
				res.redirect("/");
				halt();
			}
		});


		get("/logout", (req, res) -> {
			removeAuthenticatedUser(req);
			res.redirect("/");
			return null;
        });
	}

	private void addAuthenticatedUser(Request request, User u) {
		request.session().attribute(USER_SESSION_ID, u);
	}

	private void removeAuthenticatedUser(Request request) {
		request.session().removeAttribute(USER_SESSION_ID);
	}

	private User getAuthenticatedUser(Request request) {
		return request.session().attribute(USER_SESSION_ID);
	}

}

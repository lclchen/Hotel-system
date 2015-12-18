create database hotel_system;
use hotel_system;

create table if not exists user (
  id integer primary key not null auto_increment unique,
  username varchar(50) not null unique,
  password varchar(255) not null,
  nickname varchar(20) not null,
  role integer not null,
  info_id integer,
  create_time varchar(20) not null,
  update_time varchar(20) not null
);

create table if not exists customer (
  id integer primary key not null auto_increment unique,
  name varchar(20) not null,
  idcard varchar(30),
  gender varchar(10),
  tel varchar(20),
  email varchar(30),
  nationality varchar(20),
  birthday varchar(30),
  address varchar(50),
  vip_level integer,
  remarks varchar(300)
);

create table if not exists order_record (
  id integer primary key not null AUTO_INCREMENT UNIQUE,
  customer_id INTEGER not null,
  hotel_id INTEGER not null,
  staff_id integer not null,
  room_type integer not null,
  room_id INTEGER,
  bookin_time VARCHAR(30),
  deadline VARCHAR(30),
  checkin_time VARCHAR(30),
  checkout_time VARCHAR(30),
  price integer,
  price_unit VARCHAR(20),
  state INTEGER not null,
  remarks VARCHAR(30)
);

create table if not exists customer_value_analysis (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);

create table if not EXISTS income_report (
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
  year INTEGER NOT NULL,
  room_single INTEGER,
  room_double INTEGER,
  room_triple INTEGER,
  food_chinese INTEGER,
  food_western Integer,
  food_buffet integer,
  agency_ticket integer,
  agency_airline integer,
  agency_railway integer,
  agency_car_rental integer,
  other_park integer,
  other_gym integer,
  other_natatorium integer
);

create table if not exists room_report (
  id INTEGER PRIMARY KEY  NOT NULL  AUTO_INCREMENT UNIQUE,
  year Integer NOT NULL,
  month INTEGER NOT NULL,
  room_type Integer NOT NULL,
  occupancy_rate integer not null,
  average_price integer not null,
  revenue integer NOT NULL
);
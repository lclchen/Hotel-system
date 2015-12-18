use hotel_system;

insert into customer values(1, "Davie", "440203199401299945", "male", "15998893830", "hitom@gmail.com", "China", "19940129", "shanghai", 1, "like sports");
insert into customer values(2, "James", "450203198903299345", "female", "13841238445", "girl@gmail.com", "USA", "19890319", "beijing", 1, "like movie");
insert into customer values(3, "Toddy", "450203197001299245", "male", "19403123113", "toddy@gmail.com", "UK", "19700423", "xianggang Rd.110", 3, "stress nice service");
insert into customer values(4, "Chris", "451193199203109845", "male", "18217511886", "chris@hotmail.com", "China", "19920310", "SJTU", 3, "love swimming");

insert into customer_value_analysis values(1, 1, 2600, "RMB", 200, "RMB", 2);
insert into customer_value_analysis values(2, 2, 4100, "RMB", 0, "RMB", 0);
insert into customer_value_analysis values(3, 3, 9500, "RMB", 0, "RMB", 1);
insert into customer_value_analysis values(4, 4, 7830, "RMB", 0, "RMB", 0);

create table if not exists customer_value_analysis_201412 (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);
create table if not exists customer_value_analysis_201501 (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);
create table if not exists customer_value_analysis_201502 (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);
create table if not exists customer_value_analysis_201503 (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);
create table if not exists customer_value_analysis_201504 (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);
create table if not exists customer_value_analysis_201505 (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);
create table if not exists customer_value_analysis_201506 (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);
create table if not exists customer_value_analysis_201507 (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);
create table if not exists customer_value_analysis_201508 (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);
create table if not exists customer_value_analysis_201509 (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);
create table if not exists customer_value_analysis_201510 (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);
create table if not exists customer_value_analysis_201511 (
  id integer primary key not null auto_increment unique,
  customer_id integer not null unique,
  revenue integer not null,
  revenue_unit varchar(20) not null,
  default_amount integer not null,
  default_unit varchar(20) not null,
  default_times integer not null
);

insert into customer_value_analysis_201412 values(-1, -1, 500, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201501 values(-1, -1, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201502 values(-1, -1, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201503 values(-1, -1, 550, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201504 values(-1, -1, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201505 values(-1, -1, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201506 values(-1, -1, 550, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201507 values(-1, -1, 800, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201508 values(-1, -1, 900, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201509 values(-1, -1, 990, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201510 values(-1, -1, 800, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201511 values(-1, -1, 600, "RMB", 0, "RMB", 2);

insert into customer_value_analysis_201412 values(1, 1, 400, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201501 values(1, 1, 500, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201502 values(1, 1, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201503 values(1, 1, 200, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201504 values(1, 1, 200, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201505 values(1, 1, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201506 values(1, 1, 1000, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201507 values(1, 1, 500, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201508 values(1, 1, 300, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201509 values(1, 1, 200, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201510 values(1, 1, 500, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201511 values(1, 1, 100, "RMB", 0, "RMB", 2);

insert into customer_value_analysis_201412 values(2, 2, 900, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201501 values(2, 2, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201502 values(2, 2, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201503 values(2, 2, 500, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201504 values(2, 2, 900, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201505 values(2, 2, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201506 values(2, 2, 1000, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201507 values(2, 2, 500, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201508 values(2, 2, 700, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201509 values(2, 2, 500, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201510 values(2, 2, 500, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201511 values(2, 2, 400, "RMB", 0, "RMB", 2);

insert into customer_value_analysis_201412 values(3, 3, 900, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201501 values(3, 3, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201502 values(3, 3, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201503 values(3, 3, 500, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201504 values(3, 3, 900, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201505 values(3, 3, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201506 values(3, 3, 1000, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201507 values(3, 3, 2000, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201508 values(3, 3, 2200, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201509 values(3, 3, 1900, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201510 values(3, 3, 2500, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201511 values(3, 3, 2700, "RMB", 0, "RMB", 2);

insert into customer_value_analysis_201412 values(4, 4, 300, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201501 values(4, 4, 400, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201502 values(4, 4, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201503 values(4, 4, 500, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201504 values(4, 4, 300, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201505 values(4, 4, 600, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201506 values(4, 4, 1000, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201507 values(4, 4, 800, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201508 values(4, 4, 1000, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201509 values(4, 4, 1900, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201510 values(4, 4, 1500, "RMB", 0, "RMB", 2);
insert into customer_value_analysis_201511 values(4, 4, 900, "RMB", 0, "RMB", 2);

insert into order_record values(1, 1, 2, 13, 2, 203, "2014-12-10 14:00:00", "2014-12-10 18:00:00", "2014-12-10 16:32:00", "2014-12-12 10:12:00", 800, "RMB", 3, "");
insert into order_record values(2, 2, 1, 22, 1, 213, "2015-01-07 15:00:00", "2015-01-07 18:00:00", "2015-01-07 15:35:10", "2015-01-09 09:52:00", 700, "RMB", 3, "");
insert into order_record values(3, 3, 2, 17, 2, 122, "2015-03-20 14:00:00", "2015-03-20 18:00:00", "2015-03-20 17:39:05", "2015-03-25 08:43:00", 1800, "RMB", 3, "");
insert into order_record values(4, 1, 3, 10, 1, 409, "2015-06-10 14:00:00", "2015-06-10 18:00:00", "2015-06-10 15:56:00", "2015-06-12 11:33:00", 800, "RMB", 3, "");
insert into order_record values(5, 2, 2, 30, 3, 533, "2015-09-07 14:00:00", "2015-09-07 18:00:00", "", "", 0, "RMB", 4, "Cancel journey");

insert into income_report values(1, 2014, 221000, 640000, 115000, 245000, 93000, 103000, 25000, 45000, 12000, 64000, 9000, 24000, 8000);

insert into room_report values( 1, 2014, 12, 2, 6010, 450, 53000);
insert into room_report values( 2, 2015,  1, 2, 8303, 600, 93000);
insert into room_report values( 3, 2015,  2, 2, 7300, 530, 75000);
insert into room_report values( 4, 2015,  3, 2, 6200, 450, 52000);
insert into room_report values( 5, 2015,  4, 2, 5700, 430, 48000);
insert into room_report values( 6, 2015,  5, 2, 5450, 440, 49000);
insert into room_report values( 7, 2015,  6, 2, 5500, 450, 51000);
insert into room_report values( 8, 2015,  7, 2, 6000, 450, 56000);
insert into room_report values( 9, 2015,  8, 2, 7200, 480, 61000);
insert into room_report values(10, 2015,  9, 2, 7800, 580, 83000);
insert into room_report values(11, 2015, 10, 2, 6000, 450, 57000);
insert into room_report values(12, 2015, 11, 2, 6600, 460, 66000);


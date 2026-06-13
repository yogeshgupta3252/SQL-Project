-- Customer purchase history analysis
create database cpha;
use cpha;
create table customers
(customer_id int primary key, 
first_name varchar(40),
last_name varchar(40),
email varchar(40),
city varchar(40),
create_at date);

create table products
(product_id int primary key,
name varchar(40),
category varchar(40),
unit_price decimal(10,2)
);

create table orders
( order_id int primary key,
order_date date,
customer_id int,
product_id int,
quantity int check(quantity>0),
constraint fk_customer foreign key (customer_id) references customers(customer_id),
constraint fk_product foreign key (product_id) references products(product_id));
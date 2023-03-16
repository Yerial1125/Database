-- drop database if exists marketdb;
create database marketdb default charset utf8mb4;

use marketdb;

create table membertype (
	membertype_id int not null primary key,
    membertype varchar(5) not null
);

create table customer ( 
	customer_id int not null primary key,
	customer_name varchar(45),
	birthdaty date,
	membertype_id int not null,
	constraint FK_customer_membertype foreign key (membertype_id)	references membertype(membertype_id)
);

create table product(
	product_id int not null primary key,
    product_name varchar(20) not null,
    stock int default 0 check(stock >= 0),
    price int default 0 check(price >= 0)
);

create table productorder(
	order_id int not null primary key auto_increment,
    customer_id int not null,
    product_id int not null,
    quantity int not null,
    price int not null,
    order_time datetime,
    constraint FK_order_customer foreign key (customer_id)	references customer(customer_id),
    constraint FK_order_product foreign key (product_id)	references product(product_id)
);
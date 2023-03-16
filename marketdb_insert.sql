-- sql문을 사용하여 테이블에 데이터 입력하기

use marketdb;
-- describe membertype;

-- membertype 테이블 데이터 입력
insert into membertype (membertype_id, membertype)
	values (1, '보통 회원');
insert into membertype
	values (2, '할인 회원');

select * from membertype;

-- customer 테이블 데이터 입력
insert into customer 
	values (1, '김바람', '1984-06-24', 2),
		(2, '이구름', '1990-07-16', 1),
        (3, '박하늘', '1976-03-09', 2),
        (4, '강산', '1991-05-04', 1),
        (5, '유바다','1993-04-21',2);
        
select * from customer;


-- product 테이블 데이터 입력
insert into product
	values (1, '약용 입욕제', 100, 70),
		(2, '약용 핸드솝', 23, 700),
        (3, '천연 아로마 입욕제', 4, 120),
        (4, '거품 목욕제', 23, 120);
        
select * from product;

-- productorder 테이블 데이터 입력
insert into productorder (customer_id, product_id, quantity, price, order_time)
	values (4,1,12,840,'2019-10-13 12:01:34'),
			(5,3,5,600,'2019-10-13 18:11:05'),
            (2,2,2,1400,'2019-10-14 10:43:54'),
            (3,2,1,700,'2019-10-15 23:15:09'),
            (1,4,3,360,'2019-10-15 23:37:11'),
            (5,2,1,700,'2019-10-16 01:23:28'),
            (1,4,2,300,'2019-10-18 12:42:50');
            
select * from productorder;


update product 
	set product_name='입욕제' 
	where product_id = 1 ; 

insert into product
	values (6, '오일 클렌저', 15, 100);

delete from product where product_name='오일 클렌저';
select * from product;
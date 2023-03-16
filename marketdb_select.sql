use marketdb;
/*
-- 컬럼명에 별명을 줌 : 한글이름 가능 (띄어쓰기 불가, 띄어쓰기 쓰려면 '  ' 사용)
select product_name as 상품명,
	product_id as 상품ID 
    from product;

-- distinct : 유일한 값만 추출
select distinct customer_id as 고객ID
	from productorder;

-- where문을 이용한 조건 검색 : and, or
select customer_id, price from productorder
	where price >= 700 and price <= 1000;

-- between and 를 이용한 조건검색(범위)
select * from productorder 
	where price between 700 and 1000;

-- in, not in 
select * from productorder 
	where product_id in (1,2);

select * from productorder 
	where product_id not in (1,4);

-- is null, is not null의 요소 검색
insert into product (product_id, product_name) 
	values(5, '클렌저' );

update product 
	set stock=null 
	where product_name='클렌저';

select * from product 
	where stock is null ;
    
select * from product 
	where stock is not null ;

-- like 패턴매칭 : 와일드카드 문자 % _(문자개수) 사용
select * from product
	where product_name like '입욕제';

select * from product
	where product_name like '%입욕제';
    
select * from product
	where product_name like '%아로마%';

-- 3글자로 된 데이터 불러오기
select * from product
	where product_name like '___';
    
select * from product
	where product_name not like '___';

-- = : <=>(null 포암), != : <>
-- 결과값이 참이면 1, 거짓이면 0, null을 반환

 select 1<=>2, 1<>2, 2<2, 2<=2, 2>1, 2>=2;
 select null = null; -- null 반환
 select null <=> null; -- 1 반환
 
 select 1 = null, 1<=>null, null <=> null, 1 != null, 1 <> null, 1< null;
 
select 1= true, 1=false, 100 = true, 1 is true, 1 is not true,
	0 is false, 0 is not false;

-- 문자열
create table sample(
	id int, val varchar(5)
);

insert into sample
	values (1, 'A'), (2,'a'), (3,'A '), (4,'B');

select * from sample
	where val = 'A'; -- A, a 
select * from sample
	where val = binary 'A'; -- A
select * from sample
	where val like 'A';  -- A, a

-- escape 문자 : \
insert into product 
	values (7, '100%우유 입욕제', 15, 140), 
		(8, '비누 딸기100%', 10, 150);

select * from product
	where product_name like '%100\%%' ;

select * from customer
	where birthday > '1990-01-01';

select * from product
	where stock * price > 5000;

select product_name, stock*price as 자산 from product;

-- order by : 정렬
select * from product
	order by stock;

select * from productorder
	where price >= 500
	order by customer_id, product_id desc; -- customer id는 오름차순, product_id는 내림차순

-- 한글 > 영문 > 숫자 순으로 정렬
-- 영문 대문자 : 65-90 소문자 : 97-122
-- 숫자 0-9 : 48-57
select * from product
	order by
		(case when ascii(substring(product_name, 1)) between 48 and 57 then 3
			when ascii(substring(product_name, 1)) < 122 then 2 
            else 1 end), product_name ;

select order_id, customer_id, 
	case
		when price < 500 then '하'
        when price between 501 and 1000 then '중'
        else '상' 
	end as price_level
from productorder;

-- limit : 출력 개수 제한
select * from productorder
	limit 3,5;

-- 집계 함수 적용
select count(*) as 총개수 from productorder;
select min(quantity) as 최소주문량, 
		max(quantity) as 최대주문량, 
        avg(quantity) as 평균주문량, 
        sum(quantity) as 총주문량
        from productorder;

select '집계', count(stock) from product; -- null값 제외
select avg(stock), min(stock) from product;

-- group by 
select product_id, customer_id, sum(quantity), round(avg(quantity),1), min(quantity), count(quantity) 
	from productorder
	group by product_id, customer_id
    order by product_id;

select product_id, sum(quantity) as '총주문량'
	from productorder
	group by product_id
    order by '총주문량'; -- 정렬 안됨!!

-- with rollup : 맨 마지막 행에 추가..?    
select product_id, sum(quantity) as 총주문량
	from productorder
	group by product_id
    with rollup
    order by 총주문량; -- 정렬 됨!!
*/
use shopdb;

create table product (
 	prdNo varchar(10) not null primary key,
    prdName varchar(30) not null,
    prdPrice int,
	prdCompany varchar(30)
);

create table product1 (
 	prdNo varchar(10) not null,
	prdName varchar(30) not null,
    prdPrice int,
    prdCompany varchar(30),
    constraint PK_product_prdNo primary key (prdNo)
);

create table product2 (
 	prdNo varchar(10) not null,
	prdName varchar(30) not null,
    prdPrice int,
    prdCompany varchar(30),
    primary key (prdNo)
);


create table publisher(
	pubNo varchar(10) not null primary key,
	pubName varchar(30) not null
 );

create table book (
	bookNo varchar(10) not null primary key,
    bookName varchar(30) not null,
    bookPrice int default 10000 check(bookPrice > 1000),
    bookDate date,
    pubNo varchar(10) not null,
    constraint FK_book_publisher foreign key(pubNo) references publisher (pubNo)
);

create table book2 (
	bookNo varchar(10) not null primary key,
    bookName varchar(30) not null,
    bookPrice int default 10000 check(bookPrice > 1000),
    bookDate date,
    pubNo varchar(10) not null,
    foreign key(pubNo) references publisher (pubNo)
);
    
create database sqldb default charset utf8mb4;

use sqldb;

-- 학생 stdent, 학과 department 테이블을 생성하고 각각 3개씩 데이터를 입력
-- 기본키 지정
-- 학생은 학과에 소속
-- 학생이름과 학과이름은 null 허용하지 않음
-- 학년은 4를 기본값으로 범위는 1~4 설정

create table department(
	depCode char(10) not null primary key,
    depName varchar(15) not null,
    depTel varchar(15)
);

create table student(
	stdId varchar(10) not null primary key,
    stdName varchar(15) not null,
    stdYear int default 4 check(stdYear>=1 and stdYear<=4),
    stdAddr varchar(40),
    stdBirth date,
    depCode char(10) not null,
    constraint FK_std_depart foreign key(depCode) references department(depCode)
);


CREATE TABLE professor (
	proNo CHAR(10) NOT NULL PRIMARY KEY,
    proName VARCHAR(30) NOT NULL,
    proPhone CHAR(20),
    depCode CHAR(10) NOT NULL,
    CONSTRAINT FK_pro_department FOREIGN KEY (depCode) REFERENCES department (depCode)
);

CREATE TABLE course (
	courseCode CHAR(10) NOT NULL PRIMARY KEY,
    courseName VARCHAR(30) NOT NULL,
    courseCredit INT DEFAULT 3 CHECK (courseCredit >= 1 and courseCredit <= 6),
    proNo CHAR(10) NOT NULL,
    CONSTRAINT FK_course_professor FOREIGN KEY (proNo) REFERENCES professor (proNo)
);

create table scores(
	stdNo char(10) not null, 
    courseCode char(10) not null,
    score int default 0 not null check(score >=0 and score <= 100),
    grade char(10) not null,
	foreign Key (stdNo) references student(stdId),
    foreign Key (courseCode) references course(courseCode),
    primary key (stdNo, courseCode)
);
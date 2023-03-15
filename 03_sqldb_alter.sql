use sqldb;
/*
create table board(
	boardNo int auto_increment not null primary key,
    boardTitle varchar(30) not null,
    boardAuthor varchar(20),
    boardContent varchar(100) not null
);

alter table board auto_increment = 100;
set @@auto_increment_increment =3;

alter table student add stdTel varchar(13) 
alter table student add (stdAge varchar(2), stdAddress varchar(50));

alter table student modify stdAge int;
alter table student modify stdName varchar(20) null ;

alter table student rename column stdTel to stdHP;

alter table student change stdAddress stdAddress1 varchar(30); 

alter table student drop column stdHP;
alter table student drop stdAge,
					drop stdAddress1; 
describe student;


-- 외래키 제약조건을 먼저 삭제해야 주키를 삭제할 수 있음
alter table student drop constraint FK_std_depart;
alter table professor drop constraint FK_pro_department;
alter table professor drop foreign key;
alter table department drop primary key;

-- 주키 제약 조건 추가 : department
alter table department add constraint PK_depart_depCode primary key (depCode);
-- (또는) alter table department add primary key (depCode); 

-- 외래키 제약 조건 추가 : student professor
alter table student add constraint FK_student_department foreign key (depCode) references department (depCode);
alter table professor add constraint FK_professor_department foreign key (depCode) references department (depCode);

-- 기본키로 정보 삭제시 이를 참조하는 외래키 데이터도 자동 삭제하는 설정
-- on delete cascade
alter table student 
	drop constraint FK_student_department;

alter table student
	add constraint FK_student_department 
    foreign key (depCode) references department (depCode)
    on delete cascade
    on update cascade;

-- alter table department drop column depCode ;   
describe student;
*/
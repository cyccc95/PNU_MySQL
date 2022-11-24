create table 학생 (
	학생번호 int not null primary key,
    학생이름 varchar(10) not null,
    주소 varchar(30) not null,
    학과 varchar(10) not null
);

create table 학과 (
	학과 varchar(10) not null primary key,
    학과사무실 varchar(10) not null
);

create table 강의 (
	강좌이름 varchar(10) not null primary key,
    강의실 varchar(10) not null
);

create table 성적 (
	학생번호 int not null,
    강좌이름 varchar(10),
    성적 float not null
);

alter table 성적
	add constraint 성적_학생번호_fk foreign key (학생번호)
    references 학생 (학생번호);
    
alter table 성적
	add constraint 성적_강좌이름_fk foreign key (강좌이름)
    references 강의 (강좌이름);
    
alter table 학생
	add constraint 학생_학과_fk foreign key (학과)
    references 학과 (학과);

-- 학과 data 입력
insert into 학과 (학과, 학과사무실) values ('컴퓨터공학과','공학관101');
insert into 학과 (학과, 학과사무실) values ('체육학과','체육관101');
insert into 학과 (학과, 학과사무실) values ('로봇학과','과학관101');
insert into 학과 (학과, 학과사무실) values ('전자공학과','공학관102');
insert into 학과 (학과, 학과사무실) values ('기계공학과','기계관101');

-- 강의 data 입력
insert into 강의 (강좌이름, 강의실) values ('데이터베이스','공학관110');
insert into 강의 (강좌이름, 강의실) values ('스포츠경영학','체육관103');
insert into 강의 (강좌이름, 강의실) values ('자료구조','공학관111');
insert into 강의 (강좌이름, 강의실) values ('전자회로','공학관112');
insert into 강의 (강좌이름, 강의실) values ('컴퓨터구조','공학관111');
insert into 강의 (강좌이름, 강의실) values ('일반물리학','기계관110');


-- 학생 data 입력
insert into 학생 (학생번호, 학생이름, 주소, 학과) values (501, '박지성', '영국 맨체스타', '컴퓨터공학과');
insert into 학생 (학생번호, 학생이름, 주소, 학과) values (401, '김연아', '대한민국 서울', '체육학과');
insert into 학생 (학생번호, 학생이름, 주소, 학과) values (402, '장미란', '대한민국 강원도', '체육학과');
insert into 학생 (학생번호, 학생이름, 주소, 학과) values (502, '추신수', '미국 텍사스', '컴퓨터공학과');
insert into 학생 (학생번호, 학생이름, 주소, 학과) values (403, '손흥민', '영국 토트넘', '로봇학과');

-- 성적 data 입력
insert into 성적(학생번호, 강좌이름, 성적) values (501, '데이터베이스', 3.5);
insert into 성적(학생번호, 강좌이름, 성적) values (401, '데이터베이스', 4.0);
insert into 성적(학생번호, 강좌이름, 성적) values (402, '스포츠경영학', 3.5);
insert into 성적(학생번호, 강좌이름, 성적) values (502, '자료구조', 4.0);
insert into 성적(학생번호, 강좌이름, 성적) values (501, '자료구조', 3.5);
insert into 성적(학생번호, 강좌이름, 성적) values (403, '데이터베이스', 4.0);
insert into 성적(학생번호, 강좌이름, 성적) values (403, '자료구조', 4.0);
insert into 성적(학생번호, 강좌이름, 성적) values (403, '스포츠경영학', 4.0);

-- -------------------------------------------------------------------------
select * from 강의;
select * from 성적;
select * from 학과;
select * from 학생;

drop table 강의;
drop table 성적;
drop table 학생;
drop table 학과;

call selectAll();
call selectTable(1);
call selectTable(2);
call selectStudent(403);


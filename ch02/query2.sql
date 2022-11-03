-- DB bakup
-- export / import
-- Administration -> Data Export
-- Administration -> Data Import/Restore
-- import할 때 기존의 export 했던 db와 이름이 같은 db가 있어야함

-- index 만들기
create index idx_name on member(name); -- member table의 name column에 idx_name이라는 index 만듦

-- view
-- DB 선택 -> Views 우클릭
-- create view 'new_view' AS select name from member; -- 보고 싶은 정보들만 골라서 table 따로 만들 수 있음

-- stored procedure
-- DB 선택 -> Stored Procedures 우클릭
-- 여러 쿼리문을 쓸 수 있음
-- CREATE PROCEDURE `new_procedure` ()
-- BEGIN
-- select * from s;
-- select city from s where status > 20;
-- END
-- call new_procedure();
-- DELIMITER : 구분자 변경하는데 사용

-- trigger
-- 자동으로 동작하게 만들 때 사용
-- 테이블 선택해서 가운데 공구 버튼

CREATE table emp (
	eno char(4) not null,
    ename varchar(12) null,
    dno char(4) null,
    salary varchar(45) null,
    primary key (eno)
);

create table dept (
	dno char(4) not null,
    dname varchar(12) not null,
    budget int not null,
    primary key (dno)
);

create table deletedDept (
	dno char(4) not null,
    dname varchar(12) not null,
    budget int not null,
    primary key (dno)
);

-- CREATE DEFINER = CURRENT_USER TRIGGER `pnusw06db`.`dept_BEFORE_DELETE` BEFORE DELETE ON `dept` FOR EACH ROW
-- BEGIN
-- 	insert into deletedDept values(old.dno, old.dname, old.budget);
-- END


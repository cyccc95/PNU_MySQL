-- 실습

-- 1번

CREATE TABLE 고객 (
	고객아이디  VARCHAR(20)	 NOT NULL,
	고객이름    VARCHAR(10)	 NOT NULL,
	나이	    INT,
	등급	    VARCHAR(10)	 NOT NULL,
	직업	    VARCHAR(20),
	적립금	    INT   DEFAULT 0,
	PRIMARY KEY(고객아이디)
);

CREATE TABLE  제품 (
	제품번호   CHAR(3)   NOT NULL,
	제품명     VARCHAR(20),
	재고량     INT,
	단가       INT,
	제조업체   VARCHAR(20),
	PRIMARY KEY(제품번호),
	CHECK (재고량 >= 0 AND 재고량 <=10000)
);

CREATE TABLE  주문 (
	주문번호   CHAR(3) NOT NULL,
	주문고객   VARCHAR(20),
	주문제품   CHAR(3),
	수량       INT,
	배송지     VARCHAR(30),
	주문일자   DATE,
	PRIMARY KEY(주문번호),
	FOREIGN KEY(주문고객)   REFERENCES   고객(고객아이디),
	FOREIGN KEY(주문제품)   REFERENCES   제품(제품번호)
);

CREATE TABLE 판매자 (
	판매자번호  VARCHAR(20)	 NOT NULL,
	이름    VARCHAR(10)	 NOT NULL,	
	수수료	    DOUBLE,
	PRIMARY KEY(판매자번호)
);

-- [고객 테이블에 투플 삽입]
INSERT INTO 고객 VALUES ('apple', '정소화', 20, 'gold', '학생', 1000),('banana', '김선우', 25, 'vip', '간호사', 2500)
,('carrot', '고명석', 28, 'gold', '교사', 4500),('orange', '김용욱', 22, 'silver', '학생', 0)
,('melon', '성원용', 35, 'gold', '회사원', 5000),('peach', '오형준', NULL, 'silver', '의사', 300)
,('pear', '채광주', 31, 'silver', '회사원', 500);

-- [제품 테이블에 투플 삽입]
INSERT INTO 제품 VALUES ('p01', '그냥만두', 5000, 4500, '대한식품'),('p02', '매운쫄면', 2500, 5500, '민국푸드')
,('p03', '쿵떡파이', 3600, 2600, '한빛제과'),('p04', '맛난초콜릿', 1250, 2500, '한빛제과')
,('p05', '얼큰라면', 2200, 1200, '대한식품'),('p06', '통통우동', 1000, 1550, '민국푸드')
,('p07', '달콤비스킷', 1650, 1500, '한빛제과');

-- [주문 테이블에 투플 삽입]
INSERT INTO 주문 VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', '22/01/01')
,('o02', 'melon', 'p01', 5, '인천시 계양구', '22/01/10'),('o03', 'banana', 'p06', 45, '경기도 부천시', '22/01/11')
,('o04', 'carrot', 'p02', 8, '부산시 금정구', '22/02/01'),('o05', 'melon', 'p06', 36, '경기도 용인시', '22/02/20')
,('o06', 'banana', 'p01', 19, '충청북도 보은군', '22/03/02'),('o07', 'apple', 'p03', 22, '서울시 영등포구', '22/03/15')
,('o08', 'pear', 'p02', 50, '강원도 춘천시', '22/04/10'),('o09', 'banana', 'p04', 15, '전라남도 목포시', '22/04/11')
,('o10', 'carrot', 'p03', 20, '경기도 안양시', '22/05/22');

-- [판매자 테이블에 투플 삽입]
INSERT INTO 판매자 VALUES ('A005', '박찬호', 1000),('banana', '김선우', 2500)
,('carrot', '고명석', 4500),('orange', '김용욱', 0);

-- 2번
CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);

-- 3번
create table memberTBL (
	memberID		varchar(8)	not null,
    memberName		varchar(5)	not null,
    memberAddress 	varchar(20)
);

create table productTBL (
	productName	varchar(4)	not null,
    cost 		int			not null,
    makeDate 	date,
    company 	varchar(5),
    amount		int			not null
    );
    
-- 4번
insert into memberTBL values ('Dang','당당이','경기 부천시 중동')
,('Jee','지은이','서울 은평구 증산동'),('Han','한주연','인천 남구 주안동')
,('Sang','상길이','경기 성남시 분당구');

insert into productTBL values ('컴퓨터',10,'20210101','삼성',17)
,('세탁기',20,'20220901','LG',3),('냉장고',5,'20230201','대우',22);

-- 5번
create table indexTBL (
	first_name	varchar(14),
    last_name	varchar(16),
    hire_date	date
);

insert into indexTBL 
	select first_name, last_name, hire_date
    from employees
    limit 500;

-- 인덱스 생성 전    
select * from indexTBL where first_name = 'Mary';
-- 인덱스 생성
create index idx_indexTBL_firstname ON indexTBL(first_name);
-- 인덱스 생성 후
select * from indexTBL where first_name = 'Mary';


-- 6번
-- CREATE VIEW `memberTBL_view` AS select memberID, memberAddress from memberTBL;

-- 7번
-- CREATE PROCEDURE `myProc` ()
-- BEGIN
-- 	select * from memberTBL where memberName = '당당이';
--     select * from productTBL where productName = '냉장고';
-- END
call myProc();

-- 8-1번
create table deletedMemberTBL (
	memberID		char(8),
    memberName		char(5),
    memberAddress	char(20),
    deletedDate 	date
);

-- 8-2번
-- memberTBL 중간 도구 모양 아이콘 -> trigger -> before delete
-- CREATE DEFINER = CURRENT_USER TRIGGER `pnusw06db`.`memberTBL_BEFORE_DELETE` BEFORE DELETE ON `memberTBL` FOR EACH ROW
-- BEGIN
-- 	insert into deletedMemberTBL values (old.memberID, old.memberName, old.memberAddress, curdate());  curdate() 말고 current_timestamp도 가능
-- END

delete from memberTBL where memberID = 'Dang';



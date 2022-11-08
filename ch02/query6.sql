-- 실습문제 sqlDB

-- sqldb 데이터베이스 선택
use sqldb;

-- usertbl 테이블에서 전체 컬럼 조회
select * from usertbl;

-- usertbl 테이블에서 이름과 주소 검색
select name, addr from usertbl;

-- usertbl 테이블에서 김경호를 검색
select name from usertbl where name = '김경호';

-- usertbl 테이블에서 키가 177보다 큰 사람의 이름과 키를 검색
select name, height from usertbl where height > 177;

-- 1970년 이후에 출생하고 키가 182 이상인 사람의 아이디와 이름을 검색
select userID, name from usertbl where birthYear >= 1970 and height >= 182;

-- 1970년 이후에 출생했거나 키가 182 이상인 사람의 아이디와 이름을 검색
select userID, name from usertbl where birthYear >= 1970 or height >= 182;

-- 키가 180~183인 사람의 이름과 키를 검색(and 및 between으로 검색)
select name, height from usertbl where height between 180 and 183;

-- 지역(addr)이 경남, 전남, 경북인 사람의 이름과 지역을 검색하시오. (or 및 in으로 검색)
select name, addr from usertbl where addr in ('경남','전남','경북');

-- 김씨인 사람의 이름과 키를 검색
select name, height from usertbl where name like '김%';

-- 김씨가 아닌 사람들의 이름과 키를 검색
select name, height from usertbl where name not like '김%';

-- 이름이 종신인 사람의 이름과 키를 검색
select name, height from usertbl where name like '%종신';

-- 김경호 키보다 큰 사람의 이름과 키를 검색. (서브쿼리)
select name, height from usertbl where height > (select height from usertbl where name = '김경호');

-- 먼저 가입한 순서대로 회원의 이름과 가입일(mDate)을 검색
select name, mDate from usertbl order by mDate; 

-- 최근에 가입한 순서대로 회원의 이름과 가입일(mDate)을 검색
select name, mDate from usertbl order by mDate desc; 

-- 키가 큰 순서대로 정렬하되 키가 같을 경우 이름 순서대로 회원의 이름과 키을 검색
select name, height from usertbl order by height desc, name;
 
-- 주소가 1개씩만 출력(중복X)
select distinct addr from usertbl;

-- buytbl; 테이블에서 사용자별로 이름, 수량(amount)의 합계를 검색
select userid, sum(amount) from buytbl group by userid;

-- 위의 문제에서 userID는 ‘사용자아이디’ SUM(amount)는 ‘총 구매 개수’로 출력
select userid as '사용자아이디', sum(amount) as '총 구매 개수' from buytbl group by userid;

-- buytbl; 테이블에서 사용자별로 이름, 총구매액(amount*price)을 검색
select userid, sum(amount * price) from buytbl group by userid;

-- buytbl; 테이블에서 사용자별로 이름, 총구매액(amount*price)이 1000 이상인 사용자를 검색
select userid, sum(amount * price) from buytbl group by userid having sum(amount * price) >= 1000 ;

-- buytbl; 테이블에서 사용자별로 이름, 총구매액(amount*price)이 1000 이상인 사용자를 구매액이 적은 사람부터 출력
select userid, sum(amount * price) from buytbl group by userid having sum(amount * price) >= 1000 order by 2;

-- 전체 구매자가 구매한 물품수량(amount)의 평균을 검색(컬럼명은 ‘평균구매개수’로 출력)
select avg(amount) as '평균구매개수' from buytbl;

-- 각 사용자별로 평균구매개수를 검색하여 사용자아이디, 평균구매개수 출력
select userid, avg(amount) from buytbl group by userid;

-- usertbl; 테이블에서 가장 큰 키값과 가장 작은 키값을 출력
select max(height), min(height) from usertbl;

-- usertbl; 테이블에서 휴대폰이 있는 사람의 수를 ‘휴대폰이 있는 사용자’로 출력
select count(userid) as '휴대폰이 있는 사용자' from usertbl where mobile1 is not null;

-- 물품을 구매한 회원의 이름, 주소, 연락처 정보를 출력
select distinct u.name, u.addr, u.mobile1, u.mobile2 from usertbl u inner join buytbl b on u.userid = b.userid;

-- 구매한 회원중에 BBK라는 아이디를 가진 회원의 이름, 주소, 연락처를 검색
select name, addr, mobile1, mobile2 from usertbl where userid = (select distinct u.userid from usertbl u inner join buytbl b on u.userid = b.userid and u.userid = 'BBK');


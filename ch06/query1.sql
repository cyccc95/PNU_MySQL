-- 1104 실습 --
-- 1번
select 이름 from 학생;

-- 2번
select 이름, 전화번호 from 교수;

-- 3번
select * from 수강신청;

-- 4번
select 이름 from 학생 where 학번 not in
	(select distinct 학번 from 수강신청 where 연도 = '2018' and 학기 = 1);

-- 5번
select 과목명 from 과목 
	where 과목번호 in (select 과목번호 from 수강신청내역
    where 수강신청번호 = (select 수강신청번호 from 수강신청
    where 연도 = '2018' and 학기 = 1 and 학번 = (select 학번 from 학생
    where 이름 = '김민준')));

-- 6번
select 이름 from 학생 order by 이름;

-- 7번
select 시도, 이름 from 학생 order by 시도, 이름;
    
-- 8번
select 시도, 이름 from 학생 order by 시도 DESC, 이름;

-- 9번
select 시도, 이름 from 학생 order by 시도 DESC, 이름 DESC;

-- 10번
select 수강신청번호, 학번, 날짜 from 수강신청 where 학번 = '1801001';

-- 11번
select 수강신청번호, 학번, 날짜 from 수강신청 where 연도 = '2016';

-- 12번
select 과목번호, 과목명, 시수 from 과목 where 시수 in (1,2,3);

-- 13번
select 이름, 학과 from 교수 where 전화번호 is null;

-- 14번
select 학번, 날짜 from 수강신청 where 연도 = '2018' and 학기 = 1;

-- 15번
select 이름, 전자우편, 전화번호 from 교수 where 전화번호 is not null;

-- 16번
select * from 수강신청 where 학번 = '1601001' and 연도 = '2016';

-- 17번
select * from 수강신청 where 학번 in ('1601002','1801002');

-- 18번
select * from 수강신청 where 학번 in ('1601001','1601002') and 연도 = '2016';

-- 19번
select * from 수강신청 where 학번 in ('1601001','1601002');

-- 20번
select * from 수강신청 where 학번 != '1601001';

-- 21번
select * from 교수 where 이름 like '김%';

-- 22번
select * from 학과 where 학과명 like '%공학%';

-- 23번
select 과목번호, 과목명, 영문명 from 과목 where 영문명 like 'C%e';

-- 24번
select * from 학생 where 이름 like '__준';

-- 25번
select 수강신청번호, 과목번호, 평점 from 수강신청내역
	where 과목번호 in ('K20045','K20056') and 평점 = 3;

-- 26번
select 수강신청번호, 과목번호, 평점 from 수강신청내역
	where 과목번호 in ('K20045','K20056','Y00132') order by 과목번호;

-- 27번
select  * from 수강신청내역 where 평점 != -1;

-- 28번
select 학번, 이름, 시도 from 학생 where 학번 like '18%';

-- 29번
select 학번, 이름, 시도, 시군구 from 학생 where 시군구 like '%구';

-- 30번
select 과목번호, 과목명, 영문명 from 과목 where 영문명 like 'I%n';

-- 31번
select 과목번호, 과목명, 영문명 from 과목 where 과목명 like '컴퓨터__';

-- 32번
select 학번, 학과, 이름, 시도 from 학생 where 이름 like '%서%';

-- 33번 
select concat(이름,' ','(',우편번호,' ', 시군구,' ', 시도,' ',주소,')')
	as '학생정보' from 학생 order by 이름;

-- 34번
select 과목명, 담당교수 as '담당교수사번' from 과목;

-- 35번 
select 수강신청번호, concat(연도,'학년도-',학기,'학기') from 수강신청 where 학번 = '1801001';

-- 36번
select 학번, 이름, left(이름,1) as '성' from 학생;

-- 37번
select 학번, 이름, 학년 from 학생 where 학번 like '16%';

-- 38번
select 수강신청번호, 학번, 날짜 from 수강신청
 where 학번 = (select 학번 from 학생 where 학과
 in (select 학과번호 from 학과 where 학과명 != '컴퓨터정보학과')); 
	
-- 39번
select 수강신청번호, 학번, 날짜 from 수강신청 where 연도 = '2018' and 학기 = 1;

-- 40번
select 수강신청번호, 과목번호, 평점, if(평점 > 0, '취득', '미취득')
	as '취득여부' from 수강신청내역 where 평점 >= 0; 

-- 41번
select concat(이름,'(',시도,')') as '이름' from 학생;

-- 42번
select 담당교수, concat(과목명,' (',영문명,')') as 과목명 from 과목 order by 과목명;

-- 43번
select 과목명, 학점, 시수 * 15 as '총시간수' from 과목 order by 과목명;

-- 44번
select 학번, right(이름,2) from 학생;

-- 45번
select 학번, 날짜 from 수강신청 where date_format(날짜,'%m-%d') = '03-01';

-- 46번
select 학번, 이름, 학과, if(학과 = '01','컴퓨터정보학과','타과') from 학생;

-- 47번
select count(수강신청번호) as '신청수' from 수강신청내역;

-- 48번
select count(수강신청번호) as '과목수' from 수강신청내역 where 수강신청번호 = '1810002';

-- 49번
select count(사번) as '교수 수' from 교수 where 전화번호 is not null;

-- 50번
select count(distinct 담당교수) as '강의 교수 수' from 과목;

-- 51번
select avg(학점) as '평군학점', sum(학점) as '총학점' from 과목;

-- 52번
select max(학점) as '최대학점', min(학점) as '최소학점' from 과목;

-- 53번
select 담당교수, count(과목번호) as '과목수', sum(학점) as '학점수' from 과목
	group by 담당교수;

-- 54번
select count(distinct 과목번호) as '과목 수' from 수강신청내역;

-- 55번
select count(distinct 학번) as '학생 수' from 수강신청;

-- 56번
select count(과목번호) as '과목 수', avg(평점) as '평균학점'
	from 수강신청내역 where 수강신청번호 = '1810001';

-- 57번
select distinct 과목번호, count(수강신청번호) as '수강자 수'
	from 수강신청내역 group by 과목번호;

-- 58번
 select distinct 과목번호, count(수강신청번호) as '수강자 수'
	from 수강신청내역 where 평점 != -1 group by 과목번호;
 
 -- 59번
 select distinct 과목번호, count(수강신청번호) as '수강자 수', avg(평점) as '평균평점'
	from 수강신청내역 where 평점 != -1 group by 과목번호;
 
 -- 60번
 select distinct 과목번호, count(수강신청번호) as '수강자 수', avg(평점) as '평균평점'
	from 수강신청내역 where 평점 != -1 group by 과목번호 having count(수강신청번호) >= 4;
    
-- 61번
 select distinct 과목번호, count(수강신청번호) as '수강자 수', avg(평점) as '평균평점'
	from 수강신청내역 where 평점 != -1 group by 과목번호 having count(수강신청번호) >= 4
    order by 3;
    
-- 62번
select 수강신청번호, count(과목번호) as '수강과목 수', avg(평점) as '평균평점'
	from 수강신청내역 group by 수강신청번호 having count(과목번호) >= 3
    and avg(평점) > 0 order by 3 DESC;
    
-- 63번
select s.학번, s.학과, s.이름, c.학과명 from 학생 s, 학과 c where s.학과 = c.학과번호;

-- 64번
select a.수강신청번호, a.과목번호, b.과목명 from 수강신청내역 a, 과목 b 
	where a.과목번호 = b.과목번호 and 수강신청번호 in ('1810001','1610001');
    
-- 65번
select a.수강신청번호, a.학번, b.이름 from 수강신청 a, 학생 b
	where a.학번 = b.학번 and 수강신청번호 like '18%' order by 1;
    
-- 66번 = 67번
select a.수강신청번호, a.과목번호, b.과목명 from 수강신청내역 a, 과목 b
	where a.과목번호 = b.과목번호 
    and 수강신청번호 in (select 수강신청번호 from 수강신청 where 학번 = '1801001');

-- 68번
select count(distinct 과목번호) as '과목수', sum(평점) from 수강신청내역
	where 수강신청번호 in (
    select 수강신청번호 from 수강신청 where 학번 = '1801001'
    );
    
-- 69번
select b.수강신청번호, a.학번, a.이름, avg(c.평점) as '평균평점' from 학생 a, 수강신청 b, 수강신청내역 c
	where a.학번 = b.학번 and b.수강신청번호 = c.수강신청번호 and c.평점 >= 0
    group by b.수강신청번호;

-- 70번
select a.학번, a.학과, a.이름, b.학과명 from 학생 a inner join 학과 b
	on a.학과 = b.학과번호;

-- 71번
select a.수강신청번호, a.과목번호, b.과목명 from 수강신청내역 a inner join 과목 b
	on a.과목번호 = b.과목번호 and a.수강신청번호 in ('1810001','1610001');

-- 72번
select a.수강신청번호, a.학번, b.이름 from 수강신청 a inner join 학생 b
	on a.학번 = b.학번 and a.수강신청번호 like '18%' order by 1;
    
-- 73번
select a.수강신청번호, a.과목번호, b.과목명 from 수강신청내역 a inner join 과목 b
	on a.과목번호 = b.과목번호 and a.수강신청번호
	in (select 수강신청번호 from 수강신청 where 학번 = '1801001');
    
-- 74번
select a.사번, a.학과, a.이름 from 교수 a inner join 교수 b
	on b.사번 = '1000004' and a.학과 = b.학과;
    
-- 75번
select a.학번, a.이름, count(b.과목번호) as '과목수', avg(b.평점) as '평균평점'
	from 학생 a, 수강신청내역 b, 수강신청 c
	where a.학번 = c.학번 and b.수강신청번호 = c.수강신청번호 and b.평점 >= 0
	group by a.학번;

-- 76번
select a.과목번호, a.과목명, count(b.수강신청번호), avg(b.평점) from 과목 a inner join 수강신청내역 b
	on a.과목번호 = b.과목번호 and a.학기 = 1 group by a.과목번호;
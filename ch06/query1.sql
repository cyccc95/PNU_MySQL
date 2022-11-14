-- 1104 실습 --
-- 1번
select 이름 from 학생;

-- 2번
select 이름, 전화번호 from 교수;

-- 3번
select * from 수강신청;

-- 4번
select 이름 from 학생 where 학번 not in (select distinct 학번 from 수강신청 where 연도 = '2018' and 학기 = 1);

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
select 수강신청번호, 과목번호, 평점 from 수강신청내역 where 과목번호 in ('K20045','K20056') and 평점 = 3;

-- 26번
select 수강신청번호, 과목번호, 평점 from 수강신청내역 where 과목번호 in ('K20045','K20056','Y00132') order by 과목번호;

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

-- 33번 ?
select group_concat(이름, 우편번호, 시군구, 시도, 주소 separator ',') as '학생정보' from 학생 group by 이름;

-- 34번
select 과목명, 담당교수 as '담당교수사번' from 과목;

-- 35번 ?

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
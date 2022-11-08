-- 실습데이터
-- dept, emp, salgrade

create database test02;
CREATE TABLE DEPT (
    DEPTNO DECIMAL(2),
    DNAME VARCHAR(14),
    LOC VARCHAR(13),
    CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) 
);
CREATE TABLE EMP (
    EMPNO DECIMAL(4),
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR DECIMAL(4),
    HIREDATE DATE,
    SAL DECIMAL(7,2),
    COMM DECIMAL(7,2),
    DEPTNO DECIMAL(2),
    CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
    CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
CREATE TABLE SALGRADE ( 
    GRADE TINYINT,
    LOSAL SMALLINT,
    HISAL SMALLINT 
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

-- 사원 테이블의 모든 레코드를 조회하시오
select * from emp;
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp;

-- 사원명과 입사일을 조회하시요
select ename, hiredate from emp;

-- 사원테이블에 있는 직책의 목록을 조회하시오
select distinct job from emp;

-- 총 사원수를 구하시요
select count(empno) from emp; -- count(칼럼명)은 null이 아닌 레코드의 수를, count(*)는 null을 포함한 레코드의 수를 반환

-- 부서번호가 10인 사원을 조회
select * from emp where deptno = 10;

-- 월급여가 2500이상 되는 사원을 조회
select * from emp where sal >= 2500;

-- 이름이 'KING'인 사원을 조회하시오
select * from emp where ename = 'KING';

-- 사원들 중 이름이 S로 시작하는 사원의 사원번호와 이름을 조회
select empno, ename from emp where ename like 'S%';

-- 사원 이름에 T가 포함된 사원의 사원번호와 이름을 조회하시오
select empno, ename from emp where ename like '%T%';

-- 커미션이 300, 500, 1400인 사원의 사번, 이름, 커미션을 조회하시오
select empno, ename, comm from emp where comm = 500 or comm = 300 or comm = 1400;
select empno, ename, comm from emp where comm in(300,500,1400);

-- 월급여가 1200에서 3500 사이의 사원의 사번, 이름, 월급여를 조회하시오
select empno, ename, sal from emp where sal >= 1200 and sal <= 3500;
select empno, ename, sal from emp where sal between 1200 and 3500;

-- 직급이 매니저이고 부서번호가 30번인 사원의 이름, 사번, 직급, 부서번호를 조회
select ename, empno, job, deptno from emp where job = 'MANAGER' and deptno = 30;

-- 부서번호가 30이 아닌 사원의 사번, 이름, 부서번호 조회
select empno, ename, deptno from emp where deptno != 30;

-- 커미션이 300,500,1400이 모두 아닌 사원의 사번,이름,커미션 조회
select empno, ename, comm from emp where comm not in (300,500,1400);

-- 사원 이름에 S가 포함되지 않는 사원의 사원번호, 이름 조회
select empno, ename from emp where ename not like '%S%';

-- 급여가 1200보다 미만이거나 3700 초과하는 사원의 사번,이름,월급여 조회
select empno, ename, sal from emp where sal not between 1200 and 3700;

-- 직속상사(MGR)가 NULL인 사원의 이름과 직급
select ename, job from emp where mgr is null;

-- 부서별 평균월급여를 구하는 쿼리
select deptno, avg(sal) from emp group by deptno order by avg(sal) DESC;
select deptno, avg(sal) as '평균급여' from emp group by deptno order by 2 DESC;

-- 부서별 전체 사원수와 커미션을 받는 사원들의 수를 구하는 쿼리
select deptno,count(*),count(comm) from emp group by deptno;

-- 부서별 최대 급여와 최소 급여를 구하는 쿼리
select deptno,max(sal),min(sal) from emp group by deptno;

-- 부서별로 급여 평균(단, 부서별 급여 평균이 2000 이상만)
select deptno, avg(sal) from emp group by deptno having avg(sal) >= 2000; -- having : group의 조건

-- 월급여가 1000 이상인 사원만들 대상으로 부서별로 월급여 평균을 구하라. 단, 평균값이 2000이상인 레코드만 구하라.
select deptno, avg(sal) from emp where sal >= 1000 group by deptno having avg(sal) >= 2000;

-- 급여가 높은 순으로 조회하되 급여가 같은 경우 이름의 절차가 빠른 사원순으로 사번, 이름, 월급여 조회
select empno, ename, sal from emp order by 3 DESC, 2;

-- 조인
-- 조인을 쓰면 두 개의 테이블을 연결하여 원하는 데이터를 추출할 수 있음
-- 연결 역할을 하는 것이 조인 칼럼으로 연결 대상인 두 테이블에서 같은 값을 가진 칼럼을 말함
-- 두 테이블의 조인을 위해서는 기본키(primary key, pk)와 외래키(foreign key, fk) 관계로 맺어져야 하고, 이를 일대다 관계라고 한다
-- RDBMS의 특징 중 하나

-- 조인의 특징
-- 조인하는 테이블에는 같은 값을 가진 칼럼이 있어야 한다 (각 조인 칼럼의 이름이 같은 필요는 없으나 값은 같아야 한다)
-- 2개 이상의 테이블도 조인 가능
	-- 만약 원하는 정보가 3개나 4개 테이블에 흩어져 있어도 조인 칼럼이 있다면 하나의 select 문장에서 여러 테이블을 조인해 원하는 정보를 조회 가능
-- 조인할 때 테이블에 대한 별칭을 사용
-- 조인 시 조인 조건 필요

-- 사원명과 부서명을 조회
select ename, dname from emp, dept where emp.DEPTNO = dept.DEPTNO;	-- 의미 없다, 안씀
select e.ename, d.dname from emp e, dept d where e.DEPTNO = d.DEPTNO; -- 조인 조건 alias
select e.ename, d.dname from emp e inner join dept d on e.deptno = d.deptno;

-- 이름, 직속상사의 이름을 조회
select e.ename as EMP, m.ename as MGR from emp e, emp m where e.mgr = m.empno;

-- 이름, 부서명을 조회(단, 사원테이블에 부서번호가 40에 속한 사원이 없지만 부서번호 40인 부서명도 출력되도록 하시오)
select e.ename, d.dname from dept d left join emp e on d.deptno = e.deptno; -- left join은 첫번째 테이블의 모든 레코드를 출력 : inner join과 차이점

-- 커미션을 받는 사원의 이름, 커미션, 부서이름, 부서위치 조회
select ename, comm, dname, loc from emp, dept where emp.deptno = dept.deptno and emp.comm is not null and emp.comm <> 0;

-- 서브쿼리

-- 사원명 'JONES'가 속한 부서명을 조회
select dname from dept where deptno = (select deptno from emp where ename = 'JONES');

-- 평균 월급여보다 더 많은 월급여를 받은 사원의 사원번호, 이름, 월급여 조회
select empno, ename, sal from emp where sal > (select avg(sal) from emp) order by sal DESC;

-- 부서번호가 10인 사원중에서 최대급여를 받는 사원과 동일한 급여를 받는 사원의 사원번호, 이름을 조회
select empno, ename from emp where sal = (select max(sal) from emp where deptno = 10);




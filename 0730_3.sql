--DML(CRUD)
-- SELECT 문

/*
	CRUD
	Read: SELECT
*/

SELECT * from emp;
SELECT empno,empname,salary FROM emp;
SELECT empno as no,empname as name,salary FROM emp;
SELECT deptno, manager, round(salary/12,2) as msalary FROM emp;

SELECT empname, hdate FROM emp;
SELECT empname, to_char(hdate,'YYMMDD') FROM emp;


/*
	SELECT 조건
*/
SELECT * FROM emp WHERE salary > 3000 AND salary < 4000;
SELECT * FROM emp WHERE salary between 3500 and 4000; # between a and b 는 a와 b를 둘다 포함한 값
SELECT * FROM emp WHERE empname = '이말숙';
SELECT * FROM emp WHERE deptno in ('10','20');
SELECT * FROM emp WHERE empname like '이%';
SELECT * FROM emp WHERE empname like '%자%';
SELECT * FROM emp WHERE empname like '_자%';

SELECT * FROM emp 
WHERE hdate>'2000-01-01' 
AND (empname like '김%' 
or empname LIKE '홍%')
ORDER BY salary;

SELECT empname, DATE_FORMAT(hdate,'%Y') AS YEAR, salary,
ROUND(salary/12) AS msalary
FROM emp
WHERE DATE_FORMAT(hdate,'%Y') >='2000'
AND ROUND(salary/12) >200 # 조건문에서는 만들어준 컬럼명을 못씀
ORDER BY msalary; # 하지만 order by에서는 컬럼명을 가지고 하기 

SELECT empname,
DATE_FORMAT(hdate,'%Y/%M/%D') AS M1,
DATE_FORMAT(hdate,'%Y/%M/%D') AS M1,
FROM emp;

SELECT * FROM emp WHERE manager IS NULL
SELECT * FROM emp WHERE manager IS NOT NULL

--  정렬 order by
SELECT * FROM emp ORDER BY salary ASC;  # ASC는 생략 내림차순 DESC는 오름차순 
SELECT * FROM emp ORDER BY salary DESC LIMIT 5; # LIMIT는 갯수 head tail 같은 느낌
SELECT * FROM emp ORDER BY 2,5;  # 2번째로 먼저 정렬 후, 5번째로 정렬
SELECT * FROM emp ORDER BY deptno DESC, salary ASC;


-- 중복
SELECT DISTINCT(deptno) FROM emp;

-- 범위
SELECT * FROM emp ORDER BY salary DESC LIMIT 7;
SELECT * FROM emp ORDER BY salary DESC LIMIT 3,3; # 열 기준으로 0부터 시작하고, 3부터 3개 를 의미함 즉 -> 4,5,6

/*
1. 사원정보를 조회 하고자 한다.
출력내용은 사번, 이름, 부서번호, 연봉, 세후연봉을 출력한다.
empno, empname, deptno, salary, tax, atsalary
세금은 연봉에 8.9%이다.
입사년과 salary를 기준으로 많은 순으로 정렬하시오.

2. 사원정보를 조회 하고자 한다.
월급이 150에서 250 사이의 직원들의 모든 정보를 조회 하시오
empno, empname, depno, salary, msalary, hmonth
단, 1월에 입사한 직원들만 조회 한다.
*/


SELECT * FROM emp
WHERE DATE_FORMAT(hdate, '%Y') >= '2000'
AND empname LIKE '김%'
ORDER BY salary;

SELECT * FROM emp
WHERE ROUND(salary/12,0) > 150
AND (empname like '홍%' or empname like '이%') ORDER BY salary;

SELECT empno, empname, deptno, salary,  (salary * 0.089) AS tax,
ROUND(salary*0.911) AS atsalary FROM emp
ORDER BY DATE_FORMAT(hdate,'%Y') ASC,salary DESC;

SELECT empno, empname, deptno, salary, ROUND(salary/12,0) AS msalary, DATE_FORMAT(hdate,'%M') AS hmonth
FROM emp
WHERE DATE_FORMAT(hdate,'%M') ='January'
AND ROUND(salary/12,0) between 150 and 250; 

















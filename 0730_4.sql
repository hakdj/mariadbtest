--DML(CRUD)
-- SELECT 문
/*
	GROUP
*/

SELECT empno,empname, ROUND(salary/12,2),
	DATE_FORMAT(hdate,'%Y') FROM emp
WHERE empno IN ('1001','1002','1003')
# SELECT문은 무조건 한 라인씩 나오게 됨 절대로 잊지 말기
ORDER BY 3 DESC

SELECT deptno, 
	SUM(salary), 
	ROUND(AVG(salary),1), 
	COUNT(*), 
	STDDEV(salary),  
	VAR_SAMP(salary),  
	MIN(salary),
	MAX(salary)
# 반드시 grouping 함수와 같이 사용해야 함
FROM emp # 위에것들 
GROUP BY deptno
HAVING SUM(salary) >= 10000
ORDER BY SUM(salary) DESC # or ORDER BY sum DESC 여기서 sum은 알리아스




# 	STDDEV(salary),  -- 표준편차, 	VAR_SAMP(salary),  -- 분산
#  SELECT 뒤에 그룹핑 함수를 꼭 써양하는건 아니지만 가시성을 위해 쓰는게 좋음.
#  HAVING이 SELECT에서 WHERE 역할을 함( 조건)
	

/*
1. 입사 년도별 직원들의 연봉의 평균을 출력 하시오
단 연봉 평균이 3000이상인 정보만 출력 하시오
year, avg_salary

​

2. 부사별 입사 년도별 직원들의 연봉의 평균을 출력 하시오
deptno, year, avg_salary

*/

SELECT DATE_FORMAT(hdate,'%Y') AS YEAR
	AVG(YEAR)
FROM emp 
GROUP BY  DATE_FORMAT(hdate,'%Y') AS YEAR













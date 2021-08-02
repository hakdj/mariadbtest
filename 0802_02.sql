SELECT deptno, titleno, AVG(salary)
FROM emp
GROUP BY deptno, titleno;


SELECT d.deptname, t.titlename, AVG(e.salary) FROM emp e
	INNER JOIN dept d ON e.deptno = d.deptno  # JOIN은 여러개 data를 합치는 것임 
	INNER JOIN title t ON e.titleno = t.titleno
GROUP BY d.deptname, t.titlename;


# 7

SELECT YEAR(hdate) AS hyear, AVG(salary) FROM emp
WHERE YEAR(hdate) BETWEEN 2000 and 2002 # data를 먼저 가져오기
GROUP BY hyear  # 가능한한 알리아스 써서 사용하기;

# 8 

SELECT RANK() OVER(ORDER BY SUM(e.salary) DESC) AS rank,
	d.deptname, SUM(salary/12) AS ssal FROM emp e
	INNEr JOIN dept d ON e.deptno =d.deptno
GROUP BY d.deptname
ORDER BY rank # 정렬
LIMIT 3;

# 9 서울에서 근무하는 직원들을 조회 하시오.

SELECT deptno FROM dept WHERE deptloc ='서울';
위 방식으로 하면 2 번의 쿼리를 날려야 하므로 아래방식으로 하자
SELECT * FROM emp
WHERE deptno=(SELECT deptno FROM dept WHERE deptloc ='서울');

# 9-1

SELECT deptno FROM dept 
WHERE deptloc ='서울' OR deptloc='부산';

SELECT * FROM emp
WHERE deptno IN (SELECT deptno FROM dept 
WHERE deptloc ='서울' OR deptloc='부산');
# 하나의 조건에 2개이상 들어갈 때 IN을 사용하기
# sub쿼리형태 하지만 sub쿼리는 현업에서는 지양함.
# 대부분의 sub쿼리는 JOIN으로도 할 수 있다.

# 다른 형태로 풀어보기

SELECT * FROM emp e
	INNER JOIN dept d ON e.deptno=d.deptno
	WHERE d.deptloc IN ('서울','부산');


# 10 이영자가 속한 부서의 직원들을 조회하시오
# 단 부서명, 타이틀명, 이름을 조회하시오.

SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM title;

SELECT d.deptname, t.titlename, e.empname FROM emp e
	INNER JOIN dept d ON e.deptno=d.deptno
	INNER JOIN title t ON e.titleno=t.titleno
WHERE e.deptno = (SELECT deptno FROM emp WHERE empname = '이영자');
	


# 12 대전 지역 직원들의 연봉 평균 보다 많이 받는 직원들을 조회하시오.
# 단 부서명, 타이틀명, 이름, 연봉을 조회하시오.

SELECT d.deptname, t.titlename, e.empname, e.salary FROM emp e
	INNER JOIN dept d ON e.deptno=d.deptno
	INNER JOIN title t ON e.titleno=t.titleno
WHERE  e.salary >= (SELECT AVG(e.salary) FROM emp e
	INNER JOIN dept d ON e.deptno=d.deptno
WHERE d.deptloc='대전');

# 13 직원들의 정보를 조회하시오
# 직원명, manager명


SELECT e1.empno, e1.empname, e2.empname AS manager FROM emp e1
		INNER JOIN emp e2 ON e1.manager=e2.empno;
# 이거는 셀프 조인임 하지만 두개의 table은 엄연히 다른것임


SELECT e1.empno, e1.empname, IFNULL(e2.empname,'NAN') AS manager FROM emp e1
		LEFT JOIN emp e2 ON e1.manager=e2.empno;
#inner join은 반드시 두개의 태이블에 공통적인것만 뽑아 주는것이었다면,
#left join은 왼쪽을 기준으로 ( 사원정보) 모든것을 뽑아준다.
# 여기서는 e1을 기준으로임

INSERT INTO dept VALUES ('50','연구부','충북');


SELECT e.empname,d.deptname,d.deptloc
FROM emp e RIGHT JOIN dept d ON e.deptno=d.deptno;
# right join 위 기준에서는 dept를 기준으로 조인하기 떄문에
# 충북 직원정보는 없다


INSERT INTO emp VALUES ('1011','10',NULL,'이사원',NULL,1300,'2021-01-01');

SELECT e.empname,d.deptname,d.deptloc
FROM emp e RIGHT JOIN dept d ON e.deptno=d.deptno;

SELECT e.empname,d.deptname,d.deptloc
FROM emp e LEFT JOIN dept d ON e.deptno=d.deptno;

SELECT e.empname,d.deptname,d.deptloc
FROM emp e INNER JOIN dept d ON e.deptno=d.deptno;

SELECT e.empname,d.deptname,d.deptloc
FROM emp e FULL OUTER JOIN dept d ON e.deptno=d.deptno;


SELECT empname, hdate,
TIMESTAMPDIFF(month,hdate,NOW()), TIMESTAMPDIFF(year,hdate,NOW())
FROM emp;









#employeesDROP TABLE emp;
#DROP TABLE dept;

CREATE TABLE dept(
	deptno CHAR(2) PRIMARY KEY,
	deptname VARCHAR(20),
	deptloc VARCHAR(20)
);

CREATE TABLE emp(
	empno CHAR(4) PRIMARY KEY,
	deptno CHAR(2),
	empname VARCHAR(10),
	manager CHAR(4),
	salary INT(5),
	hdate DATE
);



INSERT INTO emp VALUES ('1001','10', '킹',NULL, 5000,'1997-01-01' );
INSERT INTO emp VALUES ('1002','20', '이영업','1001', 4300,'1998-01-01' );
INSERT INTO emp VALUES ('1003','30', '김생산','1001', 4800,'1999-01-01' );
INSERT INTO emp VALUES ('1004','40', '홍연구','1001', 4500,'1999-12-01' );
INSERT INTO emp VALUES ('1005','20', '이말숙','1002', 3300,'2000-01-01' );
INSERT INTO emp VALUES ('1006','20', '김말숫','1002', 2800,'2001-01-01' );
INSERT INTO emp VALUES ('1007','30', '홍영자','1003', 3500,'2000-12-01' );
INSERT INTO emp VALUES ('1008','30', '이영자','1003', 2300,'2002-05-01' );
INSERT INTO emp VALUES ('1009','40', '김강국','1004', 3800,'2001-01-01' );
INSERT INTO emp VALUES ('1010','40', '홍정국','1004', 2500,'2002-12-01' );


INSERT INTO dept VALUES ('10', '관리부', '서울');
INSERT INTO dept VALUES ('20', '생산부', '부산');
INSERT INTO dept VALUES ('30', '영업부', '대구');
INSERT INTO dept VALUES ('40', '기술부', '대전');
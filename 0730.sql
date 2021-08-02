# DATABASE 안에 TABLE 생성
CREATE TABLE EMPS(
   ID CHAR(10),
   NAME CHAR(20),
   AGE INT
);

# Table에 데이터 입력
INSERT INTO EMPS VALUES('id01','이말숙',20); 
INSERT INTO EMPS VALUES('id02','이말숙',30); 
INSERT INTO EMPS VALUES('id03','이말숙',40); 
INSERT INTO EMPS VALUES('id04','이말숙',50); 
INSERT INTO EMPS VALUES('id05','이말숙',60); 

# Table에서  데이터 조회
SELECT * FROM EMPS;

# Table을 삭제
DROP TABLE EMPS;


#---------------------------------
# 1. SQL
# DDL:테이블 생성, 삭제
# DML:
# Create(INSERT), Read(SELECT)
# Updata(UPDATE), Delete(DELETE)
#
# 2. DB Modeling
#
# 3. python 연동
# 
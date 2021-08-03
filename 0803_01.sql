DROP TABLE cust;
DROP TABLE item;


CREATE TABLE cust(
	id VARCHAR(5),
	pwd VARCHAR(10) NOT NULL,
	name VARCHAR(10) NOT NULL
);
ALTER TABLE cust ADD PRIMARY KEY (id);
ALTER TABLE cust ADD CONSTRAINT UNIQUE (name);

DELETE FROM cust;

INSERT INTO cust VALUES ('id01','pwd01','이말숙');
INSERT INTO cust VALUES ('id02','pwd02','김말숙');
INSERT INTO cust VALUES ('id03','pwd03','홍말숙');
INSERT INTO cust VALUES ('id04','pwd04','정말숙');
INSERT INTO cust VALUES ('id05','pwd05','장말숙');


SELECT * FROM cust;

#----------------------------------------------------

CREATE TABLE item(
	id INT,
	name VARCHAR(20) NOT NULL,
	price INT NOT NULL,
	rate FLOAT,
	regdate DATE NOT NULL
);
ALTER TABLE item ADD PRIMARY KEY (id);
ALTER TABLE item MODIFY id INT AUTO_INCREMENT;
ALTER TABLE item AUTO_INCREMENT = 1000;
ALTER TABLE item ALTER COLUMN rate SET DEFAULT 3.3;

INSERT INTO item (name,price,regdate) VALUES ('pants1',10000,CURDATE());


SELECT * FROM item;


#------------------------------------------------------------------

DELETE FROM item WHERE id=1001;

UPDATE item SET name='cap',price=20000,rate=5.5 WHERE id=1002;

















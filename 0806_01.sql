
DROP TABLE cart;

CREATE TABLE cart(
	id INT,
	custid CHAR(5),
	itemid INT,
	num INT,
	regdate DATE
);

ALTER TABLE cart ADD PRIMARY KEY (id);
ALTER TABLE cart MODIFY id INT AUTO_INCREMENT;
ALTER TABLE cart AUTO_INCREMENT = 100;
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (custid) REFERENCES cust(id);
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (itemid) REFERENCES item(id);



/*
아이디는 char 보다 varchar이 더 좋다
*/
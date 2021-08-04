

# --------------------------------------------------------------------
DROP TABLE cust;
CREATE TABLE cust(
	cust_id VARCHAR(10),
	pwd VARCHAR(20) NOT NULL,
	name VARCHAR(10) NOT NULL,
	address VARCHAR(20) NOT NULL,
	phone VARCHAR(20),
	email VARCHAR(20),
	grade VARCHAR(20),
	state INT,
	regdate DATE NOT NULL
);
ALTER TABLE cust ADD PRIMARY KEY (cust_id);
# --------------------------------------------------------------------
DROP TABLE item;
CREATE TABLE item(
	item_num INT,
	item_name VARCHAR(200),
	cate INT,
	price INT NOT NULL,
	content VARCHAR(2000),
	state INT,
	regdate DATE NOT NULL
);

ALTER TABLE item ADD PRIMARY KEY (item_num);
ALTER TABLE item MODIFY item_num INT AUTO_INCREMENT;
ALTER TABLE item AUTO_INCREMENT = 1;
# --------------------------------------------------------------------
DROP TABLE qna;
CREATE TABLE qna(
	qna_num INT,
	item_num INT,
	title VARCHAR(100) NOT NULL,
	content VARCHAR(1000) NOT NULL,
	reply VARCHAR(1000),
	regdate DATE NOT NULL,
	state INT
);
ALTER TABLE qna ADD PRIMARY KEY (qna_num);
ALTER TABLE qna MODIFY qna_num INT AUTO_INCREMENT;
ALTER TABLE qna AUTO_INCREMENT = 1;
ALTER TABLE qna ADD CONSTRAINT FOREIGN KEY (item_num) REFERENCES item (item_num);
# --------------------------------------------------------------------
DROP TABLE orders;
CREATE TABLE orders(
	order_id INT,
	cust_id VARCHAR(10),
	regdate DATE NOT NULL,
	state INT
);
ALTER TABLE orders ADD PRIMARY KEY (order_id);
ALTER TABLE orders MODIFY order_id INT AUTO_INCREMENT;
ALTER TABLE orders AUTO_INCREMENT = 1;
ALTER TABLE orders ADD CONSTRAINT FOREIGN KEY (cust_id) REFERENCES cust (cust_id);
# --------------------------------------------------------------------
DROP TABLE order_detail;
CREATE TABLE order_detail(
	order_num INT,
	order_id INT,
	item_num INT,
	qnt INT NOT NULL,
	state INT
);
ALTER TABLE order_detail ADD PRIMARY KEY (order_num);
ALTER TABLE order_detail MODIFY order_num INT AUTO_INCREMENT;
ALTER TABLE order_detail AUTO_INCREMENT = 1;
ALTER TABLE order_detail ADD CONSTRAINT FOREIGN KEY (order_id) REFERENCES orders (order_id);
ALTER TABLE order_detail ADD CONSTRAINT FOREIGN KEY (item_num) REFERENCES item (item_num);
# --------------------------------------------------------------------
DROP TABLE cart;
CREATE TABLE cart(
	cart_num INT,
	cust_id VARCHAR(10),
	item_num INT,
	qnt INT NOT NULL,
	state INT,
	regdate DATE NOT NULL
);
ALTER TABLE cart ADD PRIMARY KEY (cart_num);
ALTER TABLE cart MODIFY cart_num INT AUTO_INCREMENT;
ALTER TABLE cart AUTO_INCREMENT = 1;
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (cust_id) REFERENCES cust (cust_id);
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (item_num) REFERENCES item (item_num);
# --------------------------------------------------------------------



# --------------------------------------------------------------------

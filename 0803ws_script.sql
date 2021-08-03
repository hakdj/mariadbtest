
DROP TABLE order_table;
DROP TABLE cart;
DROP TABLE qna;
DROP TABLE item;
DROP TABLE users;

CREATE TABLE users(
	id VARCHAR(10),
	pwd VARCHAR(20) NOT NULL,
	name VARCHAR(20),
	email VARCHAR(40),
	address VARCHAR(100) NOT NULL,
	phone VARCHAR(20) NOT NULL,
	regdate DATE NOT NULL
);
ALTER TABLE users ADD PRIMARY KEY (id);

# --------------------------------------------------------------------
CREATE TABLE item(
	num INT,
	product VARCHAR(100) NOT NULL,
	price INT NOT NULL,
	rate FLOAT,
	regdate DATE NOT NULL,
	content VARCHAR(2000)
);

ALTER TABLE item ADD PRIMARY KEY (num);
ALTER TABLE item MODIFY num INT AUTO_INCREMENT;
ALTER TABLE item AUTO_INCREMENT = 1;
# ----------------------------------------------------------------------
CREATE TABLE qna(
	board_id INT,
	id VARCHAR(10),
	title VARCHAR(200) NOT NULL,
	content VARCHAR(2000) NOT NULL,
	r_date DATE NOT NULL,
	cnt INT,
	r_content VARCHAR(2000)
);
ALTER TABLE qna ADD PRIMARY KEY (board_id);
ALTER TABLE qna MODIFY board_id INT AUTO_INCREMENT;
ALTER TABLE qna AUTO_INCREMENT = 1;
ALTER TABLE qna ALTER COLUMN cnt SET DEFAULT 0;
ALTER TABLE qna ADD CONSTRAINT FOREIGN KEY (id) REFERENCES users (id);

# -------------------------------------------------------------------------
CREATE TABLE cart(
	cartnum INT,
	id VARCHAR(10),
	num INT,
	c_date DATE NOT NULL,
	qt INT NOT NULL
);
ALTER TABLE cart ADD PRIMARY KEY (cartnum,id,num);
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (id) REFERENCES users (id);
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (num) REFERENCES item (num);
# -------------------------------------------------------------------------
CREATE TABLE order_table(
	ordernum INT,
	cartnum INT,
	id VARCHAR(10),
	num2 INT,
	o_date DATE NOT NULL
);

ALTER TABLE order_table ADD PRIMARY KEY (ordernum,cartnum,id,num2);
ALTER TABLE order_table ADD CONSTRAINT FOREIGN KEY (cartnum) REFERENCES cart (cartnum);
ALTER TABLE order_table ADD CONSTRAINT FOREIGN KEY (id) REFERENCES cart (id);
ALTER TABLE order_table ADD CONSTRAINT FOREIGN KEY (num2) REFERENCES cart (num);
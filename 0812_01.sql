DROP TABLE users;
DROP TABLE udata;
DROP TABLE res;


# --------------------------------------------------------------------
CREATE TABLE users(
	user_id VARCHAR(10),
	pwd VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	email VARCHAR(40),
	phone VARCHAR(20),
	regdate DATE NOT NULL
);

ALTER TABLE users ADD PRIMARY KEY (user_id);
# --------------------------------------------------------------------
CREATE TABLE udata(
	data_id INT,
	id VARCHAR(10),
	schooltype INT,
	major VARCHAR(20),
	graduy INT,
	age INT,
	intern INT,
	toeic INT,
	train INT,
	jobseek INT,
	cert INT
);

ALTER TABLE udata ADD PRIMARY KEY (data_id);
ALTER TABLE udata MODIFY data_id INT AUTO_INCREMENT;
ALTER TABLE udata AUTO_INCREMENT = 100;
ALTER TABLE udata ADD CONSTRAINT FOREIGN KEY (id) REFERENCES users(user_id);

# --------------------------------------------------------------------

CREATE TABLE res(
	result_id INT,
	id VARCHAR(10),
	result VARCHAR(200) NOT NULL,
	resdate DATE
);

ALTER TABLE res ADD PRIMARY KEY (result_id);
ALTER TABLE res MODIFY result_id INT AUTO_INCREMENT;
ALTER TABLE res AUTO_INCREMENT = 100;
ALTER TABLE res ADD CONSTRAINT FOREIGN KEY (id) REFERENCES users(user_id);
# --------------------------------------------------------------------




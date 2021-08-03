DROP TABLE IF EXISTS `cust`;

CREATE TABLE `cust` (
	`id`	VARCHAR(10)	NOT NULL,
	`pwd`	VARCHAR(10)	NOT NULL,
	`name`	VARCHAR(20)	NOT NULL
);

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
	`id`	INT	NOT NULL,
	`name`	VARCHAR(20)	NULL,
	`price`	INT	NOT NULL,
	`rate`	FLOAT	NULL	DEFAULT 3.3,
	`regdate`	DATE	NULL
);

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
	`id`	VARCHAR(10)	NOT NULL,
	`id2`	INT	NOT NULL,
	`regdate`	DATE	NULL,
	`qt`	INT	NULL
);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
	`board_id`	INT	NOT NULL,
	`id`	VARCHAR(10)	NOT NULL,
	`title`	VARCHAR(200)	NULL,
	`content`	VARCHAR(2000)	NULL,
	`regdate`	DATE	NULL,
	`cnt`	INT	NULL
);

ALTER TABLE `cust` ADD CONSTRAINT `PK_CUST` PRIMARY KEY (
	`id`
);

ALTER TABLE `item` ADD CONSTRAINT `PK_ITEM` PRIMARY KEY (
	`id`
);

ALTER TABLE `cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`id`,
	`id2`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`board_id`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_cust_TO_cart_1` FOREIGN KEY (
	`id`
)
REFERENCES `cust` (
	`id`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_item_TO_cart_1` FOREIGN KEY (
	`id2`
)
REFERENCES `item` (
	`id`
);


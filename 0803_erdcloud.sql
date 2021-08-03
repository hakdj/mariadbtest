﻿DROP TABLE IF EXISTS `cust`;

CREATE TABLE `cust` (
	`id`	VARCHAR(10)	NOT NULL,
	`pwd`	VARCHAR(10)	NULL,
	`name`	VARCHAR(20)	NULL
);

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
	`id`	INT	NOT NULL,
	`name`	VARCHAR(20)	NULL,
	`price`	INT	NULL,
	`rate`	FLOAT	NULL,
	`regdate`	DATE	NULL
);

ALTER TABLE `cust` ADD CONSTRAINT `PK_CUST` PRIMARY KEY (
	`id`
);

ALTER TABLE `item` ADD CONSTRAINT `PK_ITEM` PRIMARY KEY (
	`id`
);


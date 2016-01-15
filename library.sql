CREATE TABLE `test`.`volume` (
`mid` INT NOT NULL COMMENT '',
`v_num` INT NOT NULL COMMENT '',
`issue` VARCHAR(45) NULL COMMENT '',
`issn-l` VARCHAR(45) NULL COMMENT '',
`p_year` YEAR NULL COMMENT '',
UNIQUE INDEX `v_num_UNIQUE` (`v_num` ASC)  COMMENT '',
UNIQUE INDEX `mid_UNIQUE` (`mid` ASC)  COMMENT '');

CREATE TABLE `test`.`article` (
`id` INT NOT NULL AUTO_INCREMENT COMMENT '',
`coden` VARCHAR(20) NULL COMMENT '',
`fpage` INT NULL COMMENT '',
`lpage` INT NULL COMMENT '',
`title` VARCHAR(50) NULL COMMENT '',
`mid` INT NOT NULL COMMENT '',
`v_num` VARCHAR(45) NOT NULL COMMENT '',
PRIMARY KEY (`id`)  COMMENT '',
UNIQUE INDEX `mid_UNIQUE` (`mid` ASC)  COMMENT '',
UNIQUE INDEX `v_num_UNIQUE` (`v_num` ASC)  COMMENT '');

CREATE TABLE `test`.`author_article` (
`aid` INT NOT NULL COMMENT '',
`id` VARCHAR(45) NOT NULL COMMENT '',
UNIQUE INDEX `aid_UNIQUE` (`aid` ASC)  COMMENT '',
UNIQUE INDEX `id_UNIQUE` (`id` ASC)  COMMENT '');

CREATE TABLE `test`.`customer` (
`cid` INT NOT NULL AUTO_INCREMENT COMMENT '',
`fname` VARCHAR(10) NULL COMMENT '',
`lname` VARCHAR(10) NULL COMMENT '',
`phone` VARCHAR(10) NULL COMMENT '',
`dcode` INT NULL COMMENT '',
`reg_date` DATE NOT NULL COMMENT '',
PRIMARY KEY (`cid`)  COMMENT '');


CREATE TABLE `test`.`transaction` (
`t_num` INT NOT NULL AUTO_INCREMENT COMMENT '',
`cid` INT NOT NULL COMMENT '',
`sum` FLOAT NULL COMMENT '',
`sum_dis` FLOAT NULL COMMENT '',
`date` DATE NULL COMMENT '',
PRIMARY KEY (`t_num`)  COMMENT '');

CREATE TABLE `test`.`transaction_item` (
`id` INT NOT NULL COMMENT '',
`t_num` INT NOT NULL COMMENT '',
`quntity` INT NULL COMMENT '',
UNIQUE INDEX `id_UNIQUE` (`id` ASC)  COMMENT '',
UNIQUE INDEX `t_num_UNIQUE` (`t_num` ASC)  COMMENT '');

CREATE TABLE `test`.`employee` (
`eid` INT NOT NULL AUTO_INCREMENT COMMENT '',
`name` VARCHAR(10) NULL COMMENT '',
`hour_dalary` FLOAT NULL COMMENT '',
PRIMARY KEY (`eid`)  COMMENT '');

CREATE TABLE `test`.`work_for` (
`eid` INT NOT NULL COMMENT '',
`hours_work` FLOAT NULL COMMENT '',
`date` DATE NOT NULL COMMENT '');

CREATE TABLE `test`.`order` (
`order_num` INT NOT NULL AUTO_INCREMENT COMMENT '',
`cost` FLOAT NULL COMMENT '',
`date` DATE NULL COMMENT '',
PRIMARY KEY (`order_num`)  COMMENT '');

CREATE TABLE `test`.`expinsive` (
`water` FLOAT NULL COMMENT '',
`hear` FLOAT NULL COMMENT '',
`electricity` FLOAT NULL COMMENT '',
`date` DATE NULL COMMENT '');

CREATE TABLE `test`.`rent` (
`rent_cost` FLOAT NULL COMMENT '',
`date` YEAR NULL COMMENT '');

ALTER TABLE `test`.`transaction_item`
DROP INDEX `t_num_UNIQUE` ,
DROP INDEX `id_UNIQUE` ;

ALTER TABLE `test`.`article`
DROP INDEX `v_num_UNIQUE` ,
DROP INDEX `mid_UNIQUE` ;

ALTER TABLE `test`.`customer`
ADD COLUMN `country` VARCHAR(10) NULL COMMENT '' AFTER `reg_date`,
ADD COLUMN `city` VARCHAR(10) NULL COMMENT '' AFTER `country`,
ADD COLUMN `adress` VARCHAR(15) NULL COMMENT '' AFTER `city`,
ADD COLUMN `postal` VARCHAR(8) NULL COMMENT '' AFTER `adress`;




-- DDL
DROP DATABASE IF EXISTS shoessite;
CREATE DATABASE shoessite;
USE shoessite;

DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS cate;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS cart;
DROP TABLE IF EXISTS addr_list;
DROP TABLE IF EXISTS cust;
DROP TABLE IF EXISTS buy;
DROP TABLE IF EXISTS shoes_cnt;
DROP TABLE IF EXISTS buy_detail;

CREATE TABLE cust(
	id VARCHAR(100) PRIMARY KEY,
    pwd VARCHAR(100),
    name VARCHAR(100),
    addr VARCHAR(100),
    regdate DATE
);


CREATE TABLE addr_list(
	id INT PRIMARY KEY,
    uid VARCHAR(100),
    addr VARCHAR(100),
    addr_detail VARCHAR(100),
    zip INT
);
ALTER TABLE addr_list  ADD CONSTRAINT FOREIGN KEY (uid) REFERENCES cust (id);
ALTER TABLE addr_list MODIFY id INT AUTO_INCREMENT;
ALTER TABLE addr_list AUTO_INCREMENT = 1000;

CREATE TABLE CATE(
   id INT PRIMARY KEY,
   name VARCHAR(100),
   tid INT 
);

CREATE TABLE buy(
id INT PRIMARY KEY,
uid VARCHAR(100),
name VARCHAR(100),
recipient VARCHAR(100),
recipient_addr VARCHAR(100),
recipient_phonenumber VARCHAR(50),
request VARCHAR(500),
price INT,
regdate DATE
);
ALTER TABLE buy ADD CONSTRAINT
FOREIGN KEY (uid) REFERENCES cust (id);
ALTER TABLE buy MODIFY id INT AUTO_INCREMENT;
ALTER TABLE buy AUTO_INCREMENT = 2000;

CREATE TABLE product(
	id INT  PRIMARY KEY,
    name VARCHAR(100),
    price INT,
    regdate DATE,
    imgname VARCHAR(100),
    cid INT,
    color VARCHAR(100),
    gender VARCHAR(50)
);
ALTER TABLE product ADD CONSTRAINT FOREIGN KEY (cid) REFERENCES cate (id);
ALTER TABLE product MODIFY id INT AUTO_INCREMENT;
ALTER TABLE product AUTO_INCREMENT = 3000;

CREATE TABLE buy_detail(
	id INT  PRIMARY KEY,
    oid INT,
    pid INT,
    size INT,
    cnt INT
);
ALTER TABLE buy_detail ADD CONSTRAINT FOREIGN KEY (oid) REFERENCES buy (id);
ALTER TABLE buy_detail ADD CONSTRAINT FOREIGN KEY (pid) REFERENCES product (id);
ALTER TABLE buy_detail MODIFY id INT AUTO_INCREMENT;
ALTER TABLE buy_detail AUTO_INCREMENT = 4000;

CREATE TABLE shoes_cnt(
pid INT NOT NULL,
size INT,
cnt INT
);
ALTER TABLE shoes_cnt ADD CONSTRAINT
FOREIGN KEY (pid) REFERENCES product (id);

CREATE TABLE CART (
ID INT PRIMARY KEY,
NAME VARCHAR(100) ,
COUNT INT ,
uid VARCHAR(100),
pid INT
);
ALTER TABLE CART ADD CONSTRAINT
FOREIGN KEY (uid) REFERENCES cust (id);
ALTER TABLE CART ADD CONSTRAINT
FOREIGN KEY (pid) REFERENCES product (id);
ALTER TABLE CART MODIFY id INT AUTO_INCREMENT;
ALTER TABLE CART AUTO_INCREMENT = 5000;

CREATE TABLE REVIEW(
ID INT PRIMARY KEY,
PID INT,
STAR INT,
TEXT VARCHAR(2000),
REGDATE DATE,
FILENAME VARCHAR(100),
UID VARCHAR(100)
);
ALTER TABLE REVIEW ADD CONSTRAINT
FOREIGN KEY (uid) REFERENCES cust (id);
ALTER TABLE REVIEW MODIFY id INT AUTO_INCREMENT;
ALTER TABLE REVIEW AUTO_INCREMENT = 6000;



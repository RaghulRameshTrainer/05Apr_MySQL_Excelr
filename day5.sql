use Learnings;

-- CONSTRAINTS
-- UNIQUE
-- NOT NULL
-- CHECK
--  DEFAULT
-- PRIMARY KEY
 -- FOREIGN KEY
 
 -- UNIQUE CONSTRAINT
 
 CREATE TABLE unique_table(
 custid INT UNIQUE,
 custname VARCHAR(100),
 age int,
 city varchar(100)
 );
 
 INSERT INTO unique_table VALUES(1000,'Siva',50,'Chennai');
 SELECT * FROM unique_table;
INSERT INTO unique_table VALUES(1000,'Ranga',50,'Chennai');  -- ERROR since there is a duplication value for custid
INSERT INTO unique_table VALUES(1001,'Ranga',50,'Chennai');
 SELECT * FROM unique_table;
INSERT INTO unique_table(custname,age,city) VALUES('Raj',55,'Hyderabad');
 SELECT * FROM unique_table;
INSERT INTO unique_table(custname,age,city) VALUES('Bala',40,'Bangalore');
 SELECT * FROM unique_table;

-- NOT NULL CONSTRAINTS

CREATE TABLE nn_table(
 custid INT NOT NULL,
 custname VARCHAR(100),
 age int,
 city varchar(100)
 );
 
INSERT INTO nn_table VALUES(1000,'Siva',50,'Chennai');
SELECT * FROM nn_table;
INSERT INTO nn_table(custname,age,city) VALUES('Raj',55,'Hyderabad');  -- ERROR since there is no value for custid
INSERT INTO nn_table(custid) VALUES(1000);
SELECT * FROM nn_table;


CREATE TABLE nn_uniq_table(
 custid INT UNIQUE NOT NULL,
 custname VARCHAR(100),
 age int,
 city varchar(100)
 );
 
 INSERT INTO nn_uniq_table VALUES(1000,'Siva',50,'Chennai');
 SELECT * FROM nn_uniq_table;
INSERT INTO nn_uniq_table VALUES(1000,'Ranga',50,'Chennai');  -- ERROR since there is a duplication value for custid
INSERT INTO nn_uniq_table VALUES(1001,'Ranga',50,'Chennai');
 SELECT * FROM nn_uniq_table;
INSERT INTO nn_uniq_table(custname,age,city) VALUES('Raj',55,'Hyderabad');
 SELECT * FROM nn_uniq_table;
INSERT INTO nn_uniq_table(custname,age,city) VALUES('Bala',40,'Bangalore');
 SELECT * FROM nn_uniq_table;
 
 -- CHECK

CREATE TABLE check_table(
 custid INT ,
 custname VARCHAR(100),
 age INT CHECK (age >0 and age<=100),
 city varchar(100)
 );


INSERT INTO check_table VALUES(1000,'Rajini',36,'Bangalore');
SELECT * FROM check_table;
INSERT INTO check_table VALUES(1001,'Priya',-1,'Pune'); --  ERROR due to age value whichis < 0
INSERT INTO check_table VALUES(1001,'Priya',1,'Pune');

SELECT * FROM check_table;

INSERT INTO check_table VALUES(1001,'Venkatesh',101,'Hyderabad'); --  ERROR due to age value whichis < 0
INSERT INTO check_table VALUES(1001,'Venkatesh',100,'Hyderabad');

SELECT * FROM check_table;

CREATE TABLE check_table2(
 custid INT ,
 custname VARCHAR(100),
 age INT ,
 city varchar(100) CHECK ( city in ('Chennai','Bangalore','Hyderabad','Pune'))
 );


-- DEFAULT constraint

CREATE TABLE default_table(
custid INT,
custname VARCHAR(100),
age INT,
city VARCHAR(20) DEFAULT 'Hyderabad'
);

INSERT INTO default_table VALUES(1000,'Satya',35,'Mumbai');
SELECT * FROM default_table;

INSERT INTO default_table(custid, custname, age) VALUES(1001,'Aveek Sharma',45);
SELECT * FROM default_table;



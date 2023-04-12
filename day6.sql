use learnings;

-- PRIMARY KEY
--  Primary key column is used to identify each record in a table uniquely

CREATE TABLE pk_table(
empid INT primary key,    -- Simple primary key 
empname varchar(100),
gender char(1),
age int,
city varchar(20)
);

INSERT INTO pk_table VALUES(1000,'Durga','F',30,'Chennai');
SELECT * FROM pk_table;
INSERT INTO pk_table VALUES(1000,'Vijay','M',49,'Chennai'); -- ERROR since empid = 1000 is duplicate
INSERT INTO pk_table VALUES(1001,'Vijay','M',49,'Chennai');
SELECT * FROM pk_table;
INSERT INTO pk_table(empname,gender,age,city) VALUES('Guna','M',38,'Bangalore');  -- ERROR since empid does not have a value
INSERT INTO pk_table(empid,empname,gender,age,city) VALUES(1002,'Guna','M',38,'Bangalore'); 
SELECT * FROM pk_table;

CREATE TABLE comp_pk_table(
empid INT ,    
empname varchar(100),
gender char(1),
age int,
city varchar(20),
PRIMARY KEY (empid,empname)  -- composite primary key
);


INSERT INTO comp_pk_table VALUES(1000,'Durga','F',30,'Chennai');
SELECT * FROM comp_pk_table;
INSERT INTO comp_pk_table VALUES(1000,'Vijay','M',49,'Chennai'); 
INSERT INTO comp_pk_table VALUES(1001,'Vijay','M',49,'Chennai');
SELECT * FROM comp_pk_table;
INSERT INTO comp_pk_table VALUES(1000,'Durga','F',30,'Pune');  -- ERROR since 1000-Durga exists already
SELECT * FROM comp_pk_table;

INSERT INTO comp_pk_table(empname,gender,age,city) VALUES('Guna','M',38,'Bangalore');  -- ERROR since empid does not have a value
INSERT INTO comp_pk_table(empid,empname,gender,age,city) VALUES(1002,'Guna','M',38,'Bangalore'); 
SELECT * FROM comp_pk_table;


-- FOREIGN KEY

create table customer_table (
cust_id INT PRIMARY KEY,
custname VARCHAR(20),
gender CHAR(1),
age INT,
city VARCHAR(20)
);

SELECT * FROM customer_table;

create table order_table(
order_id INT primary key,
cust_id INT,
prod_name VARCHAR(100),
amount DECIMAL(20,2),
FOREIGN KEY (cust_id) REFERENCES customer_table(cust_id)
);

INSERT INTO customer_table VALUES(1000,'Bala','M',30,'Bangalore'),(1001,'Prabha','M',35,'Hyderabad'),(1002,'Saran','M',25,'Chennai');

INSERT INTO order_table VALUES(1,1000,'TV',750000.50);
SELECT * FROM order_table;
INSERT INTO order_table VALUES(2,1003,'Mobile',250000);  -- ERROR since 1003 is not present in the parent table
INSERT INTO order_table VALUES(2,1001,'Mobile',250000); 
SELECT * FROM order_table;
INSERT INTO order_table VALUES(3,1002,'Laptop',70000); 
SELECT * FROM order_table;
INSERT INTO order_table VALUES(4,1000,'Desktop',550000.50);
SELECT * FROM order_table;

DELETE FROM customer_table WHERE cust_id=1001; -- ERROR
DELETE FROM order_table WHERE cust_id=1001;
DELETE FROM customer_table WHERE cust_id=1001;

SELECT * FROM customer_table;


CREATE TABLE parenet_table(
id INT PRIMARY KEY,
name VARCHAR(100)
);

RENAME TABLE parenet_table TO parent_table;

INSERT INTO parent_table VALUES(1,'Amazon'),(2,'Walmart'),(3,'Intuit'),(4,'Samsung'),(5,'Ford');

SELECT * FROM parent_table;



CREATE TABLE emp_table(
emp_id INT PRIMARY KEY,
comp_id INT,
name VARCHAR(100),
FOREIGN KEY (comp_id) REFERENCES parent_table(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO emp_table VALUES(1000,1,'Rakesh'),(1001,2,'Madhan'),(3,3,'Venkatesh');

SELECT * FROM emp_table;

DELETE FROM parent_table WHERE id=5;

UPDATE parent_table SET id=20 WHERE name='Walmart';


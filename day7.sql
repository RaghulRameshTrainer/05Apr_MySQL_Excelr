use learnings;

-- JOINS:

-- INNER JOIN
-- OUTER JOIN
-- 	LEFT JOIN
--  RIGHT JOIN
--  FULL JOIN
-- SELF JOIN

CREATE TABLE CUSTOMER_TBL(
cust_id INT PRIMARY KEY,
cust_name VARCHAR(100),
city VARCHAR(20)
);


INSERT INTO CUSTOMER_TBL VALUES(1000,'Ramesh','Chennai');
INSERT INTO CUSTOMER_TBL VALUES(1001,'Malini','Bangalore');
INSERT INTO CUSTOMER_TBL VALUES(1002,'Raghul','Hyderabad');
INSERT INTO CUSTOMER_TBL VALUES(1003,'Arun','Pune');
INSERT INTO CUSTOMER_TBL VALUES(1004,'Shivani','Delhi');



CREATE TABLE TANSACTION_TBL(
trans_id INT PRIMARY KEY,
cust_id INT,
product_name VARCHAR(50),
amount INT
);

INSERT INTO TANSACTION_TBL VALUES(1,1000,'Laptop',75000);
INSERT INTO TANSACTION_TBL VALUES(2,1000,'Mobile',50000);
INSERT INTO TANSACTION_TBL VALUES(3,1001,'TV',65000);
INSERT INTO TANSACTION_TBL VALUES(4,1001,'Fridge',50000);
INSERT INTO TANSACTION_TBL VALUES(5,1002,'Desktop',55000);
INSERT INTO TANSACTION_TBL VALUES(6,1003,'Washing Machine',55000);
INSERT INTO TANSACTION_TBL VALUES(7,1003,'MicroOven',30000);
INSERT INTO TANSACTION_TBL VALUES(8,1003,'Laptop',210000);
INSERT INTO TANSACTION_TBL VALUES(9,1002,'Laptop',100000);
INSERT INTO TANSACTION_TBL VALUES(10,1100,'TV',70000);


-- INNER JOIN

SELECT * FROM CUSTOMER_TBL c INNER JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id;

SELECT c.cust_name, c.city,t.product_name,t.amount FROM CUSTOMER_TBL c INNER JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id;

SELECT c.cust_name, c.city,t.product_name,t.amount FROM CUSTOMER_TBL c INNER JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id
WHERE t.amount>50000;

-- LEFT JOIN
SELECT * FROM CUSTOMER_TBL c LEFT JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id;

SELECT * FROM CUSTOMER_TBL c LEFT JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id WHERE t.trans_id IS NULL;

-- RIGHT JOIN

SELECT * FROM CUSTOMER_TBL c RIGHT JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id;

SELECT * FROM CUSTOMER_TBL c RIGHT JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id WHERE c.cust_id IS NULL;

-- FULL JOIN (condition less join)
SELECT * FROM customer_tbl c JOIN TANSACTION_TBL t;


-- SELF JOIN

CREATE TABLE employee_table(
emp_id INT,
ename VARCHAR(100),
salary INT,
mgr_id int);


INSERT INTO employee_table VALUES(1,'Ramesh',10000,5);
INSERT INTO employee_table VALUES(2,'Guna',12000,5);
INSERT INTO employee_table VALUES(3,'Sridhar',20000,5);
INSERT INTO employee_table VALUES(4,'Pankaj',25000,5);
INSERT INTO employee_table VALUES(5,'Mohan',15000,6);
INSERT INTO employee_table VALUES(6,'Siva',14000,6);

SELECT * FROM employee_table;

SELECT e1.ename as emp_name -- , e1.salary as emp_salary, e2.ename as mgr_name,e2.salary as mgr_salary 	
FROM employee_table e1 JOIN employee_table e2	
ON e1.mgr_id=e2.emp_id WHERE e1.salary > e2.salary	;


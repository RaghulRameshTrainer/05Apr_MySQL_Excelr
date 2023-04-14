use learnings;

SELECT * FROM CUSTOMER_TBL;
RENAME TABLE TANSACTION_TBL TO TRANSACTION_TBL;
SELECT * FROM TRANSACTION_TBL;

CREATE TABLE ORDER_STATUS(
status_id INT,
trans_id INT,
deliver_status VARCHAR(20)
);

INSERT INTO ORDER_STATUS VALUES(1000,1,'Delivered'),
								(1001,2,'Delivered'),
                                (1001,3,'Delivered'),
                                (1001,4,'Delivered'),
                                (1001,5,'Delivered'),
                                (1001,6,'In-transiant'),
                                (1001,7,'Not Delivered'),
                                (1001,8,'Returned'),
                                (1001,0,'Not Delivered'),
                                (1001,10,'Returned');
                                
SELECT * FROM ORDER_STATUS;

ALTER TABLE ORDER_STATUS RENAME COLUMN deliver_status TO delivery_status;

-- cust_name, product_name, amount, delivery_status


SELECT c.cust_name, t.product_name, t.amount, o.delivery_status
FROM CUSTOMER_TBL c INNER JOIN TRANSACTION_TBL t ON c.cust_id=t.cust_id
INNER JOIN ORDER_STATUS o ON t.trans_id=o.trans_id;

SELECT c.cust_name,t.product_name, t.amount , o.delivery_status 
FROM CUSTOMER_TBL c LEFT JOIN TRANSACTION_TBL t ON c.cust_id=t.cust_id 
LEFT JOIN ORDER_STATUS o ON t.trans_id=o.trans_id;


-- GROUP BY

SELECT * FROM EMPLOYEES;

SELECT COUNT(*) FROM EMPLOYEES WHERE Department='Manufacturing';

SELECT COUNT(*) FROM EMPLOYEES;

SELECT Department, count(*) 
FROM Employees
GROUP BY Department
ORDER BY Department;

SELECT Department, count(*) 
FROM Employees
GROUP BY Department
ORDER BY count(*);

SELECT Department, count(*) 
FROM Employees
GROUP BY Department
ORDER BY count(*) ASC;


SELECT Department, count(*) 
FROM Employees
GROUP BY Department
ORDER BY count(*) DESC;

SELECT Department, Status, Count(*)
FROM Employees
GROUP BY Department, Status
ORDER BY Department;


SELECT Department, Status, Count(*)
FROM Employees
GROUP BY Department, Status
ORDER BY Department,Status DESC;


SELECT Department, Status, Count(*)
FROM Employees
GROUP BY Department, Status
ORDER BY Department,count(*) DESC;

SELECT Department, max(salary),min(salary)
FROM Employees
WHERE JobRating != 5
GROUP BY Department 
HAVING min(salary)>10000
ORDER BY Department ;


-- AUTO INCREMENT

CREATE TABLE country 
(
country_id INT PRIMARY KEY auto_increment,
country_name VARCHAR(100)
);

INSERT INTO country(country_name) VALUES('India'),
						  ('Pakistan'),
                          ('Sri Lanka'),
                          ('Nepal'),
                          ('Bangaladesh'),
                          ('China'),
                          ('Rushya');


SELECT * FROM COUNTRY;

INSERT INTO COUNTRY(country_name) VALUES('Finland'),('Dubai');

SELECT * FROM COUNTRY;

INSERT INTO COUNTRY(country_name) VALUES('Poland');

SELECT * FROM COUNTRY;

INSERT INTO COUNTRY VALUES(100,'Japan');

SELECT * FROM COUNTRY;

INSERT INTO COUNTRY(country_name) VALUES('Australia');

SELECT * FROM COUNTRY;

-- SUB QUERY

SELECT * FROM CUSTOMER_TBL;

SELECT * FROM TRANSACTION_TBL;

SELECT * FROM CUSTOMER_TBL
WHERE cust_id NOT IN (
SELECT distinct cust_id FROM TRANSACTION_TBL);

SELECT * FROM Employees;

SELECT First, Last, Department, Status
FROM Employees
WHERE salary = (
SELECT MAX(Salary) FROM Employees);

-- DELETE Vs Truncate Vs Drop

SELECT * FROM CUSTOMER;

SET SQL_SAFE_UPDATES=0;
DELETE FROM CUSTOMER WHERE custid=1003;  -- (delete a particular records)

DELETE FROM CUSTOMER;   -- (Delete entire table data)

DELETE FROM CUSTOMER WHERE gender='F';

SELECT * FROM pk_table;
TRUNCATE TABLE pk_table;  -- (Delete whole table data)

SELECT * FROM default_table;
DROP TABLE default_table;  -- (Delete both data as well as table)












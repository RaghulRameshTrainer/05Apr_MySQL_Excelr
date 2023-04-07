USE learnings;

SELECT * FROM CUSTOMER;

INSERT INTO customer(custid,custname,gender,city) VALUES(1005,'Guna','M','Chennai');

SELECT * FROM CUSTOMER;

INSERT INTO customer(custname,city,age,gender,date_of_birth,custid) VALUES('Satya','Hyderabad',30,'F','1993-01-05',1006);

SELECT * FROM CUSTOMER;

INSERT INTO customer VALUES(1007,'Saranya','F',33,'Delhi','1990-01-01');

INSERT INTO customer(custid,custname,gender,city,date_of_birth) VALUES(1008,'Sridhar','M','Delhi','1990-01-01');

-- UPDATE STATEMENT

SELECT * FROM CUSTOMER;

-- Syntax : UPDATE <table_name> SET colum_name = value WHERE custid=1008;

SET sql_safe_updates=0;
UPDATE customer SET age=40 WHERE custid=1008;

SELECT * FROM CUSTOMER;

UPDATE customer SET age=50, date_of_birth='1973-05-05' WHERE custid=1005;

SELECT * FROM CUSTOMER;

UPDATE customer SET city='Surat' WHERE city='Chennai';
SELECT * FROM CUSTOMER;

UPDATE customer SET city='Nashik' WHERE city='Hyderabad' and custid=1006;


-- DELETE statement

-- Syntax : DELETE FROM <table_name> WHERE condition;

SELECT * FROM CUSTOMER;

DELETE FROM customer WHERE custid=1006;

SELECT * FROM CUSTOMER;

DELETE FROM CUSTOMER WHERE age >= 35;

SELECT * FROM CUSTOMER;

DELETE FROM customer WHERE city IN ('Pune' , 'mumbai');    -- city='pune'  or city='mumbai'

SELECT * FROM CUSTOMER;

DELETE FROM CUSTOMER;










































































use learnings;

-- SUM
-- COUNT
-- MIN
-- MAX
-- AVG

-- STRING FUNCTIONS

SELECT * FROM customer_tbl;

SELECT cust_name, LENGTH(cust_name) FROM customer_tbl;

SELECT cust_name, CHAR_LENGTH(cust_name) FROM customer_tbl;

SELECT cust_name, CHARACTER_LENGTH(cust_name) FROM customer_tbl;

-- CONCAT, CONCAT_WS

SELECT * FROM customer_tbl;

SELECT CONCAT(cust_name,'-',city) as cust_info FROM customer_tbl;

SELECT CONCAT(cust_id,'-',cust_name,' ',city) as cust_info FROM customer_tbl;

SELECT CONCAT_WS('-', cust_id, cust_name,city) as cust_details FROM customer_tbl;

-- FORMAT

SELECT FORMAT(12345.67890,2);
SELECT FORMAT(12345.67190,2);

SELECT FORMAT(41800000.67190,0);

-- UPPER , UCASE , LOWER, LCASE

SELECT * FROM customer_tbl;

SELECT cust_id, UPPER(cust_name), city FROM customer_tbl;

SELECT cust_id, UPPER(cust_name), UCASE(city) FROM customer_tbl;

SELECT * FROM customer_tbl;

SELECT cust_id, LOWER(cust_name), LCASE(city) FROM customer_tbl;

-- LIKE

SELECT * FROM customer_tbl WHERE cust_name LIKE 'r%';

SELECT * FROM customer_tbl WHERE cust_name LIKE 'r%l';

SELECT * FROM customer_tbl WHERE city LIKE '%e';

SELECT * FROM customer_tbl WHERE cust_name LIKE 'ra%';

SELECT * FROM customer_tbl WHERE city LIKE '%nn%';

SELECT * FROM customer_tbl WHERE cust_name LIKE 'M%' OR cust_name LIKE 'A%'; 

SELECT * FROM customer_tbl WHERE city LIKE '%o_e';

SELECT * FROM customer_tbl WHERE cust_name LIKE 'r_m%';

SELECT * FROM customer_tbl WHERE city LIKE '_e%';


SELECT * FROM customer_tbl;

-- REVERSE

SELECT cust_name , REVERSE(cust_name) as r_name  FROM customer_tbl WHERE cust_name LIKE 'r_m%';

-- REPEAT , REPLACE

SELECT REPEAT('CHENNAI ' ,5);

SELECT * FROM customer_tbl;

SELECT city, REPLACE(city, 'e','E') FROM customer_tbl;

SELECT city, REPLACE(city, 'Pune','Mumbai') FROM customer_tbl;

SELECT * FROM customer_tbl;

SELECT cust_id, cust_name , REPLACE(REPLACE(city,'Pune','Mumbai'),'Delhi','Noida') FROM customer_tbl;


-- DATE FUNCTION

SELECT current_date();

SELECT current_timestamp();

SELECT current_time();

SELECT NOW();

-- DATE FUNCTIONS

-- %a-Abbreviated weekday name (Sun-Sat)
-- %W - weekday fullname (Sunday...Saturday)
-- %b-Abbreviated month name (Jan-Dec)
-- %M-Month name (January-December)
-- %c-Month, numeric (0-12)
-- %d-Day of month, numeric (00-31)
-- %D-Day of month with English suffix (0th, 1st, 2nd, 3rd)
-- %y-Year, numeric, two digits
-- %Y-Year, numeric, four digits
-- %H-Hour (00-23)
-- %h-Hour (01-12)
-- %I-Hour (01-12)
-- %p-AM or PM
-- %i-Minutes, numeric (00-59)
-- %j-Day of year (001-366)
-- %m-Month, numeric (00-12)
-- %r-Time, 12-hour (hh:mm:ss followed by AM or PM)
-- %S-Seconds (00-59)
-- %T-Time, 24-hour (hh:mm:ss)
-- %w-Day of the week (0=Sunday, 6=Saturday)

SELECT current_timestamp();
-- 18th April Tuesday 2023 08:58 PM

SELECT DATE_FORMAT(current_timestamp(),"%D %M %W %Y %l:%i %p");

SELECT current_date();
SELECT DATE_FORMAT(current_date(), "%d-%c-%Y");


-- TCL - TRANSACTION CONTROL LANGUAGE
-- COMMIT ROLLBACK SAVEPOINT

SET SQL_SAFE_UPDATES=0;

START TRANSACTION;
SELECT * FROM transaction_tbl;

UPDATE transaction_tbl SET amount=150000 WHERE trans_id=8;
SELECT * FROM transaction_tbl;
COMMIT;

START TRANSACTION;
SELECT * FROM transaction_tbl;
UPDATE transaction_tbl SET amount=60000;
SELECT * FROM transaction_tbl;
ROLLBACK;

SELECT * FROM transaction_tbl;


START TRANSACTION;

SAVEPOINT sp1;
	INSERT INTO transaction_tbl values(11,1002,'Car',1500000);
    SELECT * FROM transaction_tbl;

SAVEPOINT sp2;
	INSERT INTO transaction_tbl values(13,1003,'Lunch',200);
    SELECT * FROM transaction_tbl;
    
ROLLBACK TO sp2;


START TRANSACTION;

SELECT * FROM transaction_tbl;

DELETE FROM  transaction_tbl;

SELECT * FROM transaction_tbl;

ROLLBACK;

START TRANSACTION;

SELECT * FROM customer_tbl;

truncate customer_tbl;

SELECT * FROM customer_tbl;

ROLLBACK;


START TRANSACTION;

SELECT * FROM COUNTRY;

DELETE FROM COUNTRY;

ROLLBACK;


-- DATA CONTROL LANGUGE

SELECT current_user();

-- PRIVILEGES:
-- SELECT
-- INSERT
-- UPDATE
-- DELETE
-- DROP
-- ALTER
-- INDEX
-- CREATE
-- GRANT
-- ALL

GRANT SELECT ON country TO root@localhost;


GRANT SELECT,INSERT,UPDATE ON country TO root@localhost;

REVOKE INSERT,UPDATE ON country FROM root@localhost;



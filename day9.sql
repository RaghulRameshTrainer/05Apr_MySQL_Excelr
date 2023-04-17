use learnings;

-- VIEW (Virtual Table  -- READ ONLY table)

SELECT * FROM Employees;

CREATE VIEW emp_data AS
SELECT First,Last,Department,Status FROM Employees;

SELECT * FROM emp_data;

SELECT * FROM emp_data WHERE Status='Full Time';

CREATE VIEW manufacture_emp AS
SELECT First,Last,Department , Status FROM Employees WHERE Department='Manufacturing';

SELECT * FROM manufacture_emp;

SELECT Department,Status, count(*)
FROM manufacture_emp
GROUP BY Department,Status;

-- INDEX

SHOW indexes FROM Employees;

CREATE INDEX emp_idx ON Employees(EmployeeID);

SHOW indexes FROM Employees;

SELECT * FROM Employees WHERE EmployeeId=200;

CREATE INDEX dept_idx ON Employees(Department, Status);

SHOW indexes FROM Employees;

SELECT * FROM Employees WHERE Department='Manufacturing' AND status='Full Time';

-- CASE STATEMENT

-- SYNTAX:

--   CASE
-- 	WHEN <condition1> THEN <expr>
--     WHEN <condition2> THEN <expr2>
--     .
--     .
--     .
--     ELSE <expression>
--     END AS column_name
--     

SELECT * FROM Employees;

SELECT First, Last, Department, JobRating,CASE 
								  WHEN JobRating = 1 THEN 'A'
                                  WHEN JobRating = 2 THEN 'B'
                                  WHEN JobRating = 3 THEN 'C'
                                  WHEN JobRating = 4 THEN 'D'
                                  ELSE 'E'
                                  END AS Grade
FROM Employees;
                                  

    

SELECT First, Last, Department, Salary, CASE 
											WHEN Salary > 70000 THEN 'Highly Paid'
                                            WHEN Salary BETWEEN 40000 AND 70000 THEN 'Good Pay'
                                            ELSE 'Less Paid'
                                            END AS Salary_Catgory
FROM Employees;

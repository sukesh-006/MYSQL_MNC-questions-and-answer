USE Practice;

-- Step 1: Create Table
CREATE TABLE Salary_Q40 (
    id INT PRIMARY KEY,
    employee_id INT,
    amount INT,
    pay_date DATE,
    department_id INT
);

-- Step 2: Insert values
INSERT INTO Salary_Q40 (id, employee_id, amount, pay_date, department_id) VALUES
(1, 1, 9000, '2017-03-31', 1),
(2, 2, 6000, '2017-03-31', 2),
(3, 3, 10000, '2017-03-31', 2),
(4, 1, 7000, '2017-02-28', 1),
(5, 2, 6000, '2017-02-28', 2),
(6, 3, 8000, '2017-02-28', 2);

-- Step 3: Average Salary vs Department Average
WITH MonthlyDeptAvg AS (
    SELECT DATE_FORMAT(pay_date, '%Y-%m') AS pay_month, department_id, AVG(amount) AS dept_avg
    FROM Salary_Q40
    GROUP BY DATE_FORMAT(pay_date, '%Y-%m'), department_id
),
MonthlyCompanyAvg AS (
    SELECT DATE_FORMAT(pay_date, '%Y-%m') AS pay_month, AVG(amount) AS comp_avg
    FROM Salary_Q40
    GROUP BY DATE_FORMAT(pay_date, '%Y-%m')
)
SELECT d.pay_month, d.department_id,
       CASE 
           WHEN d.dept_avg > c.comp_avg THEN 'higher'
           WHEN d.dept_avg < c.comp_avg THEN 'lower'
           ELSE 'same'
       END AS comparison
FROM MonthlyDeptAvg d
JOIN MonthlyCompanyAvg c ON d.pay_month = c.pay_month;

-- Explanation:
-- Calculate department average per month.
-- Calculate company average per month.
-- Compare the two averages to determine if it is higher, lower, or the same.

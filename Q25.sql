USE Practice;

-- Step 1: Create Table
CREATE TABLE Employees_Q25 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT
);

-- Step 2: Insert values
INSERT INTO Employees_Q25 (employee_id, name, salary) VALUES
(2, 'Meir', 3000),
(3, 'Michael', 3800),
(7, 'Addilyn', 7400),
(8, 'Juan', 6100),
(9, 'Kannon', 7700);

-- Step 3: Calculate special bonus
SELECT employee_id,
       CASE 
           WHEN MOD(employee_id, 2) = 1 AND name NOT LIKE 'M%' THEN salary
           ELSE 0
       END AS bonus
FROM Employees_Q25
ORDER BY employee_id;

-- Explanation:
-- The bonus is 100% of the salary if employee_id is odd (MOD = 1) AND name does not start with 'M'.
-- Otherwise, the bonus is 0.

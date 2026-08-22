USE Practice;

-- Step 1: Create Tables
CREATE TABLE Department_Q18 (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Employee_Q18 (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary INT,
    departmentId INT
);

-- Step 2: Insert values
INSERT INTO Department_Q18 (id, name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO Employee_Q18 (id, name, salary, departmentId) VALUES
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1),
(3, 'Henry', 80000, 2),
(4, 'Sam', 60000, 2),
(5, 'Max', 90000, 1);

-- Step 3: Highest salary in each department
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee_Q18 e
JOIN Department_Q18 d ON e.departmentId = d.id
WHERE (e.departmentId, e.salary) IN (
    SELECT departmentId, MAX(salary)
    FROM Employee_Q18
    GROUP BY departmentId
);

-- Explanation:
-- Identify the MAX(salary) per department using GROUP BY.
-- Then filter the main Employee table where the tuple (department, salary) matches the maximum.

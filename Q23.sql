USE Practice;

-- Step 1: Create Tables
CREATE TABLE Department_Q23 (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Employee_Q23 (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary INT,
    departmentId INT
);

-- Step 2: Insert values
INSERT INTO Department_Q23 (id, name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO Employee_Q23 (id, name, salary, departmentId) VALUES
(1, 'Joe', 85000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1),
(7, 'Will', 70000, 1);

-- Step 3: Top 3 Salaries per Department
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM (
    SELECT name, salary, departmentId,
           DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) as rnk
    FROM Employee_Q23
) e
JOIN Department_Q23 d ON e.departmentId = d.id
WHERE e.rnk <= 3;

-- Explanation:
-- DENSE_RANK() partitions by departmentId and orders by salary descending.
-- We filter out employees whose rank is <= 3 to get the top earners.

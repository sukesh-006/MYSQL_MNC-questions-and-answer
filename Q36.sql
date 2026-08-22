USE Practice;

-- Step 1: Create Tables
CREATE TABLE Department_Q36 (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Employee_Q36 (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary INT,
    departmentId INT
);

-- Step 2: Insert values
INSERT INTO Department_Q36 (id, name) VALUES
(1, 'IT'), (2, 'Sales');

INSERT INTO Employee_Q36 (id, name, salary, departmentId) VALUES
(1, 'Joe', 85000, 1), (2, 'Henry', 80000, 2), (3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1), (5, 'Janet', 69000, 1), (6, 'Randy', 85000, 1), (7, 'Will', 70000, 1);

-- Step 3: Department Top Three Salaries (Without Window Functions Variant)
SELECT d.name AS Department, e1.name AS Employee, e1.salary AS Salary
FROM Employee_Q36 e1
JOIN Department_Q36 d ON e1.departmentId = d.id
WHERE 3 > (
    SELECT COUNT(DISTINCT e2.salary)
    FROM Employee_Q36 e2
    WHERE e2.salary > e1.salary AND e1.departmentId = e2.departmentId
);

-- Explanation:
-- For each employee, we count how many distinct, strictly higher salaries exist in their department.
-- If this count is less than 3, they are in the top 3 earners for their department.

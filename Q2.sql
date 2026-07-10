use Practice;
-- Step 1: Create the table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary INT,
    manager_id INT
);

-- Step 2: Insert values
INSERT INTO Employee (emp_id, emp_name, salary, manager_id) VALUES
(1, 'Alice', 90000, NULL),
(2, 'Bob', 50000, 1),
(3, 'Charlie', 100000, 1),
(4, 'David', 45000, 2),
(5, 'Emma', 65000, 2),
(6, 'Frank', 120000, 3);
--
SELECT
    e.emp_name
FROM Employee e
JOIN Employee m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;


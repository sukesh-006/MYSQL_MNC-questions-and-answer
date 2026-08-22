USE Practice;

-- Step 1: Create Table
CREATE TABLE Employee_Q39 (
    id INT,
    month INT,
    salary INT,
    PRIMARY KEY (id, month)
);

-- Step 2: Insert values
INSERT INTO Employee_Q39 (id, month, salary) VALUES
(1, 1, 20),
(2, 1, 20),
(1, 2, 30),
(2, 2, 30),
(3, 2, 40),
(1, 3, 40),
(3, 3, 60),
(1, 4, 60),
(3, 4, 70);

-- Step 3: Find Cumulative Salary of an Employee over the last 3 months
SELECT e1.id, e1.month, SUM(e2.salary) AS Salary
FROM Employee_Q39 e1
JOIN Employee_Q39 e2 ON e1.id = e2.id 
                     AND e2.month BETWEEN e1.month - 2 AND e1.month
                     AND e1.month < (SELECT MAX(month) FROM Employee_Q39 WHERE id = e1.id)
GROUP BY e1.id, e1.month
ORDER BY e1.id, e1.month DESC;

-- Explanation:
-- Join the table to itself matching the last 3 months.
-- Exclude the absolute maximum (current) month for each employee.

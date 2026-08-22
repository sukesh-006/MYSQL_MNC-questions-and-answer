USE Practice;

-- Step 1: Create Table
CREATE TABLE Employee_Q33 (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    department VARCHAR(255),
    managerId INT
);

-- Step 2: Insert values
INSERT INTO Employee_Q33 (id, name, department, managerId) VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);

-- Step 3: Manager with at Least 5 Direct Reports
SELECT e1.name
FROM Employee_Q33 e1
JOIN Employee_Q33 e2 ON e1.id = e2.managerId
GROUP BY e1.id, e1.name
HAVING COUNT(e2.id) >= 5;

-- Explanation:
-- Join the employee table to itself to match managers with their reports.
-- Group by the manager's ID and filter for those with >= 5 reports.

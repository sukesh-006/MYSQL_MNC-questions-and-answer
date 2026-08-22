USE Practice;

-- Step 1: Create Table
CREATE TABLE Employee_Q38 (
    id INT PRIMARY KEY,
    company VARCHAR(255),
    salary INT
);

-- Step 2: Insert values
INSERT INTO Employee_Q38 (id, company, salary) VALUES
(1, 'A', 2341),
(2, 'A', 341),
(3, 'A', 15),
(4, 'A', 15314),
(5, 'A', 451),
(6, 'A', 513),
(7, 'B', 15),
(8, 'B', 13),
(9, 'B', 1154),
(10, 'B', 1345),
(11, 'B', 1221),
(12, 'B', 234),
(13, 'C', 2345),
(14, 'C', 2645),
(15, 'C', 2645),
(16, 'C', 2652),
(17, 'C', 65);

-- Step 3: Median Employee Salary
WITH RankedEmployees AS (
    SELECT id, company, salary,
           ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary, id) AS rn,
           COUNT(*) OVER (PARTITION BY company) AS total_cnt
    FROM Employee_Q38
)
SELECT id, company, salary
FROM RankedEmployees
WHERE rn IN (FLOOR((total_cnt + 1)/2), CEIL((total_cnt + 1)/2));

-- Explanation:
-- Calculate the rank and total count per company.
-- Select rows where the rank is the mathematical median position.

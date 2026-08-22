USE Practice;

-- Step 1: Create Tables
CREATE TABLE Project_Q30 (
    project_id INT,
    employee_id INT,
    PRIMARY KEY(project_id, employee_id)
);

CREATE TABLE Employee_Q30 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    experience_years INT
);

-- Step 2: Insert values
INSERT INTO Project_Q30 (project_id, employee_id) VALUES
(1, 1), (1, 2), (1, 3), (2, 1), (2, 4);

INSERT INTO Employee_Q30 (employee_id, name, experience_years) VALUES
(1, 'Khaled', 3), (2, 'Ali', 2), (3, 'John', 1), (4, 'Doe', 2);

-- Step 3: Project with the highest headcount
SELECT project_id
FROM Project_Q30
GROUP BY project_id
HAVING COUNT(employee_id) = (
    SELECT MAX(emp_count) FROM (
        SELECT COUNT(employee_id) AS emp_count FROM Project_Q30 GROUP BY project_id
    ) tmp
);

-- Explanation:
-- We find the maximum employee count per project using a subquery.
-- Then we filter the grouped projects having their count equal to that maximum.

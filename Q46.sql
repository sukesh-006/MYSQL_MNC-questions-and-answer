USE Practice;

-- Step 1: Create Table
CREATE TABLE Student_Q46 (
    name VARCHAR(50),
    continent VARCHAR(50)
);

-- Step 2: Insert values
INSERT INTO Student_Q46 (name, continent) VALUES
('Jane', 'America'), ('Pascal', 'Europe'), ('Xi', 'Asia'), ('Jack', 'America');

-- Step 3: Student Report By Geography (Pivot Table)
WITH NumberedStudents AS (
    SELECT name, continent,
           ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name) as rn
    FROM Student_Q46
)
SELECT 
    MAX(CASE WHEN continent = 'America' THEN name END) AS America,
    MAX(CASE WHEN continent = 'Asia' THEN name END) AS Asia,
    MAX(CASE WHEN continent = 'Europe' THEN name END) AS Europe
FROM NumberedStudents
GROUP BY rn;

-- Explanation:
-- We assign a row number to each student per continent sorted alphabetically.
-- Then we pivot using conditional aggregation (MAX/CASE) and group by the row number.

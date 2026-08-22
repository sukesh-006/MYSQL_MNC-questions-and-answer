USE Practice;

-- Step 1: Create Table
CREATE TABLE Country_Q4 (
    name VARCHAR(50) PRIMARY KEY,
    continent VARCHAR(50),
    area INT,
    population INT,
    gdp BIGINT
);

-- Step 2: Insert values
INSERT INTO Country_Q4 (name, continent, area, population, gdp) VALUES
('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
('Albania', 'Europe', 28748, 2831741, 12960000000),
('Algeria', 'Africa', 2381741, 37100000, 188681000000),
('Andorra', 'Europe', 468, 78115, 3712000000),
('Angola', 'Africa', 1246700, 20609294, 100990000000);

-- Step 3: Query to find big countries
SELECT name, population, area
FROM Country_Q4
WHERE area > 3000000 OR population > 25000000;

-- Explanation:
-- A country is big if it has an area of at least 3 million square km or a population of at least 25 million.
-- We use the OR operator to check if either condition is met.

USE Practice;

-- Step 1: Create Table
CREATE TABLE Insurance_Q27 (
    pid INT PRIMARY KEY,
    tiv_2015 FLOAT,
    tiv_2016 FLOAT,
    lat FLOAT,
    lon FLOAT
);

-- Step 2: Insert values
INSERT INTO Insurance_Q27 (pid, tiv_2015, tiv_2016, lat, lon) VALUES
(1, 10, 5, 10, 10),
(2, 20, 20, 20, 20),
(3, 10, 30, 20, 20),
(4, 10, 40, 40, 40);

-- Step 3: Investments in 2016
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance_Q27
WHERE tiv_2015 IN (
    SELECT tiv_2015 FROM Insurance_Q27 GROUP BY tiv_2015 HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon FROM Insurance_Q27 GROUP BY lat, lon HAVING COUNT(*) = 1
);

-- Explanation:
-- Find policyholders who share the same tiv_2015 with at least one other policyholder.
-- Also ensure their coordinates (lat, lon) are unique across all policyholders.

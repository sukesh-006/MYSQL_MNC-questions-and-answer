USE Practice;

-- Step 1: Create Table
CREATE TABLE SystemState_Q44 (
    date DATE PRIMARY KEY,
    state VARCHAR(50)
);

-- Step 2: Insert values
INSERT INTO SystemState_Q44 (date, state) VALUES
('2019-01-01', 'failed'), ('2019-01-02', 'failed'), ('2019-01-03', 'succeeded'),
('2019-01-04', 'succeeded'), ('2019-01-05', 'succeeded'), ('2019-01-06', 'failed');

-- Step 3: Report Contiguous Dates
WITH NumberedStates AS (
    SELECT state, date,
           ROW_NUMBER() OVER (ORDER BY date) - ROW_NUMBER() OVER (PARTITION BY state ORDER BY date) AS grp
    FROM SystemState_Q44
)
SELECT state, MIN(date) AS start_date, MAX(date) AS end_date
FROM NumberedStates
GROUP BY state, grp
ORDER BY start_date;

-- Explanation:
-- By subtracting a partitioned row number from a global row number,
-- contiguous days of the same state will have the same 'grp' value.
-- We group by this value and state to find start and end dates.

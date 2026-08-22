USE Practice;

-- Step 1: Create Table
CREATE TABLE Activity_Q21 (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

-- Step 2: Insert values
INSERT INTO Activity_Q21 (player_id, device_id, event_date, games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-03-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

-- Step 3: Consecutive logins fraction
WITH FirstLogins AS (
    SELECT player_id, MIN(event_date) as first_date
    FROM Activity_Q21
    GROUP BY player_id
)
SELECT ROUND(
    SUM(CASE WHEN a.event_date = DATE_ADD(f.first_date, INTERVAL 1 DAY) THEN 1 ELSE 0 END) 
    / COUNT(DISTINCT f.player_id), 2
) AS fraction
FROM FirstLogins f
LEFT JOIN Activity_Q21 a ON f.player_id = a.player_id AND a.event_date = DATE_ADD(f.first_date, INTERVAL 1 DAY);

-- Explanation:
-- We find the first login date for all users.
-- We check if they logged in precisely 1 day after their first date and divide by total users.

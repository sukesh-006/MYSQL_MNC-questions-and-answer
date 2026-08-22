USE Practice;

-- Step 1: Create Table
CREATE TABLE Log_Q47 (
    server_id INT,
    status VARCHAR(50),
    status_time DATETIME
);

-- Step 2: Insert values
INSERT INTO Log_Q47 (server_id, status, status_time) VALUES
(1, 'START', '2023-01-01 10:00:00'),
(1, 'STOP', '2023-01-01 12:30:00'),
(2, 'START', '2023-01-01 09:00:00'),
(2, 'STOP', '2023-01-01 10:15:00'),
(1, 'START', '2023-01-01 13:00:00'),
(1, 'STOP', '2023-01-01 14:00:00');

-- Step 3: Server Downtime Calculation (Total active runtime)
WITH PairedLogs AS (
    SELECT server_id,
           status_time AS start_time,
           LEAD(status_time) OVER (PARTITION BY server_id ORDER BY status_time) AS stop_time,
           status
    FROM Log_Q47
)
SELECT server_id,
       SUM(TIMESTAMPDIFF(MINUTE, start_time, stop_time)) / 60.0 AS total_uptime_hours
FROM PairedLogs
WHERE status = 'START'
GROUP BY server_id;

-- Explanation:
-- We use LEAD() to pair the START and STOP times.
-- We calculate the time difference in minutes for START logs, convert to hours, and sum.

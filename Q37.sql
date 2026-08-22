USE Practice;

-- Step 1: Create Tables
CREATE TABLE Users_Q37 (
    users_id INT PRIMARY KEY,
    banned VARCHAR(50),
    role VARCHAR(50)
);

CREATE TABLE Trips_Q37 (
    id INT PRIMARY KEY,
    client_id INT,
    driver_id INT,
    city_id INT,
    status VARCHAR(50),
    request_at DATE
);

-- Step 2: Insert values
INSERT INTO Users_Q37 (users_id, banned, role) VALUES
(1, 'No', 'client'), (2, 'Yes', 'client'), (3, 'No', 'client'),
(4, 'No', 'client'), (10, 'No', 'driver'), (11, 'No', 'driver'),
(12, 'No', 'driver'), (13, 'No', 'driver');

INSERT INTO Trips_Q37 (id, client_id, driver_id, city_id, status, request_at) VALUES
(1, 1, 10, 1, 'completed', '2013-10-01'),
(2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
(3, 3, 12, 6, 'completed', '2013-10-01'),
(4, 4, 13, 6, 'cancelled_by_client', '2013-10-01');

-- Step 3: Trips and Users (Cancellation Rate)
SELECT t.request_at AS Day,
       ROUND(
           SUM(CASE WHEN t.status LIKE 'cancelled%' THEN 1 ELSE 0 END) / COUNT(*),
           2
       ) AS 'Cancellation Rate'
FROM Trips_Q37 t
JOIN Users_Q37 c ON t.client_id = c.users_id AND c.banned = 'No'
JOIN Users_Q37 d ON t.driver_id = d.users_id AND d.banned = 'No'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at;

-- Explanation:
-- We filter for unbanned clients and drivers, and for trips within the specified date range.
-- The cancellation rate is the count of cancelled trips divided by the total valid trips per day.

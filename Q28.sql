USE Practice;

-- Step 1: Create Table
CREATE TABLE Logins_Q28 (
    id INT,
    login_date DATE
);

-- Step 2: Insert values
INSERT INTO Logins_Q28 (id, login_date) VALUES
(1, '2020-05-30'),
(1, '2020-05-31'),
(1, '2020-06-01'),
(2, '2020-06-01'),
(2, '2020-06-02');

-- Step 3: Active users for 3 consecutive days
SELECT DISTINCT l1.id
FROM Logins_Q28 l1
JOIN Logins_Q28 l2 ON l1.id = l2.id AND DATEDIFF(l2.login_date, l1.login_date) = 1
JOIN Logins_Q28 l3 ON l2.id = l3.id AND DATEDIFF(l3.login_date, l2.login_date) = 1;

-- Explanation:
-- Join the Logins table with itself twice, checking if the dates differ by exactly 1 day.
-- This identifies users who have logged in for 3 consecutive days.

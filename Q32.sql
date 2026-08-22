USE Practice;

-- Step 1: Create Tables
CREATE TABLE FriendRequest_Q32 (
    sender_id INT,
    send_to_id INT,
    request_date DATE
);

CREATE TABLE RequestAccepted_Q32 (
    requester_id INT,
    accepter_id INT,
    accept_date DATE
);

-- Step 2: Insert values
INSERT INTO FriendRequest_Q32 (sender_id, send_to_id, request_date) VALUES
(1, 2, '2016-06-01'), (1, 3, '2016-06-01'), (1, 4, '2016-06-01'), (2, 3, '2016-06-02'), (3, 4, '2016-06-09');

INSERT INTO RequestAccepted_Q32 (requester_id, accepter_id, accept_date) VALUES
(1, 2, '2016-06-03'), (1, 3, '2016-06-08'), (2, 3, '2016-06-08'), (3, 4, '2016-06-09'), (3, 4, '2016-06-10');

-- Step 3: Friend requests overall acceptance rate
SELECT 
    ROUND(
        COALESCE(
            (SELECT COUNT(*) FROM (SELECT DISTINCT requester_id, accepter_id FROM RequestAccepted_Q32) a)
            / NULLIF((SELECT COUNT(*) FROM (SELECT DISTINCT sender_id, send_to_id FROM FriendRequest_Q32) r), 0),
        0), 
    2) AS accept_rate;

-- Explanation:
-- We calculate the total unique accepted requests and divide it by the total unique sent requests.
-- COALESCE and NULLIF are used to avoid division by zero.

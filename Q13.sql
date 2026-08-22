USE Practice;

-- Step 1: Create Table
CREATE TABLE DailySales_Q13 (
    date_id DATE,
    make_name VARCHAR(50),
    lead_id INT,
    partner_id INT
);

-- Step 2: Insert values
INSERT INTO DailySales_Q13 (date_id, make_name, lead_id, partner_id) VALUES
('2020-12-08', 'toyota', 0, 1),
('2020-12-08', 'toyota', 1, 0),
('2020-12-08', 'toyota', 1, 2),
('2020-12-07', 'toyota', 0, 2),
('2020-12-07', 'toyota', 0, 1),
('2020-12-08', 'honda', 1, 2),
('2020-12-08', 'honda', 2, 1),
('2020-12-07', 'honda', 0, 1),
('2020-12-07', 'honda', 1, 2),
('2020-12-07', 'honda', 2, 1);

-- Step 3: Find distinct leads and partners per date and make
SELECT date_id, make_name, 
       COUNT(DISTINCT lead_id) AS unique_leads, 
       COUNT(DISTINCT partner_id) AS unique_partners
FROM DailySales_Q13
GROUP BY date_id, make_name;

-- Explanation:
-- We group by date and make_name, and use COUNT(DISTINCT) for both leads and partners.

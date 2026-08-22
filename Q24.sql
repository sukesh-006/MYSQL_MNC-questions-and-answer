USE Practice;

-- Step 1: Create Tables
CREATE TABLE Users_Q24 (
    user_id INT PRIMARY KEY,
    join_date DATE,
    favorite_brand VARCHAR(50)
);

CREATE TABLE Items_Q24 (
    item_id INT PRIMARY KEY,
    item_brand VARCHAR(50)
);

CREATE TABLE Orders_Q24 (
    order_id INT PRIMARY KEY,
    order_date DATE,
    item_id INT,
    buyer_id INT,
    seller_id INT
);

-- Step 2: Insert values
INSERT INTO Users_Q24 (user_id, join_date, favorite_brand) VALUES
(1, '2018-01-01', 'Lenovo'),
(2, '2018-02-09', 'Samsung'),
(3, '2018-01-19', 'LG'),
(4, '2018-05-21', 'HP');

INSERT INTO Items_Q24 (item_id, item_brand) VALUES
(1, 'Samsung'),
(2, 'Lenovo'),
(3, 'LG'),
(4, 'HP');

INSERT INTO Orders_Q24 (order_id, order_date, item_id, buyer_id, seller_id) VALUES
(1, '2019-08-01', 4, 1, 2),
(2, '2018-08-02', 2, 1, 3),
(3, '2019-08-03', 3, 2, 3),
(4, '2018-08-04', 1, 4, 2),
(5, '2018-08-04', 1, 3, 4),
(6, '2019-08-05', 2, 2, 4);

-- Step 3: Market Analysis for second sale
WITH RankedOrders AS (
    SELECT seller_id, item_id,
           ROW_NUMBER() OVER (PARTITION BY seller_id ORDER BY order_date) AS rn
    FROM Orders_Q24
)
SELECT u.user_id,
       CASE 
           WHEN i.item_brand = u.favorite_brand THEN 'yes' 
           ELSE 'no' 
       END AS 2nd_item_fav_brand
FROM Users_Q24 u
LEFT JOIN RankedOrders r ON u.user_id = r.seller_id AND r.rn = 2
LEFT JOIN Items_Q24 i ON r.item_id = i.item_id;

-- Explanation:
-- Use ROW_NUMBER() to rank a seller's orders chronologically.
-- LEFT JOIN checks the 2nd order (rn=2) against their favorite brand.

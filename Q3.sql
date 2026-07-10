-- Step 1: Create the table
Use Practice;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Step 2: Insert values
INSERT INTO Customer (customer_id, customer_name) VALUES
(1, 'Rahul'),
(2, 'Akshaya'),
(3, 'Ankit'),
(4, 'Sneha'),
(5, 'Vijay');
-- Step 1: Create the table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
-- Step 2: Insert values
INSERT INTO Orders (order_id, customer_id) VALUES
(101, 1),
(102, 3),
(103, 3),
(104, 5);

-- Select * from Orders;
-- Select * from Customer;
SELECT c.customer_name
FROM Customer c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;


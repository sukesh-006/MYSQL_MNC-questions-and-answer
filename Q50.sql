USE Practice;

-- Step 1: Create Tables
CREATE TABLE Customers_Q50 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE Contacts_Q50 (
    user_id INT,
    contact_name VARCHAR(255),
    contact_email VARCHAR(255)
);

CREATE TABLE Invoices_Q50 (
    invoice_id INT PRIMARY KEY,
    price INT,
    user_id INT
);

-- Step 2: Insert values
INSERT INTO Customers_Q50 (customer_id, customer_name, email) VALUES
(1, 'Alice', 'alice@gmail.com'),
(2, 'Bob', 'bob@gmail.com'),
(3, 'Alex', 'alex@gmail.com');

INSERT INTO Contacts_Q50 (user_id, contact_name, contact_email) VALUES
(1, 'Bob', 'bob@gmail.com'),
(1, 'John', 'john@gmail.com'),
(2, 'Alice', 'alice@gmail.com');

INSERT INTO Invoices_Q50 (invoice_id, price, user_id) VALUES
(77, 100, 1),
(88, 200, 1),
(99, 300, 2);

-- Step 3: Number of Trusted Contacts
SELECT i.invoice_id,
       c.customer_name,
       i.price,
       COUNT(cnt.contact_email) AS contacts_cnt,
       SUM(CASE WHEN cnt.contact_email IN (SELECT email FROM Customers_Q50) THEN 1 ELSE 0 END) AS trusted_contacts_cnt
FROM Invoices_Q50 i
JOIN Customers_Q50 c ON i.user_id = c.customer_id
LEFT JOIN Contacts_Q50 cnt ON c.customer_id = cnt.user_id
GROUP BY i.invoice_id, c.customer_name, i.price
ORDER BY i.invoice_id;

-- Explanation:
-- Join Invoices with Customers, then LEFT JOIN with Contacts to count total contacts.
-- A trusted contact is one whose email exists in the Customers table.
-- We use a conditional SUM to count these trusted contacts per invoice.

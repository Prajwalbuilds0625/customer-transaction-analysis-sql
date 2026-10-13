
USE customer_transaction_analysis;

SELECT * FROM customers;

SELECT * FROM transactions;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_transactions
FROM transactions;



USE customer_transaction_analysis;

-- 1. Check for missing customer names
SELECT *
FROM customers
WHERE customer_name IS NULL
   OR TRIM(customer_name) = '';

-- 2. Check for missing transaction details
SELECT *
FROM transactions
WHERE transaction_date IS NULL
   OR product_name IS NULL
   OR category IS NULL
   OR payment_status IS NULL;

-- 3. Check for invalid quantities
SELECT *
FROM transactions
WHERE quantity IS NULL
   OR quantity <= 0;

-- 4. Check for invalid prices
SELECT *
FROM transactions
WHERE unit_price IS NULL
   OR unit_price <= 0;

-- 5. Check for invalid payment statuses
SELECT *
FROM transactions
WHERE payment_status NOT IN
('Completed', 'Pending', 'Failed')
   OR payment_status IS NULL;

-- 6. Check for duplicate transaction IDs
SELECT
    transaction_id,
    COUNT(*) AS duplicate_count
FROM transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- 7. Check for customer IDs missing from customers table
SELECT t.*
FROM transactions t
LEFT JOIN customers c
    ON t.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 8. Find unusually large transaction quantities
SELECT *
FROM transactions
WHERE quantity >= 10;

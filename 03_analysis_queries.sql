
USE customer_transaction_analysis;

INSERT INTO transactions
(transaction_id, customer_id, transaction_date,
 product_name, category, quantity, unit_price, payment_status)
VALUES
(101, 1, '2025-06-01', 'Laptop', 'Electronics', 1, 55000.00, 'Completed'),
(102, 2, '2025-06-02', 'Headphones', 'Electronics', 2, 1500.00, 'Completed'),
(103, 3, '2025-06-03', 'Office Chair', 'Furniture', 1, 7500.00, 'Completed'),
(104, 1, '2025-06-05', 'Mouse', 'Accessories', 2, 600.00, 'Completed'),
(105, 4, '2025-06-06', 'Desk', 'Furniture', 1, 9000.00, 'Pending'),
(106, 5, '2025-06-07', 'Keyboard', 'Accessories', 1, 1800.00, 'Completed'),
(107, 6, '2025-06-08', 'Smartphone', 'Electronics', 1, 25000.00, 'Completed'),
(108, 7, '2025-06-10', 'Headphones', 'Electronics', 1, 1500.00, 'Failed'),
(109, 8, '2025-06-12', 'Office Chair', 'Furniture', 2, 7500.00, 'Completed'),
(110, 9, '2025-06-14', 'Mouse', 'Accessories', 3, 600.00, 'Completed'),
(111, 10, '2025-06-15', 'Smartphone', 'Electronics', 1, 25000.00, 'Pending'),
(112, 2, '2025-06-17', 'Laptop', 'Electronics', 1, 55000.00, 'Completed'),
(113, 3, '2025-06-18', 'Keyboard', 'Accessories', 2, 1800.00, 'Completed'),
(114, 5, '2025-06-20', 'Desk', 'Furniture', 1, 9000.00, 'Completed'),
(115, 6, '2025-06-22', 'Mouse', 'Accessories', 1, 600.00, 'Completed'),
(116, 8, '2025-06-24', 'Smartphone', 'Electronics', 1, 25000.00, 'Completed'),
(117, 9, '2025-06-25', 'Headphones', 'Electronics', 2, 1500.00, 'Pending'),
(118, 4, '2025-06-26', 'Keyboard', 'Accessories', 1, 1800.00, 'Completed'),
(119, 7, '2025-06-28', 'Desk', 'Furniture', 1, 9000.00, 'Completed'),
(120, 10, '2025-06-30', 'Office Chair', 'Furniture', 1, 7500.00, 'Failed');


USE customer_transaction_analysis;

-- 1. View all transactions
SELECT *
FROM transactions;

-- 2. Calculate revenue for each transaction
SELECT
    transaction_id,
    product_name,
    quantity,
    unit_price,
    quantity * unit_price AS transaction_value,
    payment_status
FROM transactions;

-- 3. Total value of all transactions
SELECT
    SUM(quantity * unit_price) AS total_transaction_value
FROM transactions;

-- 4. Completed transaction value
SELECT
    SUM(quantity * unit_price) AS completed_sales_value
FROM transactions
WHERE payment_status = 'Completed';

-- 5. Count transactions by payment status
SELECT
    payment_status,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY payment_status;

-- 6. Sales value by product
SELECT
    product_name,
    SUM(quantity) AS units_sold,
    SUM(quantity * unit_price) AS total_value
FROM transactions
WHERE payment_status = 'Completed'
GROUP BY product_name
ORDER BY total_value DESC;

-- 7. Sales value by category
SELECT
    category,
    SUM(quantity * unit_price) AS total_value
FROM transactions
WHERE payment_status = 'Completed'
GROUP BY category
ORDER BY total_value DESC;

-- 8. Average transaction value
SELECT
    AVG(quantity * unit_price) AS average_transaction_value
FROM transactions
WHERE payment_status = 'Completed';

-- 9. Customers with the most completed purchase value
SELECT
    c.customer_name,
    c.city,
    SUM(t.quantity * t.unit_price) AS purchase_value
FROM customers c
JOIN transactions t
    ON c.customer_id = t.customer_id
WHERE t.payment_status = 'Completed'
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY purchase_value DESC;

-- 10. Monthly transaction value
SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS sales_month,
    SUM(quantity * unit_price) AS transaction_value
FROM transactions
WHERE payment_status = 'Completed'
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY sales_month;


USE customer_transaction_analysis;

SELECT
    payment_status,
    COUNT(*) AS transaction_count,
    SUM(quantity * unit_price) AS transaction_value
FROM transactions
GROUP BY payment_status;

SELECT
    COUNT(*) AS total_transactions,
    SUM(quantity * unit_price) AS total_transaction_value
FROM transactions;

SELECT
    SUM(
        CASE
            WHEN payment_status = 'Completed'
            THEN quantity * unit_price
            ELSE 0
        END
    ) AS completed_sales_value
FROM transactions;


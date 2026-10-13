
USE customer_transaction_analysis;

-- 1. Overall business summary
SELECT
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS customers_who_purchased,
    SUM(quantity) AS total_units,
    SUM(quantity * unit_price) AS total_transaction_value,
    SUM(
        CASE
            WHEN payment_status = 'Completed'
            THEN quantity * unit_price
            ELSE 0
        END
    ) AS completed_sales_value,
    SUM(
        CASE
            WHEN payment_status = 'Pending'
            THEN quantity * unit_price
            ELSE 0
        END
    ) AS pending_transaction_value,
    SUM(
        CASE
            WHEN payment_status = 'Failed'
            THEN quantity * unit_price
            ELSE 0
        END
    ) AS failed_transaction_value
FROM transactions;

-- 2. Completed sales by city
SELECT
    c.city,
    COUNT(t.transaction_id) AS completed_transactions,
    SUM(t.quantity * t.unit_price) AS completed_sales
FROM customers c
JOIN transactions t
    ON c.customer_id = t.customer_id
WHERE t.payment_status = 'Completed'
GROUP BY c.city
ORDER BY completed_sales DESC;

-- 3. Payment status distribution
SELECT
    payment_status,
    COUNT(*) AS transaction_count,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM transactions),
        2
    ) AS percentage
FROM transactions
GROUP BY payment_status
ORDER BY transaction_count DESC;

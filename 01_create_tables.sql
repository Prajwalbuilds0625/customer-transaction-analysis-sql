
CREATE DATABASE customer_transaction_analysis;

USE customer_transaction_analysis;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_date DATE,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

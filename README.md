# Customer Transaction Analysis using SQL

## Project Overview

This project uses MySQL to analyze customer transactions, sales performance, product categories, payment statuses, and data quality. It demonstrates practical SQL skills used in business analysis and reporting.

## Objectives

- Analyze transaction values and completed sales.
- Identify top-performing products and categories.
- Understand customer purchasing patterns across cities.
- Summarize completed, pending, and failed transactions.
- Perform data quality checks to identify missing or invalid data and potential duplicates.

## Tools and Technologies

- **Database:** MySQL
- **SQL Client:** MySQL Workbench
- **Skills:** SQL queries, filtering, aggregate functions, JOINs, GROUP BY, ORDER BY, subqueries, CASE expressions, and data validation.

## Database Structure

### 1. Customers

Stores customer information, including customer ID, name, city, and signup date.

### 2. Transactions

Stores transaction details, including transaction ID, customer ID, date, product, category, quantity, unit price, and payment status.

The tables are connected using a customer ID foreign key.

## Analysis Performed

- Calculated transaction values using quantity multiplied by unit price.
- Summarized total transaction value and completed sales.
- Analyzed sales by product and category.
- Identified customer purchase values using JOINs.
- Compared payment statuses and transaction counts.
- Summarized sales by month and city.

## Data Quality Checks

- Missing customer names and transaction details.
- Invalid quantities and prices.
- Unexpected payment statuses.
- Duplicate transaction IDs.
- Transactions referencing missing customers.
- Unusually high transaction quantities requiring review.

## Project Files

- `01_create_tables.sql` — Creates the database tables and relationships.
- `02_insert_data.sql` — Inserts sample customer and transaction data.
- `03_analysis_queries.sql` — Contains SQL business analysis queries.
- `04_data_quality_checks.sql` — Performs data quality checks.
- `05_business_summary.sql` — Generates summary reports.

## Key Learnings

This project provided hands-on practice in relational database design, SQL-based business analysis, data validation, and generating insights from transaction data.

## Dataset Note

The project uses sample data created for learning and demonstration purposes. The results do not represent actual business transactions.

## Author

Prajwal Khedkar
-- =============================================
-- FASE 5 — Business Analysis
-- Project:Financial Transaction Pipeline
-- Source: dbo.transactions_clean
-- =============================================

--1.Transaction volume by month
SELECT
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    COUNT(*) AS total_transactions
FROM dbo.transactions_clean
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date)
ORDER BY year, month;


-- 2. Total and average amount by month
SELECT
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    SUM(amount) AS total_amount,
    AVG(amount) AS avg_amount
FROM dbo.transactions_clean
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date)
ORDER BY year, month;


--3. Transaction types distribution
SELECT
    type,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM dbo.transactions_clean
GROUP BY type
ORDER BY total_transactions DESC;


-- 4. Top customers by transaction volume
SELECT
    customer_id,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM dbo.transactions_clean
GROUP BY customer_id
ORDER BY total_amount DESC;


-- 5.Potential outlier transactions
SELECT *
FROM dbo.transactions_clean
WHERE amount > 10000
   OR amount < 5
ORDER BY amount DESC;

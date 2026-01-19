-- =========================================
-- FASE 3 — Data Validation and cleaning
-- Dataset: Transactions / Transactions_raw
-- Objective: Validate data integrity
-- =========================================

-- 1. Row count
SELECT COUNT(*) AS total_rows
FROM dbo.transactions;

-- 2. Duplicate transaction_id check
SELECT
    transaction_id,
    COUNT(*) AS occurrences
FROM dbo.transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- 3. Date validation (nulls)
SELECT COUNT(*) AS null_dates
FROM dbo.transactions
WHERE date IS NULL;

-- 4. Amount validation (nulls)
SELECT COUNT(*) AS null_amounts
FROM dbo.transactions
WHERE amount IS NULL;

-- 5. Amount basic range check
SELECT
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount,
    AVG(amount) AS avg_amount
FROM dbo.transactions;



-- =========================================
-- FASE 3.1 — Schema Normalization
-- Objective: Create analysis-ready table
-- =========================================

-- 1. Create normalized table
SELECT
    transaction_id,
    CAST(date AS DATE) AS transaction_date,
    CAST(amount AS DECIMAL(10,2)) AS amount,
    type,
    customer_id
INTO dbo.transactions_clean
FROM dbo.transactions;

-- 2.Validate data types
SELECT TOP 10 *
FROM dbo.transactions_clean;

-- 3.Row count comparison
SELECT
    (SELECT COUNT(*) FROM dbo.transactions) AS original_rows,
    (SELECT COUNT(*) FROM dbo.transactions_clean) AS clean_rows;

-- 4.Validate converted dates
SELECT COUNT(*) AS invalid_dates
FROM dbo.transactions_clean
WHERE transaction_date IS NULL;

--5.Validate converted amounts
SELECT COUNT(*) AS invalid_amounts
FROM dbo.transactions_clean
WHERE amount IS NULL;

-- ===================================================================================
--“The dataset was normalized by correcting data types and creating an analysis-ready 
-- table while preserving the raw data.”
-- ===================================================================================


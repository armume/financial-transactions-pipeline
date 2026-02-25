
-- PHASE 3:Data Loading & Validation
SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'transactions';

SELECT amount
FROM dbo.transactions
WHERE TRY_CAST(amount AS DECIMAL(12,2)) IS NULL
AND amount IS NOT NULL;

SELECT date
FROM dbo.transactions
WHERE TRY_CAST(date AS DATE) IS NULL
AND date IS NOT NULL;

--# Data types were corrected using validation checks and ALTER TABLE statements
-- Change the column type amount--
ALTER TABLE dbo.transactions
ALTER COLUMN amount DECIMAL(12,2);

--Change the date column type-
ALTER TABLE dbo.transactions
ALTER COLUMN date DATE;

--3.1. View the date range: What period do these transactions cover?
SELECT 
    MIN(date) AS fecha_minima,
    MAX(date) AS fecha_maxima
FROM dbo.transactions;


--3.2.Search for invalid dates: Are there any transactions without a date?
SELECT COUNT(*) AS fechas_nulas
FROM dbo.transactions
WHERE date IS NULL;

--3.3. Are the dates written correctly?
SELECT *
FROM dbo.transactions
WHERE ISDATE(date) = 0;

--3.4.VALIDATION OF AMOUNTS
--GENERAL RANGE OF AMOUNTS: MINIMUM AND MAXIMUM TRANSACTION VALUES
SELECT 
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount,
    AVG(amount) AS avg_amount
FROM dbo.transactions;

-- Look for negative or zero amounts: Are there any invalid or suspicious transactions?
SELECT *
FROM dbo.transactions
WHERE amount <= 0;

-- Identify unusual amounts. Are there any transactions that deviate significantly from the normal pattern?
SELECT *
FROM dbo.transactions
WHERE amount > (
    SELECT AVG(amount) * 10
    FROM dbo.transactions);

--  PHASE 3 Data Loading & Validation
	-- 1.Verified total row count
	-- 2.Checked for duplicate transaction IDs (none found)
	-- 3.Validated date ranges and null values
	-- 4.Reviewed transaction amount ranges and detected potential anomalies

	--Conclusions--
	--Transaction amounts range from very small values (1.29) to high-value transactions (10,000), 
	--with an average transaction size of approximately 5,009. 
	--This suggests that the dataset is dominated by high-value transactions.


-- Q1: How does transaction volume vary over time?
SELECT
    YEAR(transaction_id) AS year,
    MONTH(transaction_id) AS month,
    COUNT(*) AS total_transactions
FROM dbo.transactions
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date)
ORDER BY
    year,
    month;


-- Q2: What is the total amount and average per month?
SELECT
    YEAR(transaction_id) AS year,
    MONTH(transaction_id) AS month,
    SUM(amount) AS total_amount,
    AVG(amount) AS avg_amount
FROM dbo.transactions
GROUP BY
    YEAR(transaction_id),
    MONTH(transaction_id)
ORDER BY
    year,
    month;


-- Q3: What is the distribution by transaction type?
SELECT
    type,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM dbo.transactions
GROUP BY type
ORDER BY total_transactions DESC;



--Q4: Which customers generate the most business?
SELECT
    customer_id,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM dbo.transactions
GROUP BY customer_id
ORDER BY total_amount DESC;



--Q5: Are there any unusual transactions?
SELECT *
FROM dbo.transactions
WHERE amount > (
    SELECT AVG(amount) * 3
    FROM dbo.transactions
)
ORDER BY amount DESC;



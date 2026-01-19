
-- ?? FASE 3:Carga y validación de datos.
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
-- Modificar el tipo de columna amount--
ALTER TABLE dbo.transactions
ALTER COLUMN amount DECIMAL(12,2);

--Modificar el tipo de columna date--
ALTER TABLE dbo.transactions
ALTER COLUMN date DATE;

--3.1.Ver el rango de fechas: ¿De qué periodo son estas transacciones?
SELECT 
    MIN(date) AS fecha_minima,
    MAX(date) AS fecha_maxima
FROM dbo.transactions;


--3.2?.Buscar fechas nulas: ¿Hay transacciones sin fecha?
SELECT COUNT(*) AS fechas_nulas
FROM dbo.transactions
WHERE date IS NULL;

--3.3.¿Las fechas están bien escritas?
SELECT *
FROM dbo.transactions
WHERE ISDATE(date) = 0;

--3.4.VALIDACION DE MONTOS
--RANGO GENERAL DE MONTOS: VALORES MINIMOS Y MAXIMOS DE LAS TRANSACCIONES
SELECT 
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount,
    AVG(amount) AS avg_amount
FROM dbo.transactions;

-- Buscar montos negativos o cero:??¿Existen transacciones inválidas o sospechosas?
SELECT *
FROM dbo.transactions
WHERE amount <= 0;

-- Identificar montos atípicos.??¿Hay transacciones que se salen completamente del patrón normal?
SELECT *
FROM dbo.transactions
WHERE amount > (
    SELECT AVG(amount) * 10
    FROM dbo.transactions);

-- ? CIERRE DE FASE 3 (cómo se documenta)-Data Loading & Validation
	-- 1.Verified total row count
	-- 2.Checked for duplicate transaction IDs (none found)
	-- 3.Validated date ranges and null values
	-- 4.Reviewed transaction amount ranges and detected potential anomalies

	--?? Qué concluye un analista en FASE 3
	--Transaction amounts range from very small values (1.29) to high-value transactions (10,000), 
	--with an average transaction size of approximately 5,009. 
	--This suggests that the dataset is dominated by high-value transactions.


-- ?FASE 4 — Definición de preguntas de negocio (se colocaron aparte)

-- ?FASE 5 — Preparación de datos en SQL
-- P1:¿Cómo varía el volumen de transacciones a lo largo del tiempo?
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


-- P2: ¿Cuál es el monto total y promedio por mes?
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


-- P3:¿Cuál es la distribución por tipo de transacción?
SELECT
    type,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM dbo.transactions
GROUP BY type
ORDER BY total_transactions DESC;



--P4:¿Qué clientes generan más movimiento?
SELECT
    customer_id,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM dbo.transactions
GROUP BY customer_id
ORDER BY total_amount DESC;



--P5:¿Existen transacciones atípicas?
SELECT *
FROM dbo.transactions
WHERE amount > (
    SELECT AVG(amount) * 3
    FROM dbo.transactions
)
ORDER BY amount DESC;

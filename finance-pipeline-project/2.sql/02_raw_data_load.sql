CREATE DATABASE FinancialPipelineDB;
USE FinancialPipelineDB;
DROP TABLE IF EXISTS transactions;
GO


-- Create raw table
-- Data loaded from CSV using Python
CREATE TABLE transactions (
	transaction_id VARCHAR(50),
    date VARCHAR(50),
    customer_id VARCHAR(50),
    amount VARCHAR(50),
    type VARCHAR(50),
    description VARCHAR(MAX) 
	);
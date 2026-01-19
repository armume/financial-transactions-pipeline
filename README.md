# Financial Transactions Pipeline (SQL → Python → Power BI)
End-to-end financial transaction analysis project covering data extraction, validation, preparation, and visualization,
with a focus on business questions.

## Objective
Build a complete financial data pipeline that demonstrates:
- Use of SQL Server for data validation and preparation
- Integration of Python for data loading
- Business-oriented analysis
- Clear visualization using Power BI

## Tools
- Microsoft SQL Server (SSMS)
- Python
- Power BI

## Dataset
The dataset contains simulated financial transactions with the following structure:
- `transaction_id`: unique transaction identifier
- `date`: transaction date
- `customer_id`: customer identifier
- `amount`: transaction amount
- `type`: transaction type (income/expense)  
- `description`: description of the operation
The data was initially loaded from a CSV file and then validated and prepared in SQL Server.

## Project structure
financial-transactions-pipeline/
- data → Original Dataset (CSV)
- sql→ Scripts SQL by phase
- python→ Load date scripts
- dashboard→ Final Dashboard Power BI (PDF)
- README.m

## Pipeline phases
1. **Database setup**: Database creation and initial configuration.
     
2. **Table creation**: Definition of table structure for transactions.

4. **Data validation**
   - Counting records.
   - Validating amounts and dates.
   - Checking for duplicates.

5. **Business questions**: Defining key business-oriented questions.

6. **Data preparation**
   - Schema normalization.
   - Data type conversion.
   - Creation of clean views for analysis.

7. **Dashboard**: Visualization of key metrics in Power BI with interactive filters.


## Analysis results
Based on the financial transaction dataset, the following business questions were analyzed:

- 1️. How many transactions are there per month?<br>
The transaction volume remains relatively stable over time, with monthly variations that allow us to identify peaks in activity.

- 2.What is the total and average amount per month?<br>
The analysis shows clear differences between months with higher cash flow and months with lower activity, which helps to understand the financial dynamics of the business.
   
- 3.What types of transactions exist and which is the most common?<br>
Different types of transactions were identified, and in this analysis, the types used by customers were balanced.

- 4.Which customers generate the most movement?<br>
Some customers account for a higher number of transactions and amounts,making them key customers for the business.
   
- 5.Are there any atypical transactions?<br>
Transactions with significantly high or low amounts were detected, which could represent errors, risks, or exceptional events.


## Dashboard
The results of the analysis were visualized in an interactive dashboard built in **Power BI**.

The dashboard allows you to:
- Analyze transaction volume over time
- Compare total and average amounts per month
- Explore transaction types
- Identify customers with the highest activity
- Filter information by date, transaction type, and customer

Because Power BI is an interactive tool, the repository includes a static version of the dashboard in **png** format.

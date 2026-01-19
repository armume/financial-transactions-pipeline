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
- Python 3.10
- Pandas
- SQLAlchemy
- Power BI
- GitHub

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
- data/ # Original Dataset (CSV)
- sql/ # Scripts SQL by phase
- python/ # Load date scripts
- dashboard/ #Final Dashboard Power BI (PDF)
- README.m

## Pipeline phases
1. **Database setup**
   - Database creation and initial configuration.
     
2. **Table creation**
   - Definition of table structure for transactions.
3. **Data validation**
   - Counting records.
   - Validating amounts and dates.
   - Checking for duplicates.

4. **Business questions**
   - Defining key business-oriented questions.

5. **Data preparation**
   - Schema normalization.
   - Data type conversion.
   - Creation of clean views for analysis.

6. **Dashboard**
   - Visualization of key metrics in Power BI with interactive filters.

# Open Payments Data Model

## Project Overview
This project builds a physical star schema data model using CMS Open Payments dataset.

## Tools Used
- SQLite
- DBeaver
- SQL

## Data Model
- Fact Table: Fact_Transactions
- Dimension Tables:
  - Dim_Recipient
  - Dim_Manufacturer
  - Dim_Teaching_Hospital
  - Dim_Payment
  - Dim_Travel
  - Dim_Third_Party
  - Dim_Date
  - Dim_Product

## Steps
1. Create schema
2. Load dimension tables
3. Load fact table using joins
4. Validate data in DBeaver

## How to Run
Run scripts in this order:
1. create_tables.sql
2. load_dim_*.sql
3. load_fact_transactions.sql

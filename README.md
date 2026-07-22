# Global Electronics - End-to-End SQL Data Warehouse & Analytics

**A complete end-to-end SQL project** showcasing Data Warehouse development (Bronze-Silver-Gold) and Business Analytics for a global electronics retailer.

## 📋 Project Overview

This project demonstrates my ability to:
- Build a full **Medallion Architecture** data warehouse
- Transform raw CSV data into a clean, analytics-ready environment
- Perform in-depth business analysis using advanced SQL

## 🛠 Tech Stack

- SQL Server (TSQL)
- Medallion Architecture (Bronze → Silver → Gold)
- Star Schema Dimensional Modeling
- Advanced SQL (CTEs, Window Functions, Aggregations)

## 📁 Folder Structure

- **01_dataset/** — Raw CSV files (Customers, Products, Sales, Stores, Exchange_Rates, Data_Dictionary)
- **02_data_warehouse/** — Data Warehouse Layers
  - **01_bronze/** — Raw data loading
  - **02_silver/** — Data cleaning and transformation
  - **03_gold/** — Star Schema (Fact & Dimension views)
- **03_data_analytical/** — Analytical SQL Scripts (10+ files) + Insights PDF

## 🏗 Architecture

**Bronze Layer**  
Raw data ingestion from CSV files using `BULK INSERT`.

**Silver Layer**  
Data cleaning, standardization, type conversion, and quality improvements.

**Gold Layer**  
Dimensional model (Star Schema) with:
- `fact_sales` (with calculated measures: Sales, Cost, Profit)
- Dimension views (`dim_customers`, `dim_products`, `dim_stores`, `dim_calendar`, etc.)

## 📊 Analytics

The `03_data_analytical` folder includes scripts for:
- Database exploration
- Customer, product, and store analysis
- Sales trends and performance
- Ranking analysis
- Change over time & cumulative analysis
- Segmentation and part-to-whole analysis

## 🚀 How to Run the Project

1. Create a new database in SQL Server
2. Execute the scripts in this order:
   - `02_data_warehouse/01_bronze/`
   - `02_data_warehouse/02_silver/`
   - `02_data_warehouse/03_gold/`
   - Scripts in `03_data_analytical/`
3. Update CSV file paths in the Bronze layer insert script

## 🔮 Planned Improvements

- Power BI dashboards
- Indexed tables instead of views
- Stored procedures and ETL orchestration
- Data quality validation

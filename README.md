# Global Electronics - End-to-End SQL Project

**End-to-End SQL Data Warehouse + Sales Analytics** for a global electronics retailer.
This project demonstrates a complete data solution — from raw data ingestion to business insights — using SQL Server.
## 🎯 Project Overview
Global Electronics is a multinational retailer of consumer electronics. This project transforms messy raw data into a clean, structured data warehouse and delivers actionable insights through advanced SQL analytics.
The project is divided into two main parts:
- **Data Warehouse Development** (Bronze → Silver → Gold)
- **Data Analytics & Insights**

## 🛠 Tech Stack
- **Database**: SQL Server (TSQL)
- **Architecture**: Medallion (Bronze-Silver-Gold)
- **Modeling**: Star Schema
- **Tools**: SSMS, BULK INSERT, Views

## 📁 Repository Structure
├── 01_dataset/ # Raw CSV files 
├── 02_data_warehouse/ # Data Warehouse Pipeline 
│ ├── 01_bronze/ # Raw data loading 
│ ├── 02_silver/ # Data cleaning & transformation 
│ └── 03_gold/ # Dimensional model (Star Schema) 
├── 03_data_analytical/ # Business Intelligence Queries 
└── README.md


## 🏗 Data Warehouse Architecture

### 1. Bronze Layer
- Raw data landing
- Direct loading from CSV files using `BULK INSERT`

### 2. Silver Layer
- Data cleaning (trimming, type conversion, standardization)
- Handling missing values and data quality issues
- Creation of calendar dimension

### 3. Gold Layer
- Star Schema design
- Fact table (`fact_sales`) with calculated measures (Sales, Cost, Profit)
- Dimension tables (`dim_customers`, `dim_products`, `dim_stores`, etc.)
- Reusable views for analytics

## 📊 Data Analytics

The `03_data_analytical` folder contains 10+ SQL scripts covering:

- Database exploration
- Data exploration (customers, products, stores)
- Sales performance & trends
- Ranking analysis (top products, countries, stores)
- Change over time & YoY comparison
- Customer segmentation
- Product category performance
- Part-to-whole analysis

## 🚀 How to Run

1. Create a new database in SQL Server
2. Execute scripts in this order:
   - `02_data_warehouse/01_bronze/`
   - `02_data_warehouse/02_silver/`
   - `02_data_warehouse/03_gold/`
   - `03_data_analytical/` (in any order)
3. Update CSV file paths in the Bronze insert script as needed

## 📈 Key Deliverables

- Clean, analytics-ready data warehouse
- Star schema optimized for reporting
- Rich set of business-ready SQL queries
- Foundation for Power BI/reporting tools

## 🔮 Future Enhancements

- Power BI interactive dashboards
- Stored procedures for ETL orchestration
- Data quality validation framework
- Incremental data loading



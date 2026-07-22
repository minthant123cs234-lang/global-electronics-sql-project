--Measures Exploration (Key Metrics)

-- Find the Total Sales
SELECT
	SUM(sales_amount_usd) AS Total_sales
FROM gold.fact_sales

-- Find how many items are sold
SELECT
	SUM(quantity) AS Total_quantity
FROM gold.fact_sales

-- Find the average selling price
SELECT
	AVG(unit_price) AS Avg_price
FROM gold.fact_sales

-- Find the Total number of Orders
SELECT 
	COUNT(DISTINCT order_number) AS Total_orders
FROM gold.fact_sales

-- Find the Total Profit
SELECT
	SUM(gross_profit_usd) AS Total_profit
FROM gold.fact_sales

-- Find the total number of products
SELECT 
	COUNT(distinct product_key) AS Total_products 
FROM gold.dim_products

-- Find the total number of customers
SELECT 
	COUNT(customer_key) AS Total_customers
FROM gold.dim_customers

-- Find the total number of customers that has placed an order
SELECT
	COUNT(DISTINCT customer_key) AS Active_customers 
FROM gold.fact_sales

--Find Average Order Value
SELECT 
   Round(SUM(sales_amount_usd) * 1.0 / COUNT(DISTINCT order_number),2) AS AOV
FROM gold.fact_sales

--Find Profit Margin
SELECT
    Round(SUM(gross_profit_usd) * 1.0 / NULLIF(SUM(sales_amount_usd),0),4)*100 AS Profit_margin
FROM gold.fact_sales

--Find Averae quantity Per Order
SELECT
    Round(SUM(quantity) * 1.0 / COUNT(DISTINCT order_number),1) AS Avg_items_per_order
FROM gold.fact_sales
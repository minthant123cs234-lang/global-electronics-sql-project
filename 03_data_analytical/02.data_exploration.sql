-- Data Exploration
-- Dimensions Exploration

-- Retrieve a list of unique countries from which customers originate
SELECT DISTINCT 
    country 
FROM gold.dim_customers
ORDER BY country;

--Find how many products we are selling 
SELECT
    COUNT (DISTINCT category_key) as Total_category,
    COUNT (DISTINCT subcategory_key) as Total_subcategory,
    COUNT (DISTINCT product_key) as Total_products
FROM gold.dim_products

-- Retrieve a list of unique categories, subcategories, and products
SELECT DISTINCT 
    category, 
    subcategory, 
    product_name 
FROM gold.dim_products
ORDER BY category, subcategory, product_name;

-- Date Range Exploration 

-- Determine the first and last order date and the total duration in months
SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales;
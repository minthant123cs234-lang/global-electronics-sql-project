CREATE OR ALTER VIEW gold.dim_customers AS
	SELECT 
		customer_key, 
		gender,
		customer_name,
		city,
		state_code,
		state,
		zip_code,
		country,
		continent,
		birthday
FROM silver.customers;
GO

CREATE OR ALTER VIEW gold.dim_products AS
	SELECT
		product_key,
		product_name,
		brand,
		color,
		unit_cost,
		unit_price,
		subcategory_key,
		subcategory,
		category_key,
		category
FROM silver.products;
GO

CREATE OR ALTER VIEW gold.dim_stores AS
	SELECT 
		store_key,
		country,
		state,
		square_meters,
		open_date
FROM silver.stores;
GO

CREATE OR ALTER VIEW gold.dim_exchange_rates AS
	SELECT
		exchange_date,
		currency_code,
		exchange
	FROM silver.exchange_rates
GO

CREATE OR ALTER VIEW gold.fact_sales AS
	SELECT
		s.order_number,
		s.line_item,
		s.order_date,
		s.delivery_date,
		s.customer_key,
		s.store_key,
		s.product_key,
		s.currency_code,
		p.unit_cost,
		p.unit_price,
		s.quantity,
		s.quantity * p.unit_price AS sales_amount_usd,
		s.quantity * p.unit_cost AS total_cost_usd,
		(s.quantity * p.unit_price) - (s.quantity * p.unit_cost) AS gross_profit_usd
FROM silver.sales s
LEFT JOIN silver.products p ON s.product_key = p.product_key
GO
		
CREATE OR ALTER VIEW gold.dim_calendar AS
	SELECT * 
	FROM silver.calendar;
GO

	
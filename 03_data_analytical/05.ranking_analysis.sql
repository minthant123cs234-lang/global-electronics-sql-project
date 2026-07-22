-- Which 5 products Generating the Highest Revenue?
SELECT Top 5
	p.product_key,
	p.product_name,
	SUM (s.sales_amount_usd) as Total_revenue
	FROM gold.dim_products as p
inner join gold.fact_sales as s
ON p.product_key = s.product_key
GROUP BY p.product_key, p.product_name
ORDER BY Total_revenue desc

-- Complex but Flexibly Ranking Using Window Functions
SELECT *
FROM (
SELECT
	p.product_key,
	p.product_name,
	SUM (s.sales_amount_usd) as Total_revenue,
	DENSE_RANK () OVER (ORDER BY SUM (s.sales_amount_usd) desc) as Ranking_revenue
	FROM gold.dim_products as p
INNER JOIN gold.fact_sales as s
ON p.product_key = s.product_key
GROUP BY p.product_key, p.product_name
)t
WHERE Ranking_revenue <= 5

-- What are the 5 worst-performing products in terms of sales?
SELECT Top 5
	p.product_key,
	p.product_name,
	COALESCE(SUM(s.sales_amount_usd), 0) AS Total_revenue
	FROM gold.dim_products as p
LEFT JOIN gold.fact_sales as s
ON p.product_key = s.product_key
GROUP BY p.product_key, p.product_name
ORDER BY Total_revenue

-- Find the top 10 customers who have generated the highest revenue
SELECT TOP 10
	c.customer_key,
	c.customer_name,
	SUM(s.sales_amount_usd) as Total_revenue
FROM gold.dim_customers as c
INNER JOIN gold.fact_sales as s
ON c.customer_key = s.customer_key
GROUP BY  c.customer_key, c.customer_name
ORDER BY Total_revenue desc

-- The 3 customers with the fewest orders placed
SELECT *
FROM(
SELECT
	c.customer_key,
	c.customer_name,
	COUNT (distinct s.order_number) as Total_orders,
	DENSE_RANK () over (order by COUNT (distinct s.order_number)) as Order_Rank
FROM gold.dim_customers as c
LEFT JOIN gold.fact_sales as s
ON c.customer_key = s.customer_key
GROUP BY c.customer_key, c.customer_name
)t
WHERE Order_Rank <= 3

/*Group customers into three segments based on their spending behavior:
	- VIP: Customers with at least 12 months of history and spending more than $ 5,000.
	- Regular: Customers with at least 12 months of history but spending $ 5,000 or less.
	- New: Customers with a lifespan less than 12 months.
And find the total number of customers by each group
*/


WITH cust_spen AS (
SELECT
	c.customer_key,
	c.customer_name,
	SUM(s.sales_amount_usd) AS Total_spending,
	MIN(order_date) AS first_order,
	MAX(order_date) AS last_order,
	DATEDIFF (MONTH, MIN(order_date),MAX(order_date)) AS lifespan
FROM gold.dim_customers AS c
INNER JOIN gold.fact_sales AS s
ON c.customer_key = s.customer_key
GROUP BY c.customer_key,
	c.customer_name
)
,cust_seg AS (
SELECT
	customer_key,
	customer_name,
CASE
	WHEN lifespan >= 12 and Total_spending > 5000 THEN 'VIP'
	WHEN lifespan >= 12 and Total_spending <= 5000 THEN 'Regular'
	ELSE 'New'
	END customer_segment
FROM cust_spen
)
SELECT
 customer_segment,
 COUNT(*) AS Total_customers
FROM cust_seg
GROUP BY customer_segment
ORDER BY Total_customers DESC
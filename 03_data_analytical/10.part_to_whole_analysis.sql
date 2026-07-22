-- Which categories contribute the most to overall sales?

WITH category_sales AS (
SELECT
	p.category_key,
	p.category,
	SUM(sales_amount_usd) AS total_sales
FROM gold.dim_products AS p
INNER JOIN gold.fact_sales AS S
ON p.product_key = s.product_key
GROUP BY p.category_key,
		p.category
)
SELECT 
	category,
	total_sales,
	SUM (total_sales) OVER () AS overall_sales,
	ROUND((total_sales * 1.0 / SUM(total_sales) OVER ()) * 100, 2) as percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;

-- Which country or channel contribute the most to overall sales?

WITH country_sales  AS (
SELECT
	st.country,
	SUM (s.sales_amount_usd) AS Total_sales
FROM gold.dim_stores AS st
INNER JOIN gold.fact_sales AS s
ON st.store_key = s.store_key
GROUP BY st.country
)
SELECT
	country,
	Total_sales,
	SUM (Total_sales) OVER () AS Overall_sales,
	ROUND (Total_sales * 1.0 / SUM (Total_sales) OVER (),2) * 100 AS percentage_of_total
FROM country_sales 
ORDER BY percentage_of_total DESC

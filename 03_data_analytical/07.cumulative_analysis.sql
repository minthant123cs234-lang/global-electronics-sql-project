-- Calculate the total sales per month 
-- and the running total of sales over time_yearly
SELECT
	year,
	month_number,
	month_name,
	Total_sales,
	sum(Total_sales) over (partition by year order by month_number) as YTD_sales
FROM(
SELECT
	cd.year,
	cd.month_number,
	cd.month_name,
	sum(s.sales_amount_usd) as Total_sales
FROM gold.dim_calendar as cd
INNER JOIN gold.fact_sales as s
ON cd.calendar_date = s.order_date
GROUP BY cd.year,
	cd.month_number,
	cd.month_name
	)t
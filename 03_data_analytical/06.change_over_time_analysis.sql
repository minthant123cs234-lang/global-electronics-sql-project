-- Analyse sales performance over time_monthly
--using with dim.calendar
SELECT
	cd.year,
	cd.month_number,
	cd.month_name,
	count(distinct order_number) as Total_orders,
	sum(s.quantity) as Total_unit_sold,
	ROUND(sum(s.sales_amount_usd) / count(distinct order_number), 2) as AOV,
	sum(s.sales_amount_usd) as Total_revenue,
	sum(s.gross_profit_usd) as Total_profit,
	Round(sum(s.gross_profit_usd) *1.0 / NULLIF(sum(s.sales_amount_usd),0),4)*100 as Profit_margin
FROM gold.dim_calendar as cd
INNER JOIN gold.fact_sales as s
ON cd.calendar_date = s.order_date
GROUP BY cd.year,
	cd.month_number,
	cd.month_name
ORDER BY cd.year,
	cd.month_number

--without dim.calendar
SELECT
	Year(order_date) as order_year,
	Month(order_date) as order_month,
	datename (month,order_date) as month_name,
	count(distinct order_number) as Total_orders,
	sum(quantity) as Total_unit_sold,
	Round(sum(sales_amount_usd) / count(distinct order_number),2) as AOV,
	sum(sales_amount_usd) as Total_revenue,
	sum(gross_profit_usd) as Total_profit,
	Round(sum(gross_profit_usd)*1.0 / NULLIF(sum(sales_amount_usd),0),4) * 100 as Profit_margin
FROM gold.fact_sales
GROUP BY Year(order_date), Month(order_date),datename (month,order_date)
ORDER BY order_year, order_month

-- Analyse sales performance over time_Yearly
SELECT
	cd.year,
	count(distinct order_number) as Total_orders,
	sum(s.quantity) as Total_unit_sold,
	ROUND(sum(s.sales_amount_usd) / count(distinct order_number), 2) as AOV,
	sum(s.sales_amount_usd) as Total_revenue,
	sum(s.gross_profit_usd) as Total_profit,
	Round(sum(s.gross_profit_usd) *1.0 / NULLIF(sum(s.sales_amount_usd),0),4)*100 as Profit_margin
FROM gold.dim_calendar as cd
INNER JOIN gold.fact_sales as s
ON cd.calendar_date = s.order_date
GROUP BY cd.year
ORDER BY cd.year

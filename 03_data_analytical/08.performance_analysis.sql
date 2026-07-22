---Performance Analysis (Year-over-Year, Month-over-Month)

--Analyze the yearly performance of orders, revenue and profit with Growth % vs last year
With yoy_analysis as (
select
	cd.year,
	count(distinct order_number) as total_orders,
	Lag(count(distinct order_number)) over (order by cd.year) as lastyear_orders,
	sum(s.sales_amount_usd) as total_revenue,
	Lag(sum(s.sales_amount_usd)) over (order by cd.year) as lastyear_revenue,
	sum(s.gross_profit_usd) as total_profit,
	Lag(sum(s.gross_profit_usd)) over (order by cd.year) as lastyear_profit
from gold.dim_calendar as cd
inner join gold.fact_sales as s
on cd.calendar_date = s.order_date
group by cd.year
)
select
	year,
	total_orders,
	Round((total_orders - lastyear_orders) * 100.0 / Nullif(lastyear_orders,0),2)as yoy_order_pct,
	total_revenue,
	Round((total_revenue - lastyear_revenue) * 100.0 / Nullif(lastyear_revenue,0),2) as yoy_revenue_pct,
	total_profit,
	Round((total_profit - lastyear_profit) * 100.0 / Nullif(lastyear_profit,0),2) as yoy_profit_pct,
	CASE 
    WHEN year = 2021 THEN 'YTD Feb'
    ELSE 'Full Year'
END AS year_status
from yoy_analysis
order by year desc;

--Analyze the yearly performance of orders, revenue and profit with Growth % vs last month
With mom_analysis as (
select
	cd.year,
	cd.month_number,
	cd.month_name,
	count(distinct order_number) as total_orders,
	Lag(count(distinct order_number)) over (order by cd.year,cd.month_number) as pv_month_orders,
	sum(s.sales_amount_usd) as total_revenue,
	Lag(sum(s.sales_amount_usd)) over (order by cd.year,cd.month_number) as pv_month_revenue,
	sum(s.gross_profit_usd) as total_profit,
	Lag(sum(s.gross_profit_usd)) over (order by cd.year,cd.month_number) as pv_month_profit
from gold.dim_calendar as cd
inner join gold.fact_sales as s
on cd.calendar_date = s.order_date
group by cd.year,
	cd.month_number,
	cd.month_name
)
select
	year,
	month_name,
	total_orders,
	Round((total_orders - pv_month_orders) * 100.0 / Nullif(pv_month_orders,0),2)as mom_order_pct,
	total_revenue,
	Round((total_revenue -pv_month_revenue) * 100.0 / Nullif(pv_month_revenue,0),2) as mom_revenue_pct,
	total_profit,
	Round((total_profit - pv_month_profit) * 100.0 / Nullif(pv_month_profit,0),2) as mom_profit_pct
from mom_analysis
order by year desc,
		month_number desc;
IF OBJECT_ID ('bronze.customers','U') IS NOT NULL
	DROP TABLE bronze.customers;
GO
create table bronze.customers (
	customer_key	INT,
	gender			NVARCHAR (50),
	customer_name	NVARCHAR (100),
	city			NVARCHAR (100),
	state_code		VARCHAR	(50),
	state			NVARCHAR (50),
	zip_code		VARCHAR (20),
	country			NVARCHAR (50),
	continent		NVARCHAR (50),
	birthday		DATE
);
GO

IF OBJECT_ID ('bronze.products','U') IS NOT NULL
	DROP TABLE bronze.products;
GO
create table bronze.products (
	product_key		INT,
	product_name	NVARCHAR (100),
	brand			NVARCHAR (50),
	color			NVARCHAR (20),
	unit_cost		NVARCHAR (50),
	unit_price		NVARCHAR (50),
	subcategory_key	NVARCHAR (50),
	subcategory		NVARCHAR (100),
	category_key	NVARCHAR (50),
	category		NVARCHAR (50)
);
GO

IF OBJECT_ID ('bronze.stores','U') IS NOT NULL
	DROP TABLE bronze.stores;
GO
create table bronze.stores (
	store_key		INT,
	country			NVARCHAR (50),
	state			NVARCHAR (50),
	square_meters	DECIMAL (10,2),
	open_date		DATE
);
Go

IF OBJECT_ID ('bronze.exchange_rates','U') IS NOT NULL
	DROP TABLE bronze.exchange_rates;
GO
create Table bronze.exchange_rates(
	exchange_date	DATE,
	currency_code	Varchar (20),
	exchange		DECIMAL (10,4)
	);
Go

IF OBJECT_ID ('bronze.sales','U') IS NOT NULL
	DROP TABLE bronze.sales;
GO
create Table bronze.sales(
	order_number	INT,
	line_item		INT,
	order_date		DATE,
	deliver_date	DATE,
	customer_key	INT,
	store_key		INT,
	product_key		INT,
	quantity		INT,
	currency_code	VARCHAR (20)
);
GO
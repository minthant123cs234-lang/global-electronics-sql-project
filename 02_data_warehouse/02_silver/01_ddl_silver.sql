IF OBJECT_ID ('silver.customers','U') IS NOT NULL
	DROP TABLE silver.customers;
GO
create table silver.customers (
	customer_key	INT	PRIMARY KEY,
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

INSERT INTO silver.customers (customer_key, gender, customer_name, city, state_code, state, zip_code, country, continent, birthday)
SELECT
    customer_key,
    TRIM(gender) AS gender,
    TRIM(REPLACE(customer_name, '?', '')) AS customer_name,
    TRIM(city) AS city,
    TRIM(UPPER(state_code)) AS state_code,
    TRIM(state) AS state,
    TRIM(zip_code) AS zip_code,
    TRIM(country) AS country,
    TRIM(continent) AS continent,
    birthday
FROM bronze.customers;
GO

IF OBJECT_ID('silver.products','U') IS NOT NULL
    DROP TABLE silver.products;
GO

CREATE TABLE silver.products (
    product_key      INT PRIMARY KEY,
    product_name     NVARCHAR(200),
    brand            NVARCHAR(100),
    color            NVARCHAR(50),
    unit_cost        DECIMAL(10,2),
    unit_price       DECIMAL(10,2),
    subcategory_key  VARCHAR(50),
    subcategory      NVARCHAR(100),
    category_key     VARCHAR(50),
    category         NVARCHAR(100)
);
GO

INSERT INTO silver.products (product_key, product_name, brand, color, unit_cost, unit_price, subcategory_key, subcategory, category_key, category)
SELECT
    product_key,
    TRIM(product_name) AS product_name,
    TRIM(brand) AS brand,
    TRIM(color) AS color,
    CAST(REPLACE(REPLACE(TRIM(unit_cost), '$', ''), ',', '') AS DECIMAL(10,2)) AS unit_cost,
    CAST(REPLACE(REPLACE(TRIM(unit_price), '$', ''), ',', '') AS DECIMAL(10,2)) AS unit_price,
    TRIM(subcategory_key) AS subcategory_key,
    TRIM(subcategory) AS subcategory,
    TRIM(category_key) AS category_key,
    TRIM(category) AS category
FROM bronze.products;
GO

IF OBJECT_ID('silver.exchange_rates','U') IS NOT NULL
    DROP TABLE silver.exchange_rates;
GO
CREATE TABLE silver.exchange_rates (
    exchange_date   DATE,
    currency_code   VARCHAR(10),
    exchange        DECIMAL(10,4)
);
GO

INSERT INTO silver.exchange_rates
SELECT
    exchange_date,
    TRIM(UPPER(currency_code)) AS currency_code,
    exchange
FROM bronze.exchange_rates;
GO

IF OBJECT_ID('silver.stores','U') IS NOT NULL
    DROP TABLE silver.stores;
GO
CREATE TABLE silver.stores (
    store_key       INT PRIMARY KEY,
    country         NVARCHAR(50),
    state           NVARCHAR(50),
    square_meters   DECIMAL(10,2) NULL,
    open_date       DATE
);
GO

INSERT INTO silver.stores (store_key, country, state, square_meters, open_date)
SELECT
    store_key,
    TRIM(country) AS country,
    TRIM(state) AS state,
    square_meters,
    open_date
FROM bronze.stores;
GO

IF OBJECT_ID('silver.sales','U') IS NOT NULL
    DROP TABLE silver.sales;
GO
CREATE TABLE silver.sales (
    order_number    INT,
    line_item       INT,
    order_date      DATE,
    delivery_date   DATE NULL,
    customer_key    INT,
    store_key       INT,
    product_key     INT,
    quantity        INT,
    currency_code   VARCHAR(10)
);
GO

INSERT INTO silver.sales (order_number, line_item, order_date, delivery_date, customer_key, store_key, product_key, quantity, currency_code)
SELECT
    order_number,
    line_item,
    CAST(order_date AS DATE) AS order_date,
    CAST(NULLIF(deliver_date, '') AS DATE) AS delivery_date,   -- fixed: reads from bronze's "deliver_date"
    customer_key,
    store_key,
    product_key,
    quantity,
    TRIM(UPPER(currency_code)) AS currency_code
FROM bronze.sales;
GO
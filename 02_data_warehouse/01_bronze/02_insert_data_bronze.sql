-- CUSTOMERS
TRUNCATE TABLE bronze.customers;
GO
BULK INSERT bronze.customers
FROM 'C:\Data Analytics Practice Projects\Global Electronics Retailer\dataset\Customers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '1252',
    TABLOCK
);
GO

-- PRODUCTS
TRUNCATE TABLE bronze.products;
GO
BULK INSERT bronze.products
FROM 'C:\Data Analytics Practice Projects\Global Electronics Retailer\dataset\Products.csv'
WITH (
    FIRSTROW = 2,
    FORMAT = 'CSV',              -- tells SQL Server to use proper CSV parsing rules
    FIELDQUOTE = '"',            -- tells it double-quotes wrap fields with embedded commas
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '1252',
    TABLOCK
);

-- STORES
TRUNCATE TABLE bronze.stores;
GO
BULK INSERT bronze.stores
FROM 'C:\Data Analytics Practice Projects\Global Electronics Retailer\dataset\Stores.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '1252',
    TABLOCK
);
GO

-- SALES
TRUNCATE TABLE bronze.sales;
GO
BULK INSERT bronze.sales
FROM 'C:\Data Analytics Practice Projects\Global Electronics Retailer\dataset\Sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '1252',
    TABLOCK
);
GO

-- EXCHANGE RATES
TRUNCATE TABLE bronze.exchange_rates;
GO
BULK INSERT bronze.exchange_rates
FROM 'C:\Data Analytics Practice Projects\Global Electronics Retailer\dataset\Exchange_Rates.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '1252',
    TABLOCK
);
GO


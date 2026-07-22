IF OBJECT_ID('silver.calendar','U') IS NOT NULL
    DROP TABLE silver.calendar;
GO
CREATE TABLE silver.calendar (
    calendar_date     DATE PRIMARY KEY,
    year              INT,
    month_number      INT,
    month_name        NVARCHAR(20),
    day               INT,
    weekday_name      NVARCHAR(20),
    quarter           INT,
    week_number       INT,
    start_of_month    DATE,
    start_of_quarter  DATE,
    start_of_year     DATE
);
GO

;WITH date_range AS (
    SELECT CAST('2015-01-01' AS DATE) AS calendar_date
    UNION ALL
    SELECT DATEADD(day, 1, calendar_date)
    FROM date_range
    WHERE calendar_date < '2026-12-31'
)
INSERT INTO silver.calendar
SELECT
    calendar_date,
    YEAR(calendar_date),
    MONTH(calendar_date),
    DATENAME(month, calendar_date),
    DAY(calendar_date),
    DATENAME(weekday, calendar_date),
    DATEPART(quarter, calendar_date),
    DATEPART(week, calendar_date),
    DATEFROMPARTS(YEAR(calendar_date), MONTH(calendar_date), 1) AS start_of_month,
    DATEFROMPARTS(YEAR(calendar_date), ((DATEPART(quarter, calendar_date)-1)*3)+1, 1) AS start_of_quarter,
    DATEFROMPARTS(YEAR(calendar_date), 1, 1) AS start_of_year
FROM date_range
OPTION (MAXRECURSION 0);
GO
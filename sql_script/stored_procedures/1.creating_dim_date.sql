------------------------------------------
--Creating a stored procedure for dim_date
------------------------------------------

CREATE PROCEDURE [sp_create_dim_date]


AS
BEGIN
 CREATE TABLE [computer_staging].[dbo].[dim_date] (
        date_id        INT PRIMARY KEY,      -- YYYYMMDD
        full_date      DATE,
        year           INT,
        quarter        INT,
        month          INT,
        month_name     VARCHAR(20),
        day            INT,
        day_name       VARCHAR(20),
        day_of_week    INT,
        is_weekend     BIT
    );

END;


/* =========================================
   LOAD DATA FROM 2021 TO 2024
   ========================================= */

WITH date_cte AS (

    -- Start Date
    SELECT CAST('2021-01-01' AS DATE) AS d

    UNION ALL

    -- Add 1 day recursively
    SELECT DATEADD(DAY, 1, d)
    FROM date_cte
    WHERE d < '2024-12-31'
)

INSERT INTO [computer_staging].[dbo].[dim_date] (
    date_id,
    full_date,
    year,
    quarter,
    month,
    month_name,
    day,
    day_name,
    day_of_week,
    is_weekend
)

SELECT
    CAST(CONVERT(VARCHAR(8), d, 112) AS INT) AS date_id,
    d AS full_date,
    YEAR(d) AS year,
    DATEPART(QUARTER, d) AS quarter,
    MONTH(d) AS month,
    DATENAME(MONTH, d) AS month_name,
    DAY(d) AS day,
    DATENAME(WEEKDAY, d) AS day_name,
    DATEPART(WEEKDAY, d) AS day_of_week,

    CASE
        WHEN DATEPART(WEEKDAY, d) IN (1, 7)
        THEN 1
        ELSE 0
    END AS is_weekend

FROM date_cte

OPTION (MAXRECURSION 1461);

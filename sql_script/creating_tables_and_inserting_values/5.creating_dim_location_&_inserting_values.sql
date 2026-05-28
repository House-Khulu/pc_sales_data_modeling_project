--------------------------------
--creating a dim_location table
--------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'dim_location'
)
BEGIN
    CREATE TABLE [computer_staging].[dbo].[dim_location](
        [location_id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [continent] NVARCHAR(250) NOT NULL,
        [country_or_state] NVARCHAR(250) NOT NULL,
        [province_or_city] NVARCHAR(250) NOT NULL
    );
END;

-------------------------------------
-- Inserting values into dim_location
-------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_location](
    [continent],
    [country_or_state],
    [province_or_city]
)

SELECT DISTINCT

LOWER(LTRIM(RTRIM(continent))) AS continent,
LOWER(LTRIM(RTRIM(country_or_state))) AS country_or_state,
LOWER(LTRIM(RTRIM(province_or_city))) AS province_or_state
FROM [computer_staging].[dbo].[raw_pc_data];

SELECT * 
FROM [computer_staging].[dbo].[dim_location];
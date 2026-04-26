----------------------------------------------
--Creating a stored procedure for dim_location
----------------------------------------------

CREATE PROCEDURE [sp_create_dim_location]

AS
BEGIN
--------------------------------------------------
--creating dim_location table with the primary key
--------------------------------------------------

DROP TABLE [computer_staging].[dbo].[dim_location]

CREATE TABLE [computer_staging].[dbo].[dim_location](
    [location_id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Continent] [nvarchar](250) NOT NULL,
	[Country_or_State] [nvarchar](250) NOT NULL,
	[Province_or_City] [nvarchar](250) NOT NULL
	);


----------------------------------------
--Inserting values into the dim_location
----------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_location](
            [Continent],
			[Country_or_State],
			[Province_or_City])

SELECT DISTINCT 
            [Continent],
			[Country_or_State],
			[Province_or_City]
FROM [computer_staging].[dbo].[raw_pc_data];
	
SELECT * FROM [computer_staging].[dbo].[dim_location];
END;
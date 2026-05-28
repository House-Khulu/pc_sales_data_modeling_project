------------------------------------------
--Creating a stored procedure for dim_shop
------------------------------------------

CREATE PROCEDURE [sp_create_dim_shop]

AS
BEGIN
---------------------------------------------
--creating dim_shop tabe with the primary key
---------------------------------------------

    CREATE TABLE [computer_staging].[dbo].[dim_shop](
    [shop_id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[shop_name] [nvarchar](250) NOT NULL,
	[shop_age] [nvarchar](250) NOT NULL
);
END;


------------------------------------
--Inserting values into the dim_shop
------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_shop](
            [shop_name],
			[shop_age])

SELECT DISTINCT 
        LOWER(LTRIM(RTRIM(shop_name))) AS shop_name,
		LOWER(LTRIM(RTRIM(shop_age))) AS shop_age
FROM [computer_staging].[dbo].[raw_pc_data];

SELECT * FROM [computer_staging].[dbo].[dim_shop];  
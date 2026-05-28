---------------------------------------------
--creating dim_product tabe with the primary key
---------------------------------------------

IF NOT EXISTS  (SELECT * FROM sys.tables
WHERE NAME = 'dim_product')
BEGIN
    CREATE TABLE [computer_staging].[dbo].[dim_product](
    [product_id] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[pc_make] [nvarchar](250) NOT NULL,
	[pc_model] [nvarchar](250) NOT NULL,
	[storage_type] [nvarchar](250) NOT NULL,
	[ram] [nvarchar](250) NOT NULL,
	[storage_capacity] [nvarchar](250) NOT NULL
);
END;


---------------------------------------
--Inserting values into the dim_product
---------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_product](
            [pc_make],
			[pc_model],
			[storage_type],
			[ram],
	        [storage_capacity]

)

SELECT DISTINCT
         LOWER(LTRIM(RTRIM(pc_make))) AS pc_make,
		 LOWER(LTRIM(RTRIM(pc_model))) AS pc_model,
		 LOWER(LTRIM(RTRIM(storage_type))) AS storage_type,
		 LOWER(LTRIM(RTRIM(ram))) AS ram,
	     LOWER(LTRIM(RTRIM(storage_capacity))) AS storage_capacity
FROM [computer_staging].[dbo].[raw_pc_data];


SELECT * FROM [computer_staging].[dbo].[dim_product];
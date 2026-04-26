------------------------------------------
--Creating a stored procedure for dim_shop
------------------------------------------

CREATE PROCEDURE [sp_create_dim_shop]

AS
BEGIN
---------------------------------------------
--creating dim_shop tabe with the primary key
---------------------------------------------

DROP TABLE [computer_staging].[dbo].[dim_shop];

CREATE TABLE [computer_staging].[dbo].[dim_shop](
    [Shop_Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Shop_Name] [nvarchar](250) NOT NULL,
	[Shop_Age] [nvarchar](250) NOT NULL
);


------------------------------------
--Inserting values into the dim_shop
------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_shop](
            [Shop_Name],
			[Shop_Age])

SELECT DISTINCT 
            [Shop_Name],
			[Shop_Age]
FROM [computer_staging].[dbo].[raw_pc_data];
END;
---------------------------------------------
--Creating a stored procedure for dim_storage
---------------------------------------------

CREATE PROCEDURE [sp_create_dim_storage]

AS
BEGIN
------------------------------------------------
--creating dim_storage tabe with the primary key
------------------------------------------------

DROP TABLE [computer_staging].[dbo].[dim_storage];

CREATE TABLE [computer_staging].[dbo].[dim_storage](
    [Storage_ID] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[Storage_Type] [nvarchar](250) NOT NULL,
	[RAM] [nvarchar](250) NOT NULL,
	[Storage_Capacity] [nvarchar](250) NOT NULL
);


---------------------------------------
--Inserting values into the dim_storage
---------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_storage](
			[Storage_Type],
			[RAM],
			[Storage_Capacity])

SELECT DISTINCT
			[Storage_Type],
			[RAM],
			[Storage_Capacity]
FROM [computer_staging].[dbo].[raw_pc_data];
END;



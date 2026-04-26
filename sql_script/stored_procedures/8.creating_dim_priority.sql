----------------------------------------------
--Creating a stored procedure for dim_priority
----------------------------------------------

CREATE PROCEDURE [sp_create_dim_priority]

AS
BEGIN
-------------------------------------------------
--creating dim_priority tabe with the primary key
-------------------------------------------------

DROP TABLE [computer_staging].[dbo].[dim_priority];

CREATE TABLE [computer_staging].[dbo].[dim_priority](
    [Priority_ID] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[Priority] [nvarchar](50) NOT NULL
);

----------------------------------------
--Inserting values into the dim_priority
----------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_priority]([Priority])
SELECT DISTINCT [Priority]
FROM [computer_staging].[dbo].[raw_pc_data];
END;
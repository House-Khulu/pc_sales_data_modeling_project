------------------------------------------
--Creating a stored procedure for dim_date
------------------------------------------

CREATE PROCEDURE [sp_create_dim_date]

AS
BEGIN
----------------------------------------------
--creating dim_date table with the primary key
----------------------------------------------

DROP TABLE [computer_staging].[dbo].[dim_date];

CREATE TABLE [computer_staging].[dbo].[dim_date](
    [date_id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Purchase_Date] [nvarchar](250) NOT NULL,
	[Ship_Date] [nvarchar](250) NOT NULL
);

------------------------------------
--Inserting values into the dim_date
------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_date](
            [Purchase_Date],
			[Ship_Date])

SELECT DISTINCT 
            [Purchase_Date],
			[Ship_Date]
FROM [computer_staging].[dbo].[raw_pc_data];

SELECT * FROM [computer_staging].[dbo].[dim_date];
END;

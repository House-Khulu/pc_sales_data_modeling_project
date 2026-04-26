----------------------------------------------------
--creating dim_salesperson tabe with the primary key
----------------------------------------------------

DROP TABLE [computer_staging].[dbo].[dim_salesperson]

CREATE TABLE [computer_staging].[dbo].[dim_salesperson](
    [Sales_person_id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Sales_Person_Name] [nvarchar](250) NOT NULL,
	[Sales_Person_Department] [nvarchar](250) NOT NULL
)


-------------------------------------------
--Inserting values into the dim_salesperson
-------------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_salesperson](
            [Sales_Person_Name],
			[Sales_Person_Department])

SELECT DISTINCT 
            [Sales_Person_Name],
			[Sales_Person_Department]
FROM [computer_staging].[dbo].[raw_pc_data];

SELECT * FROM [computer_staging].[dbo].[dim_salesperson];


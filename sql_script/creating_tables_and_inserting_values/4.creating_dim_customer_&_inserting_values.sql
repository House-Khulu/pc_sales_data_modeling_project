--------------------------------------------------
--creating dim_customer table with the primary key
--------------------------------------------------

DROP TABLE [computer_staging].[dbo].[dim_customer]

CREATE TABLE [computer_staging].[dbo].[dim_customer](
    [customer_id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Customer_Name] [nvarchar](250) NOT NULL,
	[Customer_Surname] [nvarchar](250) NOT NULL,
	[Customer_Contact_Number] [nvarchar](250) NOT NULL,
	[Customer_Email_Address] [nvarchar](250) NOT NULL
);

----------------------------------------
--Inserting values into the dim_customer
----------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_customer](
            [Customer_Name],
			[Customer_Surname],
			[Customer_Contact_Number],
			[Customer_Email_Address])

SELECT DISTINCT 
            [Customer_Name],
			[Customer_Surname],
			[Customer_Contact_Number],
			[Customer_Email_Address]
FROM [computer_staging].[dbo].[raw_pc_data];

SELECT * FROM [computer_staging].[dbo].[dim_customer];
------------------------------------------------
--creating dim_payment tabe with the primary key
------------------------------------------------


DROP TABLE [computer_staging].[dbo].[dim_payment];

CREATE TABLE [computer_staging].[dbo].[dim_payment](
    [Payment_ID] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[Payment_Method] [nvarchar](250) NOT NULL
);


---------------------------------------
--Inserting values into the dim_payment
---------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_payment]([Payment_Method])
SELECT DISTINCT [Payment_Method]
FROM [computer_staging].[dbo].[raw_pc_data];

SELECT * FROM [computer_staging].[dbo].[dim_payment];






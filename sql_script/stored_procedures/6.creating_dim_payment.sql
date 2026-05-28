----------------------------------------------
--Creating a stored procedure for dim_payment
----------------------------------------------

CREATE PROCEDURE [sp_create_dim_payment]

AS
BEGIN
------------------------------------------------
--creating dim_payment tabe with the primary key
------------------------------------------------


    CREATE TABLE [computer_staging].[dbo].[dim_payment](
    [payment_id] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[payment_method] [nvarchar](250) NOT NULL
);
END;

---------------------------------------
--Inserting values into the dim_payment
---------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_payment]([payment_method])
SELECT DISTINCT
     LOWER(LTRIM(RTRIM(payment_method))) AS payment_method
FROM [computer_staging].[dbo].[raw_pc_data];

SELECT * FROM [computer_staging].[dbo].[dim_payment];

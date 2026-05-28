
-------------------------------------------------
--creating dim_priority tabe with the primary key
-------------------------------------------------

IF NOT EXISTS (SELECT * FROM sys.tables
WHERE NAME = 'dim_priority')
BEGIN
    CREATE TABLE [computer_staging].[dbo].[dim_priority](
    [priority_id] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[priority] [nvarchar](50) NOT NULL
);
END;

----------------------------------------
--Inserting values into the dim_priority
----------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_priority]([priority])
SELECT DISTINCT
     
     LOWER(LTRIM(RTRIM(priority))) AS priority
FROM [computer_staging].[dbo].[raw_pc_data];

SELECT * FROM [computer_staging].[dbo].[dim_priority];





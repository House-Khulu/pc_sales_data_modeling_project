
------------------------------------------------
--creating dim_channel tabe with the primary key
------------------------------------------------


IF NOT EXISTS (SELECT * FROM sys.tables
WHERE NAME = 'dim_channel')
BEGIN
    CREATE TABLE [computer_staging].[dbo].[dim_channel](
    [channel_id] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[channel] [nvarchar](250) NOT NULL
);
END;

--------------------------------------
--Inserting values into the dim_channel
--------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_channel](
            [channel])

SELECT DISTINCT

 LOWER(LTRIM(RTRIM(channel))) AS channel
FROM [computer_staging].[dbo].[raw_pc_data];

SELECT * FROM [computer_staging].[dbo].[dim_channel];



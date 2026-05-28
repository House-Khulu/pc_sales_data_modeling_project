---------------------------------------------
--Creating a stored procedure for dim_channel
---------------------------------------------

CREATE PROCEDURE [sp_create_dim_channel]

AS
BEGIN
------------------------------------------------
--creating dim_channel tabe with the primary key
------------------------------------------------

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

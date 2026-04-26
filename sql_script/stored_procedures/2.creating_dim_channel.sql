---------------------------------------------
--Creating a stored procedure for dim_channel
---------------------------------------------

CREATE PROCEDURE [sp_create_dim_channel]

AS
BEGIN
------------------------------------------------
--creating dim_channel tabe with the primary key
------------------------------------------------

DROP TABLE [computer_staging].[dbo].[dim_channel];

CREATE TABLE [computer_staging].[dbo].[dim_channel](
    [Channel_ID] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[Channel] [nvarchar](250) NOT NULL
);

--------------------------------------
--Inserting values into the dim_channel
--------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_channel](
            [Channel])

SELECT DISTINCT [Channel]
FROM [computer_staging].[dbo].[raw_pc_data];
END;
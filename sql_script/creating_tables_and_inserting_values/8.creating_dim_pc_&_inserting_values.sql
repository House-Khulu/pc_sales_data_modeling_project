---------------------------------------------
--creating dim_pc tabe with the primary key
---------------------------------------------

DROP TABLE [computer_staging].[dbo].[dim_pc];

CREATE TABLE [computer_staging].[dbo].[dim_pc](
    [PC_ID] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[PC_Make] [nvarchar](250) NOT NULL,
	[PC_Model] [nvarchar](250) NOT NULL,	
);


-----------------------------------
--Inserting values into the dim_PC
-----------------------------------

INSERT INTO [computer_staging].[dbo].[dim_pc](
            [PC_Make],
			[PC_Model]
)

SELECT DISTINCT
            [PC_Make],
			[PC_Model]
FROM [computer_staging].[dbo].[raw_pc_data];


SELECT * FROM [computer_staging].[dbo].[dim_pc];
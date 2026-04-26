-----------------------------------------------
--Creating a stored procedure for fact_pc_sales
-----------------------------------------------

CREATE PROCEDURE [sp_create_fact_pc_sales]

AS
BEGIN
-------------------------------------------------
--creating fact_pc_sales tabe with the primary key
-------------------------------------------------

DROP TABLE [computer_staging].[dbo].[fact_pc_sales];

CREATE TABLE [computer_staging].[dbo].[fact_pc_sales](
    [Sales_ID] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[Cost_Price] INT NOT NULL,
	[Sale_Price] INT NOT NULL,
	[Discount_Amount] INT NOT NULL,
	[Finance_Amount] INT NOT NULL,
	[Credit_Score] INT NOT NULL,
	[Cost_of_Repairs] INT NOT NULL,
	[Total_Sales_per_Employee] INT NOT NULL,
	[PC_Market_Price] INT NOT NULL
);


-----------------------------------------
--Inserting values into the fact_pc_sales
-----------------------------------------

INSERT INTO [computer_staging].[dbo].[fact_pc_sales](
            [Cost_Price],
			[Sale_Price],
			[Discount_Amount],
			[Finance_Amount],
			[Credit_Score],
			[Cost_of_Repairs],
			[Total_Sales_per_Employee],
			[PC_Market_Price])

SELECT DISTINCT 
            [Cost_Price],
			[Sale_Price],
			[Discount_Amount],
			[Finance_Amount],
			[Credit_Score],
			[Cost_of_Repairs],
			[Total_Sales_per_Employee],
			[PC_Market_Price]
FROM [computer_staging].[dbo].[raw_pc_data];
END;

EXEC [sp_create_fact_pc_sales]
-------------------------------------------------
--creating fact_pc_sales tabe with the primary key
-------------------------------------------------

--DROP TABLE [computer_staging].[dbo].[fact_pc_sales];

CREATE TABLE [computer_staging].[dbo].[fact_pc_sales](
    [Sales_ID] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[customer_id] INT NULL,
    [date_id] INT NULL,
    [Payment_ID] INT NULL,
    [PC_ID] INT NULL,
    [Priority_ID] INT NULL,
    [Sales_person_id] INT NULL,
    [Shop_Id] INT NULL,
    [Storage_ID] INT NULL,
    [location_id] INT NULL,
    [channel_ID] INT NULL,
	[Cost_Price] INT NOT NULL,
	[Sale_Price] INT NOT NULL,
	[Discount_Amount] INT NOT NULL,
	[Finance_Amount] INT NOT NULL,
	[Credit_Score] INT NOT NULL,
	[Cost_of_Repairs] INT NOT NULL,
	[Total_Sales_per_Employee] INT NOT NULL,
	[PC_Market_Price] INT NOT NULL,
 

  

CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES [computer_staging].[dbo].[dim_customer] (customer_id),
CONSTRAINT fk_date FOREIGN KEY (date_id) REFERENCES [computer_staging].[dbo].[dim_date] (date_id),
CONSTRAINT fk_payment FOREIGN KEY (Payment_ID) REFERENCES [computer_staging].[dbo].[dim_payment] (payment_id),
CONSTRAINT fk_PC FOREIGN KEY (PC_ID) REFERENCES [computer_staging].[dbo].[dim_pc] (PC_ID),
CONSTRAINT fk_Priority FOREIGN KEY (Priority_ID) REFERENCES [computer_staging].[dbo].[dim_Priority] (Priority_ID),
CONSTRAINT fk_Sales_person FOREIGN KEY (Sales_person_id) REFERENCES [computer_staging].[dbo].[dim_Salesperson] (Sales_person_id),
CONSTRAINT fk_Shop FOREIGN KEY (Shop_Id) REFERENCES [computer_staging].[dbo].[dim_Shop] (Shop_Id),
CONSTRAINT fk_Storage FOREIGN KEY (Storage_ID) REFERENCES [computer_staging].[dbo].[dim_Storage] (Storage_ID),
CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES [computer_staging].[dbo].[dim_location] (location_id),
CONSTRAINT fk_channel FOREIGN KEY (channel_ID) REFERENCES [computer_staging].[dbo].[dim_channel] (channel_ID) );

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

SELECT * FROM [computer_staging].[dbo].[fact_pc_sales];
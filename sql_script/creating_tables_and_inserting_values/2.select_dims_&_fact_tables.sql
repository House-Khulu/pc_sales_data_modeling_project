SELECT TOP (1000) [Cost_Price]
      ,[Sale_Price]
      ,[Discount_Amount]
      ,[Finance_Amount]
      ,[Credit_Score]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
  FROM [computer_staging].[dbo].[fact_pc_sales]

  SELECT * FROM [computer_staging].[dbo].[fact_pc_sales];

  SELECT * FROM [computer_staging].[dbo].[dim_channel];

  SELECT * FROM [computer_staging].[dbo].[dim_customer];

  SELECT * FROM [computer_staging].[dbo].[dim_date];

  SELECT * FROM [computer_staging].[dbo].[dim_location];

  SELECT * FROM [computer_staging].[dbo].[dim_payment];

  SELECT * FROM [computer_staging].[dbo].[dim_pc];

  SELECT * FROM [computer_staging].[dbo].[dim_storage]

  SELECT * FROM [computer_staging].[dbo].[dim_priority];

  SELECT * FROM [computer_staging].[dbo].[dim_salesperson];

  SELECT * FROM [computer_staging].[dbo].[dim_shop];

 
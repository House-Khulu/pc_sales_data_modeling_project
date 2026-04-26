SELECT TOP (1000) [Continent]
      ,[Country_or_State]
      ,[Province_or_City]
      ,[Shop_Name]
      ,[Shop_Age]
      ,[PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
      ,[Sales_Person_Name]
      ,[Sales_Person_Department]
      ,[Cost_Price]
      ,[Sale_Price]
      ,[Payment_Method]
      ,[Discount_Amount]
      ,[Purchase_Date]
      ,[Ship_Date]
      ,[Finance_Amount]
      ,[RAM]
      ,[Credit_Score]
      ,[Channel]
      ,[Priority]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
      ,[Storage_Capacity]
  FROM [computer_staging].[dbo].[raw_pc_data];

  -----------------------
  --Creating dim_location
  -----------------------

  SELECT DISTINCT
       [Continent]
      ,[Country_or_State]
      ,[Province_or_City]
  INTO [computer_staging].[dbo].[dim_location]
  FROM [computer_staging].[dbo].[raw_pc_data];
  

  ------------------------
  --Creating dim_customer
  ------------------------

  SELECT DISTINCT
       [Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
  INTO [computer_staging].[dbo].[dim_customer]
  FROM [computer_staging].[dbo].[raw_pc_data];

  -----------------
  --Creating dim_pc
  -----------------

  SELECT DISTINCT
       [PC_Make]
      ,[PC_Model]   
  INTO [computer_staging].[dbo].[dim_pc]
  FROM [computer_staging].[dbo].[raw_pc_data];

   ----------------------
  --Creating dim_storage
  -----------------------

  SELECT DISTINCT    
      ,[Storage_Type]
      ,[RAM]
      ,[Storage_Capacity]
  INTO [computer_staging].[dbo].[dim_pc]
  FROM [computer_staging].[dbo].[raw_pc_data];


  --------------------------
  --Creating dim_salesperson
  --------------------------

  SELECT DISTINCT
       [Sales_Person_Name]
      ,[Sales_Person_Department]
  INTO [computer_staging].[dbo].[dim_salesperson]
  FROM [computer_staging].[dbo].[raw_pc_data];


  -------------------
  --Creating dim_shop
  -------------------
  SELECT DISTINCT
       [Shop_Name]
      ,[Shop_Age]
  INTO [computer_staging].[dbo].[dim_shop]
  FROM [computer_staging].[dbo].[raw_pc_data];


  -------------------
  --Creating dim_date
  -------------------
  SELECT DISTINCT
       [Purchase_Date]
      ,[Ship_Date]
  INTO [computer_staging].[dbo].[dim_date]
  FROM [computer_staging].[dbo].[raw_pc_data];


  ----------------------
  --Creating dim_payment
  ----------------------
  SELECT DISTINCT [Payment_Method]
  INTO [computer_staging].[dbo].[dim_payment]
  FROM [computer_staging].[dbo].[raw_pc_data];


  ----------------------
  --Creating dim_channel
  ----------------------
  SELECT DISTINCT [Channel]
  INTO [computer_staging].[dbo].[dim_channel]
  FROM [computer_staging].[dbo].[raw_pc_data];



  -----------------------
  --Creating dim_priority
  -----------------------
  SELECT DISTINCT [Priority]
  INTO [computer_staging].[dbo].[dim_priority]
  FROM [computer_staging].[dbo].[raw_pc_data];


  ------------------------
  --Creating fact_pc_sales
  ------------------------

  SELECT DISTINCT
       [Cost_Price]
      ,[Sale_Price]
      ,[Discount_Amount]
      ,[Finance_Amount]
      ,[Credit_Score]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
  INTO [computer_staging].[dbo].[fact_pc_sales]
  FROM [computer_staging].[dbo].[raw_pc_data];












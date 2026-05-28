--------------------------------------------------
--Creating a stored procedure for dim_sales_person
--------------------------------------------------

CREATE PROCEDURE [sp_create_dim_sales_person]

AS
BEGIN
----------------------------------------------------
--creating dim_salesperson tabe with the primary key
----------------------------------------------------

    CREATE TABLE [computer_staging].[dbo].[dim_sales_person](
    [sales_person_id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[sales_person_name] [nvarchar](250) NOT NULL,
	[sales_person_department] [nvarchar](250) NOT NULL
);
END;

-------------------------------------------
--Inserting values into the dim_salesperson
-------------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_sales_person](
            [sales_person_name],
			[sales_person_department])

SELECT DISTINCT 

        LOWER(LTRIM(RTRIM(sales_person_name))) AS sales_person_name,
		LOWER(LTRIM(RTRIM(sales_person_department))) AS sales_person_department
FROM [computer_staging].[dbo].[raw_pc_data];




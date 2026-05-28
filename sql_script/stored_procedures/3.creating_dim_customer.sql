----------------------------------------------
--Creating a stored procedure for dim_customer
----------------------------------------------

CREATE PROCEDURE [sp_create_dim_customer]

AS
BEGIN
--------------------------------------------------
--creating dim_customer table with the primary key
--------------------------------------------------

CREATE TABLE [computer_staging].[dbo].[dim_customer](
    [customer_id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[customer_name] [nvarchar](250) NOT NULL,
	[customer_surname] [nvarchar](250) NOT NULL,
	[customer_contact_number] [nvarchar](250) NOT NULL,
	[customer_email_address] [nvarchar](250) NOT NULL
);
END;
----------------------------------------
--Inserting values into the dim_customer
----------------------------------------

INSERT INTO [computer_staging].[dbo].[dim_customer] (

    customer_name,
    customer_surname,
    customer_contact_number,
    customer_email_address

)

SELECT DISTINCT

    LOWER(LTRIM(RTRIM(Customer_Name))) AS customer_name,
    LOWER(LTRIM(RTRIM(Customer_Surname))) AS customer_surname,
    LOWER(LTRIM(RTRIM(Customer_Contact_Number))) AS customer_contact_number,
    LOWER(LTRIM(RTRIM(Customer_Email_Address))) AS customer_email_address

FROM[computer_staging].[dbo].[raw_pc_data];

EXEC [sp_create_dim_customer]
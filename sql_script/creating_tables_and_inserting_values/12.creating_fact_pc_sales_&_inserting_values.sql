-------------------------------------------------
-- Create fact_sales table
-------------------------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'fact_sales'
)
BEGIN

    CREATE TABLE [computer_staging].[dbo].[fact_sales](

        [sales_id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,

        -------------------------------------------------
        -- Date Foreign Keys
        -------------------------------------------------

        [purchase_date_id] INT NOT NULL,
        [ship_date_id] INT NULL,

        -------------------------------------------------
        -- Dimension Foreign Keys
        -------------------------------------------------

        [customer_id] INT NULL,
        [payment_id] INT NULL,
        [product_id] INT NULL,
        [priority_id] INT NULL,
        [sales_person_id] INT NULL,
        [shop_id] INT NULL,
        [location_id] INT NULL,
        [channel_id] INT NULL,

        -------------------------------------------------
        -- Measures
        -------------------------------------------------

        [cost_price] DECIMAL(12,2) NOT NULL,
        [sale_price] DECIMAL(12,2) NOT NULL,
        [discount_amount] DECIMAL(12,2) NOT NULL,
        [finance_amount] DECIMAL(12,2) NOT NULL,
        [credit_score] INT NOT NULL,
        [cost_of_repairs] DECIMAL(12,2) NOT NULL,
        [total_sales_per_employee] DECIMAL(12,2) NOT NULL,
        [pc_market_price] DECIMAL(12,2) NOT NULL,

        -------------------------------------------------
        -- Foreign Key Constraints
        -------------------------------------------------

        CONSTRAINT fk_purchase_date
        FOREIGN KEY (purchase_date_id)
        REFERENCES [computer_staging].[dbo].[dim_date](date_id),

        CONSTRAINT fk_ship_date
        FOREIGN KEY (ship_date_id)
        REFERENCES [computer_staging].[dbo].[dim_date](date_id),

        CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES [computer_staging].[dbo].[dim_customer](customer_id),

        CONSTRAINT fk_payment
        FOREIGN KEY (payment_id)
        REFERENCES [computer_staging].[dbo].[dim_payment](payment_id),

        CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES [computer_staging].[dbo].[dim_product](product_id),

        CONSTRAINT fk_priority
        FOREIGN KEY (priority_id)
        REFERENCES [computer_staging].[dbo].[dim_priority](priority_id),

        CONSTRAINT fk_sales_person
        FOREIGN KEY (sales_person_id)
        REFERENCES [computer_staging].[dbo].[dim_sales_person](sales_person_id),

        CONSTRAINT fk_shop
        FOREIGN KEY (shop_id)
        REFERENCES [computer_staging].[dbo].[dim_shop](shop_id),

        CONSTRAINT fk_location
        FOREIGN KEY (location_id)
        REFERENCES [computer_staging].[dbo].[dim_location](location_id),

        CONSTRAINT fk_channel
        FOREIGN KEY (channel_id)
        REFERENCES [computer_staging].[dbo].[dim_channel](channel_id)

    );

END;


-------------------------------------------------
-- Insert data into fact_sales
-------------------------------------------------

INSERT INTO [computer_staging].[dbo].[fact_sales](

    [purchase_date_id],
    [ship_date_id],

    [customer_id],
    [payment_id],
    [product_id],
    [priority_id],
    [sales_person_id],
    [shop_id],
    [location_id],
    [channel_id],

    [cost_price],
    [sale_price],
    [discount_amount],
    [finance_amount],
    [credit_score],
    [cost_of_repairs],
    [total_sales_per_employee],
    [pc_market_price]

)

SELECT DISTINCT

    -------------------------------------------------
    -- Purchase Date
    -------------------------------------------------

    CAST(
        CONVERT(
            VARCHAR(8),
            TRY_CAST(r.purchase_date AS DATE),
            112
        ) AS INT
    ) AS purchase_date_id,

    -------------------------------------------------
    -- Ship Date
    -------------------------------------------------

    CAST(
        CONVERT(
            VARCHAR(8),
            TRY_CAST(NULLIF(r.ship_date, 'N/A') AS DATE),
            112
        ) AS INT
    ) AS ship_date_id,

    -------------------------------------------------
    -- Dimension Foreign Keys
    -------------------------------------------------

    dc.customer_id,
    dp.payment_id,
    dpr.product_id,
    dpri.priority_id,
    dsp.sales_person_id,
    ds.shop_id,
    dl.location_id,
    dch.channel_id,

    -------------------------------------------------
    -- Measures
    -------------------------------------------------

    r.cost_price,
    r.sale_price,
    r.discount_amount,
    r.finance_amount,
    r.credit_score,
    r.cost_of_repairs,
    r.total_sales_per_employee,
    r.pc_market_price

FROM [computer_staging].[dbo].[raw_pc_data] r


-------------------------------------------------
-- Customer Join
-------------------------------------------------

INNER JOIN [computer_staging].[dbo].[dim_customer] dc

ON LOWER(LTRIM(RTRIM(r.Customer_Name))) =
   dc.customer_name

AND LOWER(LTRIM(RTRIM(r.Customer_Surname))) =
    dc.customer_surname

AND LOWER(LTRIM(RTRIM(r.Customer_Contact_Number))) =
    dc.customer_contact_number

AND LOWER(LTRIM(RTRIM(r.Customer_Email_Address))) =
    dc.customer_email_address


-------------------------------------------------
-- Payment Join
-------------------------------------------------

INNER JOIN [computer_staging].[dbo].[dim_payment] dp

ON LOWER(LTRIM(RTRIM(r.payment_method))) =
   dp.payment_method


-------------------------------------------------
-- Product Join
-------------------------------------------------

INNER JOIN [computer_staging].[dbo].[dim_product] dpr

ON LOWER(LTRIM(RTRIM(r.pc_make))) =
   dpr.pc_make

AND LOWER(LTRIM(RTRIM(r.pc_model))) =
    dpr.pc_model

AND LOWER(LTRIM(RTRIM(r.storage_type))) =
    dpr.storage_type

AND LOWER(LTRIM(RTRIM(r.ram))) =
    dpr.ram

AND LOWER(LTRIM(RTRIM(r.storage_capacity))) =
    dpr.storage_capacity


-------------------------------------------------
-- Priority Join
-------------------------------------------------

INNER JOIN [computer_staging].[dbo].[dim_priority] dpri

ON LOWER(LTRIM(RTRIM(r.priority))) =
   dpri.priority


-------------------------------------------------
-- Sales Person Join
-------------------------------------------------

INNER JOIN [computer_staging].[dbo].[dim_sales_person] dsp

ON LOWER(LTRIM(RTRIM(r.sales_person_name))) =
   dsp.sales_person_name

AND LOWER(LTRIM(RTRIM(r.sales_person_department))) =
    dsp.sales_person_department


-------------------------------------------------
-- Shop Join
-------------------------------------------------

INNER JOIN [computer_staging].[dbo].[dim_shop] ds

ON LOWER(LTRIM(RTRIM(r.shop_name))) =
   ds.shop_name

AND LOWER(LTRIM(RTRIM(r.shop_age))) =
    ds.shop_age


-------------------------------------------------
-- Location Join
-------------------------------------------------

INNER JOIN [computer_staging].[dbo].[dim_location] dl

ON LOWER(LTRIM(RTRIM(r.continent))) =
   dl.continent

AND LOWER(LTRIM(RTRIM(r.country_or_state))) =
    dl.country_or_state

AND LOWER(LTRIM(RTRIM(r.province_or_city))) =
    dl.province_or_city


-------------------------------------------------
-- Channel Join
-------------------------------------------------

INNER JOIN [computer_staging].[dbo].[dim_channel] dch

ON LOWER(LTRIM(RTRIM(r.channel))) =
   dch.channel;


-------------------------------------------------
-- View fact table
-------------------------------------------------

SELECT *
FROM [computer_staging].[dbo].[fact_sales];





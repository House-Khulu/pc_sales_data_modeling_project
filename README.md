# pc_sales_data_modeling_project
End-to-end data warehouse project covering conceptual, logical, and physical modeling for PC Sales data, implemented in SQL Server with stored procedures and role-based access control.


## PC Sales Data Modeling — Star Schema Project

## Overview

A data warehousing project that models PC Sales data through conceptual, 
logical, and physical design stages, laying the structured foundation 
required to build reliable data pipelines.
Built on a Star Schema with 11 tables, stored procedures, and role-based 
access control in SQL Server, enabling efficient and scalable data flow 
from source to warehouse.

---

## Table of Contents

- [pc\_sales\_data\_modeling\_project](#pc_sales_data_modeling_project)
  - [PC Sales Data Modeling — Star Schema Project](#pc-sales-data-modeling--star-schema-project)
  - [Overview](#overview)
  - [Table of Contents](#table-of-contents)
  - [Project Structure](#project-structure)
  - [Tools and Technologies Used](#tools-and-technologies-used)
  - [1. Raw Data Extraction from CSV](#1-raw-data-extraction-from-csv)
  - [2. Data Grouping and Table Identification in Excel](#2-data-grouping-and-table-identification-in-excel)
  - [3. Conceptual Modeling for PC Data Sales](#3-conceptual-modeling-for-pc-data-sales)
  - [4. Logical Modeling (Star Schema)](#4-logical-modeling-star-schema)
    - [Fact Table — Fact Sales](#fact-table--fact-sales)
    - [Dimension Tables](#dimension-tables)
  - [5. Physical Modeling in SSMS](#5-physical-modeling-in-ssms)
    - [Fact Table — Fact Sales](#fact-table--fact-sales-1)
    - [Dimension Tables](#dimension-tables-1)
  - [6. Security — User Roles and Access Control](#6-security--user-roles-and-access-control)
    - [Computer Staging Database — User Roles](#computer-staging-database--user-roles)
    - [Computer Data Warehouse Database — User Roles](#computer-data-warehouse-database--user-roles)
    - [Implementation](#implementation)
  - [7. Stored Procedures](#7-stored-procedures)

---
## Project Structure

```

PC-Sales-Data-Modeling/
|-- data/
|   |-- pc_sales_raw.csv
|-- modeling/
|   |-- conceptual_model.docx
|   |-- logical_model_star_schema.drawio
|   |-- physical_model.sql
|-- sql/
|   |-- create_databases.sql
|   |-- create_dim_tables.sql
|   |-- create_fact_table.sql
|-- security/
|   |-- create_users.sql
|   |-- grant_permissions.sql
|-- stored_procedures/
|   |-- sp_dim_customer.sql
|   |-- sp_dim_location.sql
|   |-- sp_dim_date.sql
|   |-- sp_dim_sales_person.sql
|   |-- sp_dim_shop.sql
|   |-- sp_dim_storage.sql
|   |-- sp_dim_pc.sql
|   |-- sp_dim_payment.sql
|   |-- sp_dim_priority.sql
|   |-- sp_dim_channel.sql
|   |-- sp_fact_sales.sql
|-- README.md

```

---

##  Tools and Technologies Used

| Tool | Purpose |
|---|---|
| <img src="https://img.shields.io/badge/CSV-File-green?style=flat-square" /> | Raw source data |
| <img src="https://img.shields.io/badge/Microsoft-Excel-217346?style=flat-square&logo=microsoft-excel&logoColor=white" /> | Data grouping and analysis |
| <img src="https://img.shields.io/badge/Microsoft-Word-2B579A?style=flat-square&logo=microsoft-word&logoColor=white" /> | Conceptual modeling |
| <img src="https://img.shields.io/badge/Draw.io-F08705?style=flat-square&logo=diagrams.net&logoColor=white" /> | Logical modeling (Star Schema diagram) |
| <img src="https://img.shields.io/badge/SSMS-CC2927?style=flat-square&logo=microsoft-sql-server&logoColor=white" /> | Physical modeling and database implementation |
| <img src="https://img.shields.io/badge/T--SQL-CC2927?style=flat-square&logo=microsoft-sql-server&logoColor=white" /> | Table creation, constraints, and stored procedures |
| <img src="https://img.shields.io/badge/T--SQL_(DCL)-CC2927?style=flat-square&logo=microsoft-sql-server&logoColor=white" /> | User creation and role-based access control |
| <img src="https://img.shields.io/badge/Git_Bash-F05032?style=flat-square&logo=git&logoColor=white" /> | Command-Line Shell (CLI) and Version Control |
| <img src="https://img.shields.io/badge/VS_Code-007ACC?style=flat-square&logo=visual-studio-code&logoColor=white" /> | Code/Text Editor (GUI) |
| <img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" /> | Cloud Storage and Portfolio |

---

## 1. Raw Data Extraction from CSV

The project begins with a raw CSV file containing unstructured PC sales transaction data. This file serves as the single source of truth and contains all the raw fields required to build the data warehouse. The first step involved opening and reviewing the CSV to understand the data landscape — identifying all available fields, assessing data quality, and determining how the data could be structured into a meaningful schema.

**The screenshot below shows the raw pc data :**

![Reference image](/screen_shots/Raw%20data.PNG)

---

## 2. Data Grouping and Table Identification in Excel

Once the raw data was loaded into Microsoft Excel, the data was analysed and grouped according to logical relationships between columns. Related fields were identified and grouped together based on the business entities they represent — such as customer details, product specifications, location attributes, and transaction metrics. 

This grouping exercise formed the core foundation for defining the dimension and fact tables that would follow.

**The screenshots below demonstrates the actions taken to group the data:**

![Reference image](/screen_shots/Raw%20pc%20data.PNG)


**The Fact Sales Table :**

![Reference image](/screen_shots/Fact%20table.PNG)


**The Dimension Tables :**

![Reference image](/screen_shots/Dim%20Tables.PNG)


---

## 3. Conceptual Modeling for PC Data Sales

The conceptual model was designed using the **SmartArt** feature in 
Microsoft Word, serving as a high-level blueprint that communicates 
the overall structure of the data warehouse to both technical and 
non-technical stakeholders.

**The screenshot below demonstrates the conceptual modeling diagram:**

![Reference image](/screen_shots/Conceptual%20Modeling%20for%20PC%20Data%20Sales.PNG)

At the center sits the **Fact Sales** table, surrounded by 
**10 dimension tables** that provide descriptive context to each 
sales transaction:

- **Dim Customer** – who made the purchase
- **Dim Location** – where the sale occurred geographically
- **Dim Date** – when the transaction took place
- **Dim Sales Person** – which staff member handled the sale
- **Dim Shop** – the specific store involved
- **Dim Storage** – PC RAM, storage type and storage capacity
- **Dim PC** – the product (personal computer) being sold
- **Dim Payment** – the payment method used
- **Dim Priority** – the order or delivery priority level
- **Dim Channel** – the sales channel (e.g. online, offline)



---

## 4. Logical Modeling (Star Schema)

The logical model was constructed using **Draw.io** and represents a detailed Star Schema diagram. At this stage, each entity is defined with its attributes, primary keys (PKs), and foreign keys (FKs). 

The **diagram** below illustrates the relationships between each dimension table and the central Fact Sales table :

![Reference image](/star_schema/pc_sales_%20data%20modeling_drawio.png)


The core of the schema is the **Fact Sales** table, identified by a primary key **Sales_ID**. 
It holds all measurable sales metrics and contains **10 Foreign Keys (FKs)** that link to 
each dimension table, enabling multi-dimensional analysis.

### Fact Table — Fact Sales

| Column | Key Type |
|---|---|
| Sales_ID | PK |
| Customer_ID, Location_ID, Date_ID, Sales_Person_ID | FK |
| Storage_ID, PC_ID, Shop_ID, Channel_ID | FK |
| Payment_ID, Priority_ID | FK |
| PC_Market_Price, Cost_Price, Sale_Price | Measures |
| Discount_Amount, Finance_Amount, Credit_Score | Measures |
| Total_Sales_Per_Employee, Cost_Of_Repairs | Measures |

---

### Dimension Tables

| Dimension | Primary Key | Attributes |
|---|---|---|
| **Dim Customer** | Customer_ID | Name, Surname, Contact Number, Email Address |
| **Dim Location** | Location_ID | Continent, Country or State, Province or City |
| **Dim Date** | Date_ID | Purchase Date, Ship Date |
| **Dim Sales Person** | Sales_Person_ID | Name, Department |
| **Dim Shop** | Shop_ID | Shop Name, Shop Age |
| **Dim Storage** | Storage_ID | Capacity, Type, RAM |
| **Dim PC** | PC_ID | Make, Model |
| **Dim Payment** | Payment_ID | Payment Method |
| **Dim Priority** | Priority_ID | Priority |
| **Dim Channel** | Channel_ID | Channel |


---

## 5. Physical Modeling in SSMS

The physical implementation was carried out in **SQL Server Management Studio (SSMS)**, where **two databases** were created: 

![Reference image](/screen_shots/Creating%20Databases.PNG)

- **Computer Staging** — Used as the **working environment(messy data)** for building and loading the schema.
- **Computer Data Warehouse** — The target data warehouse database.

Within the **Computer Staging** database, all dimension tables and the fact table were created with the following constraints applied:


This demonstrates the **code** used to **create the dim_location table:**

![Reference image](/screen_shots/Creating%20Dim%20location%20table.PNG)

And this demonstrates the **code** used to **create the fact_sales table :**

![Reference image](/screen_shots/Creating%20Fact%20sales%20table.PNG)


- **Primary Keys (PKs)** were added to all tables to uniquely identify each record.
- **Foreign Keys (FKs)** were added to the Fact Sales table to enforce referential integrity with each of the dimension tables.



This physical layer translates the logical model into concrete, queryable database objects ready for data loading and reporting.

### Fact Table — Fact Sales

| Column | Data Type | Constraint |
|---|---|---|
| Sales_ID | INT | PK, NOT NULL |
| Customer_ID, Location_ID, Date_ID, Sales_Person_ID | INT | FK, NOT NULL |
| Storage_ID, PC_ID, Shop_ID, Channel_ID | INT | FK, NOT NULL |
| Payment_ID, Priority_ID | INT | FK, NOT NULL |
| PC_Market_Price, Cost_Price, Sale_Price | INT | NOT NULL |
| Discount_Amount, Finance_Amount | INT | NOT NULL |
| Credit_Score | INT | NOT NULL |
| Total_Sales_Per_Employee, Cost_Of_Repairs | INT | NOT NULL |

---

### Dimension Tables

| Dimension | Primary Key | Attributes | Data Types | Constraint |
|---|---|---|---|---|
| **Dim Customer** | Customer_ID (INT) | Name, Surname, Email Address | VARCHAR(250) | NOT NULL |
| | | Contact Number | VARCHAR(20) | NOT NULL |
| **Dim Location** | Location_ID (INT) | Continent, Country or State, Province or City | VARCHAR(250) | NOT NULL |
| **Dim Date** | Date_ID (INT) | Purchase Date, Ship Date | INT | NOT NULL |
| **Dim Sales Person** | Sales_Person_ID (INT) | Name, Department | VARCHAR(250) | NOT NULL |
| **Dim Shop** | Shop_ID (INT) | Shop Name | VARCHAR(250) | NOT NULL |
| | | Shop Age | INT | NOT NULL |
| **Dim Storage** | Storage_ID (INT) | Capacity, Type, RAM | VARCHAR(250) | NOT NULL |
| **Dim PC** | PC_ID (INT) | Make, Model | VARCHAR(250) | NOT NULL |
| **Dim Payment** | Payment_ID (INT) | Payment Method | VARCHAR(250) | NOT NULL |
| **Dim Priority** | Priority_ID (INT) | Priority | VARCHAR(250) | NOT NULL |
| **Dim Channel** | Channel_ID (INT) | Channel | VARCHAR(250) | NOT NULL |

---


## 6. Security — User Roles and Access Control

To ensure data governance and restrict access based on responsibility,
user accounts were created within SSMS, each assigned specific roles 
and privileges aligned to their job function and the database they 
are permitted to access.

---

### Computer Staging Database — User Roles

This database is a working environment containing raw and unclean data.
Access is strictly limited to technical users responsible for data 
cleaning, transformation, and pipeline execution only.

| User Role | Permissions Granted |
|---|---|
| Data Engineer | Full read and write access (db_datareader, db_datawriter). Responsible for data cleaning, transformation, and migrating cleaned data to the D(db_datareader, db_datawriter)ata Warehouse. |

![Reference image](/screen_shots/data_engineer_user.PNG)

---

### Computer Data Warehouse Database — User Roles

This database contains cleaned, structured, and reliable data ready 
for reporting and analysis. Business and analytical user roles are 
created here only, ensuring they interact with trusted data exclusively.

| User Role | Permissions Granted |
|---|---|
| Data Engineer | Full read and write access (db_datareader, db_datawriter). Responsible for loading and managing the cleaned data within the Data Warehouse. |
| Sales Manager | SELECT on Fact Sales and all Dimension tables. Read-only access to sales performance data for reporting purposes. |
| Data Analyst | SELECT on all tables only. Cannot modify, insert, delete or execute any stored procedures. Restricted to querying and analysing the cleaned warehouse data. |
| Data Scientist | SELECT on all tables only. Cannot modify, insert, delete or execute any stored procedures. Restricted to querying and analysing data for modelling and analytical purposes. |

![Reference image](/screen_shots/da_ds_&_sm_users.PNG)


### Implementation

User accounts were created and permissions were assigned using T-SQL 
within the Computer Staging database as follows:

- CREATE LOGIN and CREATE USER were used to set up each account
- GRANT SELECT was applied to restrict read access per role
- The Data Engineer is the only user granted INSERT, UPDATE, or DELETE privileges to 
  protect data integrity


![Reference image](/screen_shots/user_roles.PNG)

---

## 7. Stored Procedures

Still within the **Computer Staging database**, **Stored Procedures** were created for all dimension tables and the fact table. These stored procedures centralizes the data insertion and transformation logic, enabling repeatable, consistent, and maintainable data loads into the staging environment. By abstracting the loading logic into stored procedures, the solution supports scalability and simplifies future data pipeline management.

The below screenshot shows one of the codes used to create the **Store Procedure for dim_customer**

![Reference image](/screen_shots/Stored%20procedure%20dim_customer.PNG)


---

**Author - Mzimkhulu Mthethwa**

Developed as part of a data warehousing and business intelligence project, 
demonstrating the full data modeling lifecycle from raw data to a structured, 
query-ready Star Schema — showcasing practical skills in Data Engineering and 
Business Intelligence, and Data Analytics



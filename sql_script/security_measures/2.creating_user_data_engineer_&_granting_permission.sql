-------------------------------------
--Creating the user for data_engineer
--------------------------------------

USE [master];
GO

CREATE USER data_engineer
FOR LOGIN data_engineer_login;
GO

-----------------------------------------
--Create the user inside computer_staging
-----------------------------------------

USE [computer_staging];
GO

---------------------------------
--Grant all necessary permissions
---------------------------------
GRANT CONNECT TO data_engineer;
ALTER ROLE db_datareader ADD MEMBER data_engineer;
ALTER ROLE db_datawriter ADD MEMBER data_engineer;
GO

-----------------------------------
-- COMPUTER DATA WAREHOUSE DATABASE
-----------------------------------

USE [computer_datawarehouse];
GO

CREATE USER DataEngineer
FOR LOGIN data_engineer_login;
GO


---------------------------------
--Grant all necessary permissions
---------------------------------
ALTER ROLE db_datareader ADD MEMBER DataEngineer;
ALTER ROLE db_datawriter ADD MEMBER DataEngineer;
GO


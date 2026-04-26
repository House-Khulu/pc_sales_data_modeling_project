
/* Creating users for the following roles and only accesssible to computer_datawarehouse database :
1. sales_manager
2. data_analyst
3. data_scientist
4. data_analyst

*/

USE [computer_datawarehouse];
GO

CREATE USER sales_manager
FOR LOGIN sales_manager_login;
GO

CREATE USER data_analyst
FOR LOGIN data_analyst_login;
GO

CREATE USER data_scientist
FOR LOGIN data_scientist_login;
GO

---------------------------------
--Grant all necessary permissions
---------------------------------

GRANT CONNECT TO sales_manager;
GRANT CONNECT TO data_analyst;
GRANT CONNECT TO data_scientist;
GO

ALTER ROLE db_datareader ADD MEMBER sales_manager;
ALTER ROLE db_datareader ADD MEMBER data_analyst;
ALTER ROLE db_datareader ADD MEMBER data_scientist;
GO




















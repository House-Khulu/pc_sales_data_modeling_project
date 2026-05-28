-------------------------------------------------------------------------
-- Creating two Databases [computer_datawarehouse] and [computer_staging]
-------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM sys.databases 
WHERE NAME = 'computer_datawarehouse')
BEGIN
     CREATE DATABASE [computer_datawarehouse];
END



IF NOT EXISTS (SELECT * FROM sys.databases
WHERE NAME = 'computer_staging')
BEGIN
     CREATE DATABASE [computer_staging];
END





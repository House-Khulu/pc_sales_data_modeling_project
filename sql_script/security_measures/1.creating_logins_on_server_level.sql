----------------------------------------------------
--Creating logins at server level for the follwoing:
--1.data_engineer_login
--2.sales_manager_login
--3.data_analyst_login
--4.data_scientist_login
----------------------------------------------------


USE [master] 

CREATE LOGIN data_engineer_login WITH PASSWORD = 'StrongPass123!';
CREATE LOGIN sales_manager_login WITH PASSWORD = 'S@l3sM@n@g3r#2025$Y';
CREATE LOGIN data_analyst_login WITH PASSWORD = 'D@t4An@lyst#2025$Z';
CREATE LOGIN data_scientist_login WITH PASSWORD = 'D@t4Sc13nt!st#2025$W';
GO

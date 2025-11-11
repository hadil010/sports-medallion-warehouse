/*
-- =============================================================
-- Create DataWarehouse and Schemas
-- =============================================================
-- Overview:
--     This script builds a new database called 'DataWarehouse'.
--     If it already exists, it will be deleted and created again.
--     After that, three schemas will be set up:
--     bronze, silver, and gold.
--
-- Note:
--     Remove the comment marks below only if you have a backup.
--     Running this will delete everything inside the current
--     'DataWarehouse' database. Proceed carefully.
-- =============================================================

*/


USE MASTER;
GO

--Drop and recreate the Datawarehouse database

IF EXISTS (SELECT 1
FROM sys.databases
WHERE name = 'Datawarehouse')
BEGIN
DROP DATABASE
Datawarehouse
END
GO 


-- Create the 'Datawarehouse' database
CREATE DATABASE Datawarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO


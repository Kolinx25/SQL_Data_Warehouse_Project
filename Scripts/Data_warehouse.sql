/*
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
*/

-- Create Database 'Data_warehouse'
USE master;
GO
--Drop and recreate the database if it already exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Data_warehouse')
BEGIN
    ALTER DATABASE Data_warehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Data_warehouse;
END;
GO

--Create the database and use it
CREATE DATABASE Data_warehouse;
GO
USE Data_warehouse;
GO

--Create Schemas for the Data Warehouse
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
/*
=======================================================================
Script Purpose: Data Warehouse & Medallion Architecture Setup
=======================================================================
Objective: Drops the existing 'DataWarehouse' database (if any) for a 
clean slate, then provisions a new one.

Architecture: Establishes schemas for data progression:
  - [bronze]: Raw, unprocessed source data.
  - [silver]: Cleansed and standardized data.
  - [gold]: Refined, business-ready data for analytics.

WARNING: Destructive script. This will drop the database and erase 
all existing data. Use only for initial setup or dev/test environments.
=======================================================================
*/

USE master;
GO


-- Drop the 'DataWarehouse' database if it already exists
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
Begin
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
End;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO


USE DataWarehouse;
GO

--	Creating Schemas 
CREATE SCHEMA bronze;
GO


CREATE SCHEMA silver;
GO


CREATE SCHEMA gold;
GO

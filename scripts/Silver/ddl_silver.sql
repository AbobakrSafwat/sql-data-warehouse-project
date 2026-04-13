/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Purpose:
    Creates the database tables for the Silver layer. These tables are 
    designed to hold cleansed, standardized, and integrated data from the 
    Bronze layer.

Key Actions:
    - Drops existing tables if they exist (Idempotent execution).
    - Defines explicit data types for CRM and ERP target tables.
    - Adds a default audit column (`dwh_create_date`) to all tables to 
      track when records are inserted into the data warehouse.
===============================================================================
*/


IF OBJECT_ID ('silver.crm_cust_info' , 'U') IS NOT NULL
	DROP TABLE silver.crm_cust_info;
CREATE TABLE silver.crm_cust_info(
cst_id INT,
cst_key VARCHAR(50),
cst_firstname VARCHAR(50),
cst_lastname VARCHAR(50),
cst_marital_status VARCHAR(50),
cst_gndr VARCHAR(50),
cst_create_date DATE,
dwh_create_date DATETIME2 DEFAULT GETDATE(),
);


IF OBJECT_ID ('silver.crm_prd_info' , 'U') IS NOT NULL
	DROP TABLE silver.crm_prd_info;
CREATE TABLE silver.crm_prd_info(
prd_id INT,
cat_id VARCHAR(50),
prd_key VARCHAR(50),
prd_nm VARCHAR(50),
prd_cost INT,
prd_line VARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE,
dwh_create_date DATETIME2 DEFAULT GETDATE(),
);


IF OBJECT_ID ('silver.crm_sales_details' , 'U') IS NOT NULL
	DROP TABLE silver.crm_sales_details;
CREATE TABLE silver.crm_sales_details(
sls_ord_num VARCHAR(50),
sls_prd_key VARCHAR(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT,
dwh_create_date DATETIME2 DEFAULT GETDATE(),
);


IF OBJECT_ID ('silver.erp_CUST_AZ12' , 'U') IS NOT NULL
	DROP TABLE silver.erp_CUST_AZ12;
CREATE TABLE silver.erp_CUST_AZ12(
CID VARCHAR(50),
BDATE DATE,
GEN VARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE(),
);


IF OBJECT_ID ('silver.erp_LOC_A101' , 'U') IS NOT NULL
	DROP TABLE silver.erp_LOC_A101;
CREATE TABLE silver.erp_LOC_A101(
CID VARCHAR(50),
CNTRY VARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE(),
);


IF OBJECT_ID ('silver.erp_PX_CAT_G1V2' , 'U') IS NOT NULL
	DROP TABLE silver.erp_PX_CAT_G1V2;
CREATE TABLE silver.erp_PX_CAT_G1V2(
PX_CAT_G1V2ID VARCHAR(50),
CAT VARCHAR(50),
SUBCAT VARCHAR(50),
MAINTENANCE VARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE(),
);

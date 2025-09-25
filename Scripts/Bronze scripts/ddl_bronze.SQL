/* 

====================================================================================

DDL script: Create Bronze Tables

This script is a stored procedure that will create tables in the bronze schema. It
will drop existing tables if they already exist.

====================================================================================
*/



CREATE OR REPLACE PROCEDURE bronze.load_bronze_data()
LANGUAGE plpgsql
AS $BODY$

	DECLARE 
		start_time TIMESTAMP; 
		end_time TIMESTAMP;	
	BEGIN
	
		RAISE NOTICE '===========================================';
		RAISE NOTICE 'Loading the bronze layer';
		RAISE NOTICE '===========================================';
		
		RAISE NOTICE '-------------------------------------------';
		RAISE NOTICE ' Loading CRM Tables';
		RAISE NOTICE '-------------------------------------------';	
		
		start_time := NOW();		
		RAISE NOTICE '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		RAISE NOTICE '>> Insert Data Into: bronze.crm_cust_info';
		COPY bronze.crm_cust_info
		FROM '/Users/shahzaibchaudry/Documents/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
		DELIMITER ','
		CSV HEADER;
		end_time := NOW();
		RAISE NOTICE 'Load started at: %', start_time;
    	RAISE NOTICE 'Load ended at: %', end_time;
    	RAISE NOTICE 'Duration (seconds): %', EXTRACT(EPOCH FROM (end_time - start_time));		
		
		start_time := NOW();		
		RAISE NOTICE '>> Truncating Table: bronze.crm_prd_info';	
		TRUNCATE TABLE bronze.crm_prd_info;
	
		RAISE NOTICE '>> Insert Data Into: bronze.crm_prd_info';	
		COPY bronze.crm_prd_info
		FROM '/Users/shahzaibchaudry/Documents/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
		DELIMITER ','
		CSV HEADER;
		end_time := NOW();
		RAISE NOTICE 'Load started at: %', start_time;
    	RAISE NOTICE 'Load ended at: %', end_time;
    	RAISE NOTICE 'Duration (seconds): %', EXTRACT(EPOCH FROM (end_time - start_time));		

		start_time := NOW();		
		RAISE NOTICE '>> Truncating Table: bronze.crm_sales_details';	
		TRUNCATE TABLE bronze.crm_sales_details;
	
		RAISE NOTICE '>> Insert Data Into: bronze.crm_sales_details';	
		COPY bronze.crm_sales_details
		FROM '/Users/shahzaibchaudry/Documents/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
		DELIMITER ','
		CSV HEADER;
		end_time := NOW();
		RAISE NOTICE 'Load started at: %', start_time;
    	RAISE NOTICE 'Load ended at: %', end_time;
    	RAISE NOTICE 'Duration (seconds): %', EXTRACT(EPOCH FROM (end_time - start_time));		
	
	
		RAISE NOTICE '-------------------------------------------';
		RAISE NOTICE ' Loading ERP Tables';
		RAISE NOTICE '-------------------------------------------';	

		start_time := NOW();		
		RAISE NOTICE '>> Truncating Table: bronze.erp_cust_az12';	
		TRUNCATE TABLE bronze.erp_cust_az12;
	
		RAISE NOTICE '>> Insert Data Into: bronze.erp_cust_az12';	
		COPY bronze.erp_cust_az12
		FROM '/Users/shahzaibchaudry/Documents/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
		DELIMITER ','
		CSV HEADER;
		
		end_time := NOW();
		RAISE NOTICE 'Load started at: %', start_time;
    	RAISE NOTICE 'Load ended at: %', end_time;
    	RAISE NOTICE 'Duration (seconds): %', EXTRACT(EPOCH FROM (end_time - start_time));	

		start_time := NOW();		
		RAISE NOTICE '>> Truncating Table: bronze.erp_loc_a101';	
		TRUNCATE TABLE bronze.erp_loc_a101;
	
		RAISE NOTICE '>> Insert Data Into: bronze.erp_loc_a101';	
		COPY bronze.erp_loc_a101
		FROM '/Users/shahzaibchaudry/Documents/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
		DELIMITER ','
		CSV HEADER;
		
		end_time := NOW();
		RAISE NOTICE 'Load started at: %', start_time;
    	RAISE NOTICE 'Load ended at: %', end_time;
    	RAISE NOTICE 'Duration (seconds): %', EXTRACT(EPOCH FROM (end_time - start_time));

		start_time := NOW();		
		RAISE NOTICE '>> Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	
		RAISE NOTICE '>> Inserting Data Into: bronze.erp_px_cat_g1v2';	
		COPY bronze.erp_px_cat_g1v2
		FROM '/Users/shahzaibchaudry/Documents/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
		DELIMITER ','
		CSV HEADER;
		
		end_time := NOW();
		RAISE NOTICE 'Load started at: %', start_time;
    	RAISE NOTICE 'Load ended at: %', end_time;
    	RAISE NOTICE 'Duration (seconds): %', EXTRACT(EPOCH FROM (end_time - start_time));
	END;
	
$BODY$;

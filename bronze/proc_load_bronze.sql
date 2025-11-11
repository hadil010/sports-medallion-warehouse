
CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN 
	DECLARE @start_time datetime, @end_time datetime,
	@batch_start_time datetime, @batch_end_time datetime; 
	BEGIN TRY
		set @batch_start_time = GETDATE()
		PRINT '==============================='
		PRINT 'LOADING BRONZE LAYER'
		PRINT '==============================='


		PRINT '-------------------------------'
		PRINT 'LOADING CRM DATA'
		PRINT '-------------------------------'
		SET @start_time = GETDATE();
		PRINT '>> TRUNCATE bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info
		PRINT '>> LOAD bronze.crm_cust_info'
		BULK INSERT 
		bronze.crm_cust_info
		FROM
		'C:\Users\pc\Documents\Projects\Data Warehouse\datasets\source_crm\crm_customer.csv'
		WITH(
			FIRSTROW=2, 
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION:' +cast(DATEDIFF(SECOND, @start_time, @end_time) as nvarchar) + 'seconds'
		PRINT '-------------------------------'
		--TABLE 2 
		SET @start_time = GETDATE()
		PRINT '>> TRUNCATE bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info
		PRINT '>> LOAD bronze.crm_prd_info'
		BULK INSERT 
		bronze.crm_prd_info
		FROM
		'C:\Users\pc\Documents\Projects\Data Warehouse\datasets\source_crm\crm_product.csv'
		WITH(
			FIRSTROW=2, 
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION:' +cast(DATEDIFF(SECOND, @start_time, @end_time) as nvarchar) + 'seconds'
		PRINT '-------------------------------'

		--TABLE 3 
		SET @start_time = GETDATE()
		PRINT '>> TRUNCATE bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details
		PRINT '>> LOAD bronze.crm_sales_details'
		BULK INSERT 
		bronze.crm_sales_details
		FROM
		'C:\Users\pc\Documents\Projects\Data Warehouse\datasets\source_crm\crm_sales.csv'
		WITH(
			FIRSTROW=2, 
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION:' +cast(DATEDIFF(SECOND, @start_time, @end_time) as nvarchar) + 'seconds'
		PRINT '-------------------------------'

		PRINT '-------------------------------'
		PRINT 'LOADING ERP DATA'
		PRINT '-------------------------------'
			--TABLE 4 
		SET @start_time = GETDATE()
		PRINT '>> TRUNCATE bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101
		PRINT '>> LOAD bronze.erp_loc_a101'
		BULK INSERT 
		bronze.erp_loc_a101
		FROM
		'C:\Users\pc\Documents\Projects\Data Warehouse\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW=2, 
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION:' +cast(DATEDIFF(SECOND, @start_time, @end_time) as nvarchar) + 'seconds'
		PRINT '-------------------------------'


			--TABLE 5
		SET @start_time = GETDATE()
		PRINT '>> TRUNCATE bronze.erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12
		PRINT '>> LOAD bronze.erp_cust_az12'
		BULK INSERT 
		bronze.erp_cust_az12
		FROM
		'C:\Users\pc\Documents\Projects\Data Warehouse\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW=2, 
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION:' +cast(DATEDIFF(SECOND, @start_time, @end_time) as nvarchar) + 'seconds'
		PRINT '-------------------------------'


			--TABLE 6
		PRINT '>> TRUNCATE bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2
		PRINT '>> LOAD bronze.erp_px_cat_g1v2'
		SET @start_time= GETDATE()

		BULK INSERT 
		bronze.erp_px_cat_g1v2
		FROM
		'C:\Users\pc\Documents\Projects\Data Warehouse\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW=2, 
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION:' +cast(DATEDIFF(SECOND, @start_time, @end_time) as nvarchar) + 'seconds'
		PRINT '-------------------------------'
		SET @batch_end_time = GETDATE()
		PRINT '>> LOAD BRONZE LAYER DURATION:' +cast(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) as nvarchar) + 'seconds'
		PRINT '-------------------------------'

	END TRY 
	BEGIN CATCH
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'EROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR NUMBER:' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'EROR STATUS' + CAST(ERROR_STATE() AS NVARCHAR); 
	END CATCH 
END


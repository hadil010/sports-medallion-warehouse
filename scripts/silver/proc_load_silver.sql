INSERT INTO silver.crm_cust_info
              ([cst_id]
              ,[cst_key]
              ,[cst_firstname]
              ,[cst_lastname]
              ,[cst_material_status]
              ,[cst_gndr]
              ,[cst_create_date]
                )

SELECT [cst_id]
      ,[cst_key]
      ,trim([cst_firstname])
      ,trim([cst_lastname]) 
      ,CASE WHEN UPPER(TRIM([cst_material_status])) = 'S' THEN 'Single'
            WHEN UPPER(TRIM([cst_material_status])) = 'M' THEN 'Married'
            ELSE 'N/A'
        END [cst_material_status]
      ,CASE WHEN UPPER(TRIM([cst_gndr])) = 'F' THEN 'Female'
            WHEN UPPER(TRIM([cst_gndr])) = 'M' THEN 'Male'
            ELSE 'N/A'
        END cst_gndr
      ,[cst_create_date]
  FROM 
(
        SELECT 
	        *
	        , ROW_NUMBER() OVER(PARTITION BY cst_id order by cst_create_date desc ) as [flaglast] 
        from
        bronze.crm_cust_info
        where [cst_id] is not null
)t where [flaglast] = 1


INSERT INTO [Datawarehouse].[silver].[crm_prd_info]

([prd_id]
      ,[cat_id]
      ,[prd_key]
      ,[prd_nm]
      ,[prd_cost]
      ,[prd_line]
      ,[prd_start_dt]
      ,[prd_end_dt]
 )

SELECT  [prd_id]
      ,REPLACE(SUBSTRING([prd_key],1,5),'-','_') AS CAT_ID
      ,SUBSTRING([prd_key],7,LEN([prd_key])) AS [prd_key]
      ,trim([prd_nm]) as [prd_nm]
      ,isnull([prd_cost],0) as [prd_cost]
      ,CASE WHEN UPPER(TRIM([prd_line])) = 'S' THEN 'Other Sales'
            WHEN UPPER(TRIM([prd_line])) = 'M' THEN 'Mountain'
            WHEN UPPER(TRIM([prd_line])) = 'R' THEN 'Road'
            WHEN UPPER(TRIM([prd_line])) = 'T' THEN 'Touring'
            ELSE 'N/A'
        END AS [prd_line]
      ,CAST([prd_start_dt] AS DATE) AS [prd_start_dt]
      ,CAST(lead([prd_start_dt]) over (partition by [prd_key] order by [prd_start_dt])-1  as DATE) AS [prd_end_dt]
  FROM [Datawarehouse].[bronze].[crm_prd_info]


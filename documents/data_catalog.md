# Gold Layer Data Catalog

## Overview

The Gold Layer is the polished version of the warehouse.  
It brings together the cleaned data from the Silver Layer and reshapes it into business friendly structures.  
Think of it as the final product: easy to query, easy to understand, and ready for dashboards or analytics.  
This catalog lists the main Gold tables and what each field represents.

--------------------------------------------------
Table: gold.dim_customers
--------------------------------------------------

Purpose  
A master list of all customers with cleaned names, standardized attributes, and personal details.  
Used whenever a report needs customer information such as demographics or unique identifiers.

Columns  

1. customer_key  
   Data type: INT  
   Description: Internal key that uniquely identifies each customer row

2. customer_id  
   Data type: INT  
   Description: Customer id exactly as it appears in the original system

3. customer_number  
   Data type: NVARCHAR(50)  
   Description: Reference code used in sales and customer systems

4. first_name  
   Data type: NVARCHAR(50)  
   Description: Customer first name after cleanup

5. last_name  
   Data type: NVARCHAR(50)  
   Description: Customer last name after cleanup

6. country  
   Data type: NVARCHAR(50)  
   Description: Customer country of residence

7. marital_status  
   Data type: NVARCHAR(50)  
   Description: Standardized marital status such as Married or Single

8. gender  
   Data type: NVARCHAR(50)  
   Description: Cleaned gender value based on source codes

9. birthdate  
   Data type: DATE  
   Description: Customer date of birth

10. create_date  
    Data type: DATE  
    Description: When the customer record was first created

--------------------------------------------------
Table: gold.dim_products
--------------------------------------------------

Purpose  
This table describes each product in detail.  
It contains the product name, category, cost, and other attributes that help analysts group or filter products.

Columns  

1. product_key  
   Data type: INT  
   Description: Unique internal key for each product

2. product_id  
   Data type: INT  
   Description: Product id from the source system

3. product_number  
   Data type: NVARCHAR(50)  
   Description: Code that identifies the product in transactions

4. product_name  
   Data type: NVARCHAR(50)  
   Description: Clean and readable product name

5. category_id  
   Data type: NVARCHAR(50)  
   Description: Code representing the product category

6. category  
   Data type: NVARCHAR(50)  
   Description: High level group such as Bikes or Components

7. subcategory  
   Data type: NVARCHAR(50)  
   Description: More specific classification inside the category

8. maintenance_required  
   Data type: NVARCHAR(50)  
   Description: Flag that shows whether the product requires maintenance

9. cost  
   Data type: INT  
   Description: The base cost of the product

10. product_line  
    Data type: NVARCHAR(50)  
    Description: Product line such as Mountain or Road

11. start_date  
    Data type: DATE  
    Description: Date the product became active

--------------------------------------------------
Table: gold.fact_sales
--------------------------------------------------

Purpose  
A detailed table of all sales transactions.  
Each row represents one line item from a customer order and links back to both product and customer dimensions.

Columns  

1. order_number  
   Data type: NVARCHAR(50)  
   Description: Unique identifier for the order

2. product_key  
   Data type: INT  
   Description: Links the sale to the product dimension

3. customer_key  
   Data type: INT  
   Description: Links the sale to the customer dimension

4. order_date  
   Data type: DATE  
   Description: Date when the order was placed

5. shipping_date  
   Data type: DATE  
   Description: Date when the order was shipped

6. due_date  
   Data type: DATE  
   Description: Date payment was expected

7. sales_amount  
   Data type: INT  
   Description: Total value of the sale for that line

8. quantity  
   Data type: INT  
   Description: Units sold for that specific item

9. price  
   Data type: INT  
   Description: Price per unit for the item

##🏗️ Sports Data Warehouse Project – Medallion Architecture

Welcome to the Sports Data Warehouse Project repository!
This project presents the design and implementation of a complete data warehousing and analytics solution built using the Medallion Architecture (Bronze, Silver, Gold) framework.

It walks through the full process — from loading raw business data stored in CSV and Excel files to transforming it into structured, business-ready models that power meaningful insights and dashboards.

🧩 Data Architecture Overview

This warehouse follows the Medallion Architecture concept with three structured layers:

🪙 Bronze Layer – Raw Data

Stores original files exactly as received from operational and customer data systems.

No transformations are applied at this stage.

Serves as the single source of truth for all downstream processes.

⚙️ Silver Layer – Cleaned and Standardized Data

Cleans, validates, and standardizes all fields.

Splits product names into separate attributes (model, color, size).

Removes duplicates and handles missing values.

Establishes consistency and reliability for analytical use.

💎 Gold Layer – Business-Ready Models

Transforms silver data into fact and dimension tables structured in a star schema.

Powers analysis on product performance, sales patterns, and customer behavior.

✅ Optimized for analytical queries and interactive dashboard visualization.

📖 Project Goals and Scope
Objectives

Develop a modern SQL Server–based data warehouse for sports product information.

Design ETL processes that move data from raw files to analytical data models.

Provide reusable, well-documented SQL scripts for each transformation step.

Build reports and dashboards to present insights clearly and effectively.

Data Sources

Operational Data: Product inventory, orders, and sales transactions.

Customer Data: Purchase activity and engagement details.

Supplied as CSV and Excel datasets.

Scope

Focused on sales and product analytics within sports merchandise.

Historical tracking is out of scope for this phase.

Includes comprehensive documentation for data lineage and transformations.

⚙️ ETL and Data Modeling Workflow
Step	Layer	Description	Input	Output	Tools
1	Bronze	Load raw CSV data from business systems	CSV files	Bronze tables	SSMS, Python
2	Bronze	Add metadata columns (load_date, source)	Raw data	Audited tables	SQL
3	Silver	Clean and standardize data	Bronze tables	Cleaned tables	SQL
4	Silver	Parse product names (model, color, size)	Bronze tables	Structured tables	SQL
5	Silver	Remove duplicates and handle nulls	Bronze tables	Quality tables	SQL
6	Gold	Build fact_sales table	Silver tables	Fact table	SQL
7	Gold	Create dimension tables (product, date, category)	Silver tables	Dim tables	SQL
8	Gold	Visualize insights using Power BI	Gold tables	Dashboards	Power BI
🎯 Learning Outcomes

This project showcases complete data engineering and analytics capabilities, including:

SQL Development and Query Optimization

ETL Pipeline Design (Extract, Transform, Load)

Data Modeling (Star Schema, Fact and Dimension Tables)

Data Cleansing and Quality Control

Interactive Dashboard Design with Power BI

Applicable for professionals in:
Data Engineering, Analytics Engineering, Business Intelligence, and Data Analytics.

🛠️ Tools and Technologies

SQL Server Express – Database engine for storage and querying

SQL Server Management Studio (SSMS) – Interface for database management

Draw.io – Used for architecture and data model design

Python (optional) – For automation and data ingestion

Power BI – For dashboard visualization and analytics

GitHub – For version control, collaboration, and documentation

📂 Repository Structure
medallion-sports-warehouse/
│
├── datasets/                       # Raw sports data files
│
├── docs/                           # Documentation and diagrams
│   ├── data_architecture.drawio     # Architecture overview
│   ├── data_flow.drawio             # Data flow diagram
│   ├── data_models.drawio           # Star schema model
│   ├── naming_conventions.md        # Naming and design standards
│   ├── data_catalog.md              # Field descriptions and metadata
│
├── scripts/                        # SQL scripts for ETL and modeling
│   ├── bronze/                     # Load and stage raw data
│   ├── silver/                     # Clean and transform data
│   ├── gold/                       # Analytical model creation
│
├── tests/                          # Data quality checks
│
├── README.md                       # Project overview
└── requirements.txt                 # Optional dependencies

🧠 Key Insights Expected

Product performance by color, size, and category

Year-over-year and seasonal sales trends

Inventory turnover and demand variation

Identification of top-performing product lines

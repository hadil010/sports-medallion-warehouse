## Sports Data Warehouse Project – Medallion Architecture

### Business Context

AdventureWorks Sports is a mid-sized retailer specializing in bicycles, helmets, and sportswear, operating across multiple regions.  
The company’s data was fragmented across sales records, customer spreadsheets, and product lists, making it difficult to monitor performance and forecast demand.  

To overcome this, the analytics team designed and implemented a **modern data warehouse** using the **Medallion Architecture** framework.  
The goal was to unify data from multiple sources, automate data transformation, and deliver actionable insights through SQL-based modeling and Power BI dashboards.  

---

## Project Overview

This project represents a real-world implementation of a **data warehousing and analytics pipeline** built on **SQL Server**.  
It covers the entire lifecycle — from raw data ingestion to business-ready insights.  
The system consolidates operational and customer datasets, ensuring clean, consistent, and analytics-optimized data for decision-making.

The data pipeline is structured into three layers following the **Medallion Architecture** pattern.

---

## Data Architecture

### Bronze Layer – Raw Data

- Stores all source CSV and Excel files exactly as received from business operations.  
- Acts as a historical archive for traceability and auditing.  
- No transformation or filtering is applied at this stage.  

### Silver Layer – Cleaned and Standardized Data

- Performs data cleansing, validation, and standardization.  
- Splits product names into structured fields such as model, color, and size.  
- Resolves missing values, removes duplicates, and enforces data integrity.  
- Creates a unified and trusted dataset for analytical processing.  

### Gold Layer – Business-Ready Models

- Converts standardized Silver data into **fact** and **dimension** tables organized in a **star schema**.  
- Provides business metrics and KPIs on product sales, trends, and customer behavior.  
- Optimized for analytical queries, reporting, and dashboard visualization.  

---

## Project Goals

- Build a scalable SQL Server–based data warehouse for retail sports data.  
- Automate ETL processes that move data through Bronze, Silver, and Gold layers.  
- Establish clear data models and naming conventions.  
- Deliver high-quality analytics and insights via Power BI dashboards.  

---

## Data Sources

The data originates from multiple operational systems and departmental files, including:  
-
-
-

All source data is stored as **CSV and Excel files**.

---

## ETL and Data Modeling Workflow

| Step | Layer  | Description                                       | Input         | Output            | Tools        |
| ---- | ------ | ------------------------------------------------- | ------------- | ----------------- | ------------ |
| 1    | Bronze | Load raw CSV and Excel files into staging tables  | Source files  | Bronze tables     | SSMS, Python |
| 2    | Bronze | Add metadata columns (load_date, file_name)       | Raw data      | Audited tables    | SQL          |
| 3    | Silver | Clean, validate, and standardize columns          | Bronze tables | Cleaned tables    | SQL          |
| 4    | Silver | Parse product names into attributes               | Bronze tables | Structured tables | SQL          |
| 5    | Silver | Remove duplicates and handle missing values       | Bronze tables | Quality tables    | SQL          |
| 6    | Gold   | Create fact_sales table                           | Silver tables | Fact table        | SQL          |
| 7    | Gold   | Build dimension tables (product, date, customer)  | Silver tables | Dim tables        | SQL          |
| 8    | Gold   | Create dashboards for KPIs and performance trends | Gold tables   | Dashboards        | Power BI     |

---

## Business Impact

The data warehouse enables AdventureWorks Sports to:

- Monitor product performance and sales trends across time periods.  
- Identify best-selling products and underperforming categories.  
- Track inventory levels and forecast restocking needs.  
- Understand customer purchasing patterns and seasonal demand.  

These insights support better inventory planning, targeted marketing, and executive decision-making.

---

## Learning Outcomes

This project demonstrates end-to-end capabilities in:

- **SQL Development and Query Optimization**  
- **ETL Pipeline Design (Extract, Transform, Load)**  
- **Data Modeling (Star Schema, Fact and Dimension Tables)**  
- **Data Quality and Validation Techniques**  
- **Business Intelligence and  Reporting**


---

## Tools and Technologies

- **SQL Server Express** – Database engine for data storage and processing  
- **SQL Server Management Studio (SSMS)** – Interface for managing and executing scripts  
- **GitHub** – Version control and collaboration  




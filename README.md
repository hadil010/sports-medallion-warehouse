# Sports Retail Data Warehouse
Medallion Architecture • SQL Server • Data Engineering Project

---

## Project Summary

This project is an end to end data warehouse built for a fictional sports retail business.  
The objective was to combine customer, sales, product, and order data from CRM and ERP systems into a unified, structured warehouse designed for reporting and analytics.

The solution follows the Medallion Architecture (Bronze → Silver → Gold) and demonstrates practical data engineering concepts including data ingestion, data cleaning, transformation, standardization, and dimensional modeling using SQL Server.

This project highlights my ability to design pipelines, apply business rules, create reliable data models, and deliver a complete analytical data product.

---

# Architecture Overview


Below is the architecture diagram for this project:

![Alt Text](https://github.com/hadil010/sports-medallion-warehouse/blob/main/documents/data%20architecture.png)

The warehouse is organized into three layers, each with a specific role in the data life cycle.

---

## Bronze Layer – Raw Data

**Source Systems:**  
CRM and ERP files delivered as CSV and Excel, stored in shared folders and loaded through SQL Server Management Studio.

**Characteristics:**  
- Raw data loaded with no transformations  
- Full Load using Batch Processing  
- Truncate and Insert load pattern  
- Metadata such as load date and file name added  

**Purpose:**  
Serve as the unmodified source-of-truth layer for auditing, rollback, and quality checks.

---

## Silver Layer – Cleaned and Standardized Data

This layer applies all data cleaning and validation logic before business modeling.

**Transformations Performed:**  
1. Data cleaning  
2. Standardization  
3. Normalization  
4. Derived fields  
5. Data enrichment  
6. Duplicate handling  
7. Data validation  

**Data Quality Checks:**  
- Null or duplicate primary keys  
- Inconsistent text formats and extra spaces  
- Invalid or illogical date values  
- Relationship mismatches  
- Data type inconsistencies  

**Purpose:**  
Provide trusted, consistent, and analytics-ready data for the Gold layer.

---

## Gold Layer – Business Ready Models

This layer reshapes cleaned Silver data into fact and dimension tables.

**Modeling Approach:**  
- Star schema  
- Flat presentation views  
- Aggregated KPI tables  
- Business rule application  

**Purpose:**  
Deliver curated, business-friendly datasets optimized for analytics, reporting, KPIs, and dashboarding.

---

# Data Modeling Process

### 1. Conceptual Model  
Identify main business entities and requirements such as Customer, Product, Sales, and Date.

### 2. Logical Model  
Define table relationships, grain, primary keys, surrogate keys, and dimensional structures.

### 3. Physical Model  
Implement schema in SQL Server with correct data types, constraints, indexes, and naming standards; optimize for performance.

---

# ETL Pipeline Summary

| Step | Layer  | Description                     | Input      | Output            | Tools |
|------|--------|---------------------------------|------------|-------------------|-------|
| 1    | Bronze | Load raw files                  | CSV, Excel | Staging tables    | SSMS  |
| 2    | Bronze | Add metadata                    | Raw data   | Audited data      | SQL   |
| 3    | Silver | Clean, validate, normalize      | Bronze     | Clean tables      | SQL   |
| 4    | Silver | Parse attributes, enrich data   | Bronze     | Structured tables | SQL   |
| 5    | Silver | Remove duplicates, fix values   | Bronze     | Trusted data      | SQL   |
| 6    | Gold   | Create fact_sales               | Silver     | Fact table        | SQL   |
| 7    | Gold   | Build dim tables                | Silver     | Dimensions        | SQL   |

---

# Repository Structure
📦 sports-data-warehouse
┣ 📂 bronze
┣ 📂 silver
┣ 📂 gold
┣ 📂 sql_scripts
┣ 📂 documentation
┣ 📄 README.md

# Key Features of This Project

- Fully SQL-driven data pipeline  
- Clear implementation of Medallion Architecture  
- Clean, normalized, enriched data  
- Dimensional modeling using star schema  
- Business-ready fact and dimension tables  
- Documented transformations and validation checks  
- Realistic workflows that match industry standards  

---

# What This Warehouse Enables

- Analysis of customer behavior and profiles  
- Tracking sales across dates, products, and customer segments  
- Product performance evaluation  
- KPI and trend monitoring  
- Power BI or dashboard integration  
- Structured reporting foundation for forecasting  

---

# About Me


Hi, I’m **Hadil**. 😊  
I work in data because I genuinely enjoy it — the challenges, the patterns, the problem-solving, and the satisfaction of turning raw chaos into something clean and meaningful.

I’m always learning and building new things, and I like exploring how data fits together to tell a clear story.  
Projects like this one help me sharpen my skills, experiment with ideas, and push my understanding of real-world data engineering.






## SQL Queries Folder Overview

This directory contains SQL scripts, schema assets, and output datasets for the **"Omnichannel Retail Behaviour and Performance Analytics Dashboard"** project.  

Files are organized to follow a logical execution flow: **Setup ➡️ Analysis ➡️ Output**.



### i_Setup_Scripts
Foundational scripts for database setup, table creation, data validation, and schema visualization.

| File Name                                    | Description                                                  |
|----------------------------------------------|--------------------------------------------------------------|
| [`1_Create_Table_and_Insert_Data.sql`](i_Setup_Scripts/1_Create_Table_and_Insert_Data.sql)           | Creates the schema and loads data into core tables           |
| `2_Data_Cleaning_&_Validation.sql`           | Performs data quality checks and transformation logic        |
| `3_ERD_Retail_Customer_Insights.png`         | Entity Relationship Diagram for schema visualization         |



### ii_Analysis_Queries
Modular SQL queries grouped by dashboard theme. Each file includes business goals, inputs, and outputs.

| File Name                         | Description                                                  |
|-----------------------------------|--------------------------------------------------------------|
| `1_Revenue_Section.sql`           | Revenue metrics, YoY growth, and category breakdowns         |
| `2_Products_Section.sql`          | Product performance, top sellers, and inventory insights     |
| `3_Customers_Section.sql`         | Segmentation, behavior patterns, and retention metrics       |
| `4_Campaigns_Section.sql`         | Campaign ROI, engagement, and conversion analysis            |
| `5_Support_Tickets_Section.sql`   | Ticket volume, resolution time, and satisfaction scores      |



### iii_Output
Exported results from analysis queries for use in dashboards, presentations, or stakeholder reviews.  
Each Excel workbook corresponds to one `.sql` file and contains **multiple sheets (Q1, Q2, …)** for individual business questions.

| File Name                        | Description                                                  |
|----------------------------------|--------------------------------------------------------------|
| `1_Revenue_Output.xlsx`          | Output from `1_Revenue_Section.sql`                          |
| `2_Products_Output.xlsx`         | Output from `2_Products_Section.sql`                         |
| `3_Customers_Output.xlsx`        | Output from `3_Customers_Section.sql`                        |
| `4_Campaigns_Output.xlsx`        | Output from `4_Campaigns_Section.sql`                        |
| `5_SupportTickets_Output.xlsx`   | Output from `5_Support_Tickets_Section.sql`                  |



**Execution Order:**  
1. Run scripts in `i_Setup_Scripts` (in numeric order).  
2. Execute the `.sql` files in `ii_Analysis_Queries` as needed.  
3. Review outputs in `iii_Output` (Excel workbooks with Q-by-Q results).  



## Notes

- All queries are written in **MySQL 8.0** and follow enterprise-grade formatting and documentation standards.  
- Setup scripts are designed for local ingestion using `LOAD DATA INFILE`.  
- ERD diagram provides a visual reference for table relationships and foreign key dependencies.  
- Database schema is named `retail_customer_insights` (implementation), while documentation uses the full project title.  



## 🔗 Related Folders

- [`01_Business_Documents`](../01_Business_Documents/README.md)  

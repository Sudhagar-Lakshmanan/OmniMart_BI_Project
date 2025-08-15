# SQL Queries Folder Overview

This directory contains SQL scripts, schema assets, and output datasets for the **"Omnichannel Retail Behaviour and Performance Analytics Dashboard"** project.  

Files are organized to follow a logical execution flow: **Setup ➡️ Analysis ➡️ Output**.



## i_Setup_Scripts
Foundational scripts for database setup, table creation, data validation, and schema visualization.

| File Name                                    | Description                                                  |
|----------------------------------------------|--------------------------------------------------------------|
| [1_Create_Table_and_Insert_Data.sql](i_Setup_Scripts/1_Create_Table_and_Insert_Data.sql)           | Creates the schema and loads data into core tables           |
| [2_Data_Cleaning_and_Validation.sql](i_Setup_Scripts/2_Data_Cleaning_and_Validation.sql)        | Performs data quality checks and transformation logic        |
| [3_ERD_Retail_Customer_Insights.png](i_Setup_Scripts/3_ERD_Retail_Customer_Insights.png)         | Entity Relationship Diagram for schema visualization         |



## ii_Analysis_Queries
Modular SQL queries grouped by dashboard theme. Each file includes business goals, inputs, and outputs.

| File Name                         | Description                                                  |
|-----------------------------------|--------------------------------------------------------------|
| [1_Revenue_Section.sql](ii_Analysis_Queries/1_Revenue_Section.sql)          | Revenue metrics, YoY growth, and category breakdowns         |
| [2_Products_Section.sql](ii_Analysis_Queries/2_Products_Section.sql)         | Product performance, top sellers, and ratings     |
| [3_Customers_Section.sql](ii_Analysis_Queries/3_Customers_Section.sql)         | Segmentation, behavior patterns, and retention metrics       |
| [4_Campaigns_Section.sql](ii_Analysis_Queries/4_Campaigns_Section.sql)         | Campaign ROI, engagement, and conversion analysis            |
| [5_Support_Tickets_Section.sql](ii_Analysis_Queries/5_Support_Tickets_Section.sql)   | Ticket volume, resolution time, and satisfaction scores      |



## iii_Output
Exported results from analysis queries for use in dashboards, presentations, or stakeholder reviews.  

### Excel Outputs
- Located in the [Excel](iii_Output/Excel) subfolder.  
- Each workbook corresponds to a section and contains **multiple sheets (Q1, Q2, …)** for individual business questions.

### Markdown Outputs
- Each `.md` file corresponds to one `.sql` file and contains Q-by-Q results in lightweight format.

| File Name                        | Description                                                  |
|----------------------------------|--------------------------------------------------------------|
| [1_Revenue_Output.md](iii_Output/1_Revenue_Output.md)          | Output from `1_Revenue_Section.sql`                          |
| [2_Products_Output.md](iii_Output/2_Products_Output.md)         | Output from `2_Products_Section.sql`                         |
| [3_Customers_Output.md](iii_Output/3_Customers_Output.md)        | Output from `3_Customers_Section.sql`                        |
| [4_Campaigns_Output.md](iii_Output/4_Campaigns_Output.md)        | Output from `4_Campaigns_Section.sql`                        |
| [5_Support_Tickets_Output.md](iii_Output/5_Support_Tickets_Output.md)   | Output from `5_Support_Tickets_Section.sql`                  |



## Execution Order:
1. Run scripts in [i_Setup_Scripts](i_Setup_Scripts) (in numeric order).  
2. Execute the `.sql` files in [ii_Analysis_Queries](ii_Analysis_Queries) as needed.  
3. Review outputs in [iii_Output](iii_Output) (Markdown for GitHub browsing, Excel for detailed handover).  



## Notes:

- All queries are written in **MySQL 8.0** and follow enterprise-grade formatting and documentation standards.  
- Setup scripts are designed for local ingestion using `LOAD DATA INFILE`.  
- ERD diagram provides a visual reference for table relationships and foreign key dependencies.  
- Database schema is named `retail_customer_insights` (implementation), while documentation uses the full project title.  



## Related Folders:

- [`01_Business_Documents`](../01_Business_Documents/.README.md)  



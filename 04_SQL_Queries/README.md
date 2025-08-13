## SQL Queries Folder Overview

This directory contains SQL scripts, schema assets, and output datasets for the **"Omnichannel Retail Behaviour and Performance Analytics Dashboard"** project.  

Files are organized to follow a logical execution flow: **Setup ➡️ Analysis ➡️ Output**.



### `i_Setup_scripts`
Foundational scripts for database setup, table creation, data validation, and schema visualization.

| File Name                        | Description                                                  |
|----------------------------------|--------------------------------------------------------------|
| `1_create_tables_insert.sql`     | Creates the schema and loads data into core tables           |
| `2_data_cleaning_validation.sql` | Performs data quality checks and transformation logic        |
| `3_erd.png`                      | Entity Relationship Diagram for schema visualization        |



### `ii_Analysis_queries/`
Modular SQL queries grouped by dashboard theme. Each file includes business goals, inputs, and outputs.

| File Name              | Description                                                  |
|------------------------|--------------------------------------------------------------|
| `1_Revenue.sql`        | Revenue metrics, YoY growth, and category breakdowns         |
| `2_Products.sql`       | Product performance, top sellers, and inventory insights     |
| `3_Customers.sql`      | Segmentation, behavior patterns, and retention metrics       |
| `4_Campaigns.sql`      | Campaign ROI, engagement, and conversion analysis            |
| `5_Support_Tickets.sql`| Ticket volume, resolution time, and satisfaction scores      |



### `iii_Output_CSV/`
Exported results from analysis queries for use in dashboards, presentations, or stakeholder reviews.  
Each CSV directly corresponds to a `.sql` file in `ii_Analysis_queries/`.

| File Name               | Description                                                  |
|-------------------------|--------------------------------------------------------------|
| `1_Revenue.csv`         | Output from `1_Revenue.sql`                                  |
| `2_Products.csv`        | Output from `2_Products.sql`                                 |
| `3_Customers.csv`       | Output from `3_Customers.sql`                                |
| `4_Campaigns.csv`       | Output from `4_Campaigns.sql`                                |
| `5_Support_Tickets.csv` | Output from `5_Support_Tickets.sql`                          |



**Execution Order:**  
1. Run scripts in `i_Setup_scripts/` (in numeric order).  
2. Execute the `.sql` files in `ii_Analysis_queries/` as needed.  
3. Review outputs in `iii_Output_CSV/` or use them for visualization.


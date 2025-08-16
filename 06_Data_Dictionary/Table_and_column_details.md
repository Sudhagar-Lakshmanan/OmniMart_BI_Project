# Data Dictionary

This folder contains the **data dictionary** for the project, outlining the structure, fields, and metadata of all datasets used in the analysis and Power BI dashboard.  

The source data is from **Kaggle:** [Retail Customer and Transaction Dataset](https://www.kaggle.com/datasets/raghavendragandhi/retail-customer-and-transaction-dataset?select=customer_reviews_complete.csv).

---

## 1. Customers  
Contains demographic and basic registration information about each customer.  

- **Rows:** 5,000  
- **Columns:** 12  

| Column Name       | Data Type | Description |
|-------------------|-----------|-------------|
| Customer ID       | int/string | Unique identifier for each customer |
| Full Name         | string    | Full name of the customer |
| Age               | int       | Age of the customer |
| Gender            | string    | Gender (e.g., Male, Female, Other) |
| Email             | string    | Email address |
| Phone             | string    | Phone number |
| Street Address    | string    | Street address |
| City              | string    | City of residence |
| State             | string    | State of residence |
| Zip Code          | string    | Postal code |
| Registration Date | date      | Date the customer registered |
| Preferred Channel | string    | Preferred communication channel (e.g., Email, SMS, Phone) |

---

## 2. Transactions  
Includes purchase information for products bought by customers.  

- **Rows:** 32,295  
- **Columns:** 10  

| Column Name       | Data Type | Description |
|-------------------|-----------|-------------|
| Transaction ID    | int       | Unique ID for each transaction |
| Customer ID       | int/string | Links to `Customers.CustomerID` |
| Product Name      | string    | Purchased product name |
| Product Category  | string    | Category of the product |
| Quantity          | int       | Units purchased |
| Price             | float     | Price per unit |
| Transaction Date  | date      | Date of transaction |
| Store Location    | string    | Physical store or "Online" |
| Payment Method    | string    | Payment method (e.g., Credit Card, PayPal, Cash) |
| Discount Applied  | float/int | Discount amount or percentage applied |

---

## 3. Interactions  
Captures various interactions customers have with the company’s digital channels.  

- **Rows:** 100,000  
- **Columns:** 8  

| Column Name       | Data Type | Description |
|-------------------|-----------|-------------|
| Interaction ID    | int       | Unique ID for each interaction |
| Customer ID       | int/string | Links to `Customers.CustomerID` |
| Channel           | string    | Channel (e.g., Website, Mobile App, Social Media) |
| Interaction Type  | string    | Type of interaction (e.g., View Product, Add to Cart, Click Ad) |
| Interaction Date  | date      | Date of interaction |
| Duration          | int/float | Duration of interaction (seconds/minutes) |
| Page or Product   | string    | Page visited or product related to interaction |
| Session ID        | string    | Identifier for multi-action sessions |

---

## 4. Campaigns  
Details about marketing or advertising campaigns.  

- **Rows:** 200  
- **Columns:** 12  

| Column Name       | Data Type | Description |
|-------------------|-----------|-------------|
| Campaign ID       | int       | Unique campaign identifier |
| Campaign Name     | string    | Name/title of the campaign |
| Campaign Type     | string    | Campaign type (e.g., Email, Social Media, TV Ad) |
| Start Date        | date      | Launch date of the campaign |
| End Date          | date      | Completion date |
| Target Segment    | string    | Target audience/segment |
| Budget            | float     | Campaign budget |
| Impressions       | int       | Number of impressions |
| Clicks            | int       | Number of clicks |
| Conversions       | int       | Number of conversions (sign-ups/purchases) |
| Conversion Rate   | float     | % of impressions converted |
| ROI               | float     | Return on investment |

---

## 5. Customer Reviews  
Collection of product reviews submitted by customers post-purchase.  

- **Rows:** 1,000  
- **Columns:** 10  

| Column Name       | Data Type | Description |
|-------------------|-----------|-------------|
| Review ID         | int       | Unique identifier for each review |
| Customer ID       | int/string | Links to `Customers.CustomerID` |
| Product Name      | string    | Reviewed product name |
| Product Category  | string    | Category of the reviewed product |
| Full Name         | string    | Customer name (may be anonymized) |
| Transaction Date  | date      | Date of the related transaction |
| Review Date       | date      | Date the review was posted |
| Rating            | int       | Rating (1–5 stars) |
| Review Title      | string    | Short summary of the review |
| Review Text       | string    | Full review content |

---

## 6. Support Tickets  
Tracks customer support interactions and resolution details.  

- **Rows:** 3,000  
- **Columns:** 10  

| Column Name               | Data Type | Description |
|----------------------------|-----------|-------------|
| Ticket ID                  | int       | Unique ID for each ticket |
| Customer ID                | int/string | Links to `Customers.CustomerID` |
| Issue Category             | string    | General issue type (e.g., Billing, Product Defect, Returns) |
| Priority                   | string    | Priority (Low, Medium, High) |
| Submission Date            | date      | Ticket submission date |
| Resolution Date            | date      | Ticket resolution date |
| Resolution Status          | string    | Status (Open, Closed, Pending) |
| Resolution Time Hours      | float     | Time taken to resolve (hours) |
| Customer Satisfaction Score| int/float | Post-resolution satisfaction rating (1–5) |
| Notes                      | string    | Additional remarks from support agents |

---

## Notes
- All datasets are linked through **Customer ID** as the primary key.  
- This dictionary serves as a reference for SQL queries, Power BI modeling, and analytical workflows in the project.  

---

## Entity Relationship Diagram (ERD)

Below is the ERD showing relationships between all datasets used in this project:

![ERD](../../04_SQL_Queries/i_Setup_scripts/3_erd.png)


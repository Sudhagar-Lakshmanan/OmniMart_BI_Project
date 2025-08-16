# 📊 Omnichannel Retail Behaviour and Performance Analytics Dashboard

This repository showcases a comprehensive analytics solution for a fictional retail company, **OmniMart Pvt Ltd**, designed to analyze customer behavior, campaign performance, and operational KPIs across multiple channels.

It includes business documentation, process flows, wireframes, SQL logic, Power BI dashboards, data dictionary, UAT artifacts, and executive summaries — all structured for clarity, traceability, and stakeholder usability.

---

## 🏢 Branding & Stakeholder Disclaimer

- All company names, stakeholder personas, and branding elements in this repository are **fictional** and used solely for illustrative purposes.
- The logo and visual assets are **AI-generated** to simulate a realistic enterprise environment.
- No real individuals, organizations, or proprietary data are represented.

---

## 📑 Table of Contents  
1. [Project Overview](#project-overview)  
2. [Business Objectives](#business-objectives)  
3. [Data Source & Processing](#data-source--processing)  
4. [Workflow & Approach](#workflow--approach)  
5. [Tools Used](#tools-used)  
6. [Preview](#preview)  
   - [Process Flow Diagrams](#process-flow-diagrams)  
   - [Wireframes](#wireframes)  
7. [Key Insights](#key-insights)  
8. [Recommendations](#recommendations)  
9. [Action Plan](#action-plan)  
10. [Repository Structure](#repository-structure)  
11. [Documentation](#documentation)  
12. [Next Steps](#next-steps)  

---

## 📖 Project Overview  
This analysis was conducted as part of a **business intelligence initiative** to evaluate the omnichannel retail behavior and performance of a fictional retail brand **OmniMart Pvt Ltd** over the period **March 2020 – March 2025**.  

The objective was to uncover **actionable insights** and opportunities across five key business areas:  
- **Revenue**  
- **Products**  
- **Customers**  
- **Campaigns**  
- **Support Operations**  

The outcome is a fully documented **Power BI dashboard**, complemented by **SQL-based data transformations** and **business documentation (BRD, UAT, Executive Summary)**.  

---

## 🎯 Business Objectives  
OmniMart aims to achieve the following with the Power BI Dashboard:  

1. **Accelerate Decision-Making** – Deliver real-time, actionable insights to executives, managers, and analysts.  
2. **Unify Omnichannel Performance Visibility** – Integrate offline and online performance into one reporting system.  
3. **Enhance Customer Engagement & Retention** – Track churn, campaign response, CSAT, and SLA metrics.  
4. **Foster Accountability** – Provide role-based access to tailored dashboards for stakeholders.  
5. **Support Operational Efficiency** – Replace manual reporting with automated dashboards powered by SQL + Power BI.  

---

## 📊 Data Source & Processing  

### Source  
- **Platform**: [Kaggle – Retail Customer & Transaction Dataset](https://www.kaggle.com/)  
- **Period Covered**: March 2020 – March 2025  
- **Files Used**:  
  - `Customers.csv`  
  - `Transactions.csv`  
  - `Interactions.csv`  
  - `Campaigns.csv`  
  - `Customer Reviews.csv`  
  - `Support Tickets.csv`  

### Data Preparation & Cleaning  
- Verified file structures and column definitions.  
- Fixed missing values (dates, budgets, ratings, product names).  
- Removed duplicates & validated formats (emails, phone numbers).  
- Standardized categorical values (location formats, product categories).  
- Imported into **MySQL** for structured cleaning and transformations.  
- Recalculated and validated campaign KPIs.  

---

## ⚙️ Workflow & Approach  

1. Requirement Gathering (sample request email).  
2. BRD creation (objectives, KPIs, user stories, use cases).  
3. Process Mapping (current & future state in Lucidchart).  
4. Wireframes (Balsamiq).  
5. Analysis Question Framework (26 business questions).  
6. Data Cleaning & Preparation (SQL).  
7. SQL Development (26 queries aligned to KPIs).  
8. Power BI Dashboard Development (DAX measures, modeling, slicers, drill-through).  
9. UAT (plan, test cases, defect tracker, sign-off).  
10. Delivery (final dashboard + supporting docs).  

---

## 🛠️ Tools Used  
- **MySQL** – Data storage, cleaning, KPI transformations  
- **Excel** – Initial profiling, UAT documentation  
- **Lucidchart** – Process flow diagrams  
- **Balsamiq** – Wireframes  
- **Power BI** – Dashboard development (DAX, visuals, interactions)  
- **MS Word / PowerPoint** – Documentation & executive summary  

---

## 👀 Preview  

### Process Flow Diagrams  
| Current State (As-Is) | Future State (To-Be) | Reporting Workflow |  
|-----------------------|----------------------|-------------------|  
| ![Process1](images/process1.png) | ![Process2](images/process2.png) | ![Process3](images/process3.png) |  

### Wireframes  
| Summary | Overview | Revenue |  
|---------|----------|---------|  
| ![Wireframe1](images/wireframe1.png) | ![Wireframe2](images/wireframe2.png) | ![Wireframe3](images/wireframe3.png) |  

| Products | Customers | Campaigns |  
|----------|-----------|-----------|  
| ![Wireframe4](images/wireframe4.png) | ![Wireframe5](images/wireframe5.png) | ![Wireframe6](images/wireframe6.png) |  

| Support Tickets |  
|-----------------|  
| ![Wireframe7](images/wireframe7.png) |  

---

## 📌 Key Insights (Overall)  

1. **Gross Revenue** before discounts: **$27.79M**; after discounts: **$27.55M**.  
2. **Furniture** category generated the highest revenue: **$6.1M**.  
3. **Google Nest** was the top-selling item with **1,359 units sold**.  
4. **California** led with **873 customers** out of 5,000.  
5. **Search Engine Marketing** campaigns delivered the highest ROI: **$162.64K**.  
6. **Shipping issues** dominated support tickets (436 tickets, avg. closure 37.67 hrs, CSAT 3.52).  
7. Net customer retention rate stood at **27.86%**, with churn at **28.6%** over 6 months.  

---

## 📈 Recommendations  

### Revenue  
- Focus marketing efforts on **Furniture, Smartphones, Laptops**.  
- Capitalize on **Nov–Dec surges** with bundled promotions.  
- Promote **credit card payments** ($9.38M revenue contribution).  
- Boost underperforming states like **Florida & Colorado** with location-specific campaigns.  

### Products  
- Increase stock for bestsellers (Bed Frame, Office Desk, Sofa).  
- Expand **Smart Home Devices & Smartphones** campaigns.  
- Reposition/clearance for low-volume items (Bedding, Tablets, Accessories).  

### Customers  
- Reduce churn in **26–35** and **50+** segments via reactivation offers.  
- Boost LTV from **female 36–50** and **male 26–50** segments.  
- Engage VIP spenders with **exclusive loyalty programs**.  

### Campaigns  
- Prioritize **SEM & Email** (high ROI).  
- Optimize underperforming channels (Display, Social Media).  
- Use **A/B testing + retargeting**.  

### Support  
- Scale support capacity (ticket volume rising since mid-2023).  
- Improve **first-contact resolution** and **triaging**.  
- Escalation protocols to reduce “Closed Without Resolution” cases.  

---

## 🚀 Action Plan  

1. **Revenue Strategy** – Focus on high-performing states & seasonal promos.  
2. **Product Mix Optimization** – Increase inventory for high-margin SKUs.  
3. **Customer Segmentation** – Tailored campaigns for churn-prone & high-value groups.  
4. **Campaign Refinement** – Shift budget to **SEM, Email, In-store promotions**.  
5. **Support Process Improvement** – Automate low-priority tickets, improve SLAs.  

---

## 📂 Repository Structure  


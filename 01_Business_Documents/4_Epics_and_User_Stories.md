# Epics and User Stories with Acceptance Criteria  
*(Extracted from Business Requirements Document — BRD)*  

This document captures the high-level **Epics** and detailed **User Stories with Acceptance Criteria** that guide the design and implementation of the Power BI dashboard solution.  

---

## Epics  

| Epic ID | Epic Name                        | Description                                                                 |
|---------|----------------------------------|-----------------------------------------------------------------------------|
| EP-01   | Executive Overview & KPIs        | Track top-level business performance through KPIs and trends.               |
| EP-02   | Sales & Regional Performance     | Analyse revenue by region and product for sales optimization.               |
| EP-03   | Marketing Campaign Insights      | Evaluate campaign ROI and marketing performance across channels.            |
| EP-04   | Customer & Support Operations    | Monitor ticket volumes, SLAs, customer insights and high-value customers to improve CX. |
| EP-05   | Dashboard Governance & Usability | Ensure data usability, consistency and maintainability of dashboards.       |
| EP-06   | Data Infrastructure & Refresh    | Provide clean, secure and updated datasets for reliable dashboards.         |

---

## User Stories with Acceptance Criteria  

| Epic ID | User Story ID | User Story | Acceptance Criteria |
|---------|---------------|------------|---------------------|
| EP-01 | US-01 | As a Project Sponsor, I want to view key KPIs (total revenue, active customers, ROI) on the Overview page so that I can evaluate business performance at a glance. | Given I access the Overview page, when the page loads, then I should see KPI cards for Total Revenue, Active Customers and ROI. |
| EP-01 | US-02 | As a Project Sponsor, I want to filter data by year, quarter, or month so that I can compare performance trends across different time periods. | Given the Overview page is open, when I select a filter option (Year, Quarter, or Month), then the data on all visuals updates accordingly. |
| EP-01 | US-03 | As a Project Sponsor, I want to monitor churn rate in different age groups so that I can analyse customer churn. | Given I view the Overview page, when I look at the customer KPIs, then I should see related charts and tooltip insights for churn count. |
| EP-01 | US-04 | As Deepa Menon, I want to access the Summary and Overview page with key visuals on revenue, campaign and churn so that I can validate strategic performance outcomes prior to final approval. | Given I open the Summary and Overview page, when I view all relevant visuals and KPIs, then I can assess alignment with strategic goals for final approval. |
| EP-02 | US-05 | As a Sales Manager, I want to view revenue trends by product category over time so that I can identify top-performing categories and adjust stock or promotions. | Given the category revenue visual is loaded, when I select a time range, then I see revenue by category with dynamic sorting and tooltip metrics. |
| EP-02 | US-06 | As a Sales Manager, I want to compare regional performance for top products so that I can optimize marketing spend and resource distribution. | Given the regional comparison visual is loaded, when I filter by region or product, then the visual ranks products by revenue and highlights top-performing regions. |
| EP-02 | US-07 | As a Sales Manager, I want to view Year-over-Year revenue growth by month so that I can detect seasonal patterns and measure business momentum. | Given the YoY Revenue visual is loaded, when I select a year or month, then I see current and previous year's revenue and % change. |
| EP-02 | US-08 | As a Sales Manager, I want to identify top revenue-generating products so that I can spotlight high-performing items. | Given I open the Top Products chart, when the report loads, then I see product names and net revenue, ranked by top 10. |
| EP-02 | US-09 | As a Sales Manager, I want to track average product ratings so that I can correlate customer satisfaction with revenue performance. | Given the ratings chart is available, when I sort products, then I see product names with corresponding average rating. |
| EP-03 | US-10 | As a Marketing Analyst, I want to monitor campaign ROI and conversion rate so that I can evaluate campaign effectiveness. | Given I view the Campaign page, when I access campaign visuals, then ROI and conversion rate are shown in tables or charts. |
| EP-03 | US-11 | As a Marketing Analyst, I want to drill down into campaign performance by type and name so that I can optimize future marketing spend. | Given I select a campaign type or name, when I drill through the visual, then detailed breakdowns should be shown by that category. |
| EP-03 | US-12 | As a Marketing Analyst, I want to compare user interaction, session duration and purchase actions across channels so that I can identify high-performing touchpoints. | Given I open the channel performance visual, when I compare metrics, then I should see session duration, bounce rate and purchases by channel. |
| EP-03 | US-13 | As a Marketing Analyst, I want to track peak purchase hours so that I can schedule campaigns effectively. | Given I view the hourly sales chart, when I analyse peak hours, then hourly trends should clearly highlight peak purchase times. |
| EP-03 | US-14 | As a Marketing Analyst, I want to analyse ROI efficiency by target segment so that I can optimize targeting. | Given I apply segment filters, when I view the ROI visuals, then ROI is displayed per segment using scatter/bar charts. |
| EP-04 | US-15 | As a Support Manager, I want to monitor total support ticket volume and trends over time so that I can manage staffing needs. | Given I view the Support page, when the trend chart loads, then it displays ticket volume over time with comparison periods. |
| EP-04 | US-16 | As a Support Manager, I want to analyse ticket resolution time buckets so that I can identify SLA breaches. | Given ticket resolution data is loaded, when I view the chart, then tickets are segmented into time buckets (e.g. 0-24h, 24-48h). |
| EP-04 | US-17 | As a Support Manager, I want to compare average ticket resolution time, satisfaction scores and volume across parameters so that I can identify service improvement areas. | Given the multi-metric visual loads, when I compare agents or teams, then I see grouped averages by parameter. |
| EP-04 | US-18 | As a Support Manager, I want to break down ticket data by priority, resolution status and issue category so that I can manage performance at a detailed level. | Given support data is loaded, when I interact with filters, then visuals update by issue category, resolution and priority. |
| EP-04 | US-19 | As a Support Manager, I want to analyse repeat purchase behaviour by preferred channel so that I can identify which touchpoints drive customer retention. | Given I access the Customers page, when I view the Repeat Purchase visual, then I see repeat customer counts and rates by preferred channel. |
| EP-04 | US-20 | As a Support Manager, I want to identify high-value customers so that I can prioritize them for service and retention efforts. | Given the high-spend data is available, when I view the Top Customers visual, then I see names and revenue totals for the top 10 spenders. |
| EP-04 | US-21 | As a Support Manager, I want to detect high-risk churn segments by age and channel so that I can initiate proactive retention measures. | Given churn data is based on last purchase dates, when I view the segment breakdown visual, then I see churn rates by age group and preferred channel. |
| EP-05 | US-22 | As a Business Intelligence Analyst, I want to define KPIs and dimensions for each dashboard page so that reporting aligns with stakeholder needs. | Given I am drafting report specs, when I define page-level metrics, then documentation reflects stakeholder-aligned KPIs. |
| EP-05 | US-23 | As a Business Intelligence Analyst, I want to validate filters, slicers and drilldowns so that I ensure dashboard usability and flexibility. | Given dashboard elements are built, when I run a QA checklist, then all slicers, filters and drilldowns must work as expected. |
| EP-05 | US-24 | As a Business Intelligence Analyst, I want to document all visuals and calculations so that they can be easily maintained and scaled. | Given visuals and DAX are finalized, when I create metadata, then it should cover all calculated fields and chart types. |
| EP-06 | US-25 | As a Data Engineer, I want to provide clean, joined SQL datasets and schema views so that dashboards load efficiently. | Given Power BI model is built, when data is refreshed, then it uses cleaned and joined staging tables for performance. |
| EP-06 | US-26 | As a Data Engineer, I want to schedule data refreshes regularly so that stakeholders always see up-to-date information. | Given the report is deployed, when a new day/hour begins, then data should be auto-refreshed and logged successfully. |
| EP-06 | US-27 | As a Data Engineer, I want to apply role-level security if needed so that users see only relevant data. | Given user roles are mapped, when I set RLS rules, then access is restricted as per user role in Power BI. |

---


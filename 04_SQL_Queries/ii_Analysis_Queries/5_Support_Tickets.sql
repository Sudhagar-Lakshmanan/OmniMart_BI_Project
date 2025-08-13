-- ******************************************
-- Section 5 – Support Tickets
-- ******************************************

-- Q22: Resolution Time Distribution Buckets
-- Purpose: Understand how quickly tickets are resolved by grouping into time bands.
-- Inputs: support_tickets (resolution_time_hours)
-- Output: Resolution Time Bucket, Ticket Count
-- Notes: Buckets are 0–12 hrs, 12–24 hrs, 24–48 hrs, and 48+ hrs.

SELECT
    CASE 
        WHEN resolution_time_hours BETWEEN 0 AND 12 THEN '0–12 hrs'
        WHEN resolution_time_hours BETWEEN 13 AND 24 THEN '12–24 hrs'
        WHEN resolution_time_hours BETWEEN 25 AND 48 THEN '24–48 hrs'
        ELSE '48+ hrs'
    END AS resolution_bucket,
    COUNT(*) AS ticket_count
FROM 
    support_tickets
GROUP BY
    resolution_bucket
ORDER BY 
    resolution_bucket
;







-- Q23: Monthly Support Performance Trends
-- Purpose: Track ticket volume, resolution efficiency, and satisfaction trends over time.
-- Inputs: support_tickets (submission_date, resolution_time_hours, customer_satisfaction_score)
-- Output: Year, Month, Total Tickets, Avg Resolution Hours, Avg CSAT
-- Notes: Groups by calendar month for trend analysis.

SELECT
    YEAR(submission_date)                      AS ticket_year,
    MONTH(submission_date)                     AS ticket_month,
    COUNT(*)                                   AS total_tickets,
    ROUND(AVG(resolution_time_hours), 2)       AS avg_resolution_hrs,
    ROUND(AVG(customer_satisfaction_score), 2) AS avg_cs_score
FROM 
    support_tickets
GROUP BY 
    ticket_year, ticket_month
ORDER BY 
    ticket_year, ticket_month
;







-- Q24: Ticket Metrics by Issue Category
-- Purpose: Compare ticket volume, resolution speed, and satisfaction across categories.
-- Inputs: support_tickets (issue_category, resolution_time_hours, customer_satisfaction_score)
-- Output: Issue Category, Total Tickets, Avg Resolution Hours, Avg CSAT
-- Notes: Orders by total ticket volume to highlight top issues.

SELECT
    issue_category,
    COUNT(*)                                  AS total_tickets,
    ROUND(AVG(resolution_time_hours), 2)      AS avg_resolution_hrs,
    ROUND(AVG(customer_satisfaction_score),2) AS avg_cs_score
FROM 
    support_tickets
GROUP BY 
    issue_category
ORDER BY 
    total_tickets DESC
;







-- Q25: Priority-Wise Ticket Metrics
-- Purpose: Assess workload and outcomes based on ticket priority.
-- Inputs: support_tickets (priority, resolution_time_hours, customer_satisfaction_score)
-- Output: Priority, Total Tickets, Avg Resolution Hours, Avg CSAT
-- Notes: FIELD() used to ensure High, Medium, Low, Unknown ordering.

SELECT
    priority,
    COUNT(*)                                  AS total_tickets,
    ROUND(AVG(resolution_time_hours), 2)      AS avg_resolution_hrs,
    ROUND(AVG(customer_satisfaction_score),2) AS avg_cs_score
FROM 
    support_tickets
GROUP BY 
    priority
ORDER BY
    FIELD(priority, 'High', 'Medium', 'Low', 'Unknown')
;







-- Q26: Resolution Status Breakdown
-- Purpose: Evaluate effectiveness by looking at resolution status statistics.
-- Inputs: support_tickets (resolution_status, resolution_time_hours, customer_satisfaction_score)
-- Output: Resolution Status, Total Tickets, Avg Resolution Hours, Avg CSAT
-- Notes: Orders by ticket count to focus on most common statuses.

SELECT
    resolution_status,
    COUNT(*)                                  AS total_tickets,
    ROUND(AVG(resolution_time_hours), 2)      AS avg_resolution_hrs,
    ROUND(AVG(customer_satisfaction_score),2) AS avg_cs_score
FROM 
    support_tickets
GROUP BY 
    resolution_status
ORDER BY 
    total_tickets DESC
;








-- ******************************************
-- End of Section 5 – Support Tickets
-- ******************************************
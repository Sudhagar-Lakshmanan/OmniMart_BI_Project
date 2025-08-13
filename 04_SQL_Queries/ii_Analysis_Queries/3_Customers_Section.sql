-- **********************************************
-- Section 3 – Customer Segmentation & Retention
-- **********************************************

-- Q11: Repeat Customers Count by Preferred Channel
-- Purpose: See which communication channels build stronger customer loyalty.
-- Inputs: customers (customer_id, preferred_channel), transactions (transaction_id, customer_id)
-- Output: Preferred Channel, Repeat Customers Count, Repeat Purchase Rate (%)
-- Notes: Considers a "repeat customer" as one with more than 1 transaction.

WITH customer_metrics AS (
    SELECT
        c.customer_id,        
        c.preferred_channel,
        COUNT(t.transaction_id) AS txn_count
    FROM 
        customers c
    LEFT JOIN 
        transactions t ON c.customer_id = t.customer_id
    GROUP BY 
        c.customer_id, c.preferred_channel
)
SELECT
    preferred_channel,
    COUNT(CASE WHEN txn_count > 1 THEN 1 END) AS repeat_customers,
    ROUND(100 * COUNT(CASE WHEN txn_count > 1 THEN 1 END) / COUNT(customer_id), 2) AS repeat_purchase_rate
FROM 
    customer_metrics
GROUP BY 
    preferred_channel
;







-- Q12: Top Spend by Age & Gender
-- Purpose: Identify which demographic segments generate the most revenue.
-- Inputs: customers (customer_id, gender, age), transactions (customer_id, price, discount_applied, quantity)
-- Output: Gender, Age Group, Net Revenue
-- Notes: Categorizes customers into age groups and sums net revenue.

SELECT
    gender,
    CASE 
        WHEN age IS NULL THEN 'Unknown'
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END AS age_group,
    ROUND(SUM((price - discount_applied) * quantity), 2) AS net_revenue
FROM
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
GROUP BY 
    gender, age_group
ORDER BY
    net_revenue DESC
;







-- Q13: Top 10 Customers by Revenue
-- Purpose: Highlight individual customers with the highest spending.
-- Inputs: transactions (customer_id, price, discount_applied, quantity), customers (customer_id, full_name)
-- Output: Customer ID, Full Name, Net Revenue
-- Notes: Uses DENSE_RANK() to include ties; useful for loyalty programs.

WITH customer_revenue AS (
    SELECT
        customer_id,
        ROUND(SUM((price - discount_applied) * quantity), 2) AS net_revenue
    FROM 
        transactions
    GROUP BY 
        customer_id
),
ranked_customers AS (
    SELECT
        customer_id,
        net_revenue,
        DENSE_RANK() OVER (ORDER BY net_revenue DESC) AS revenue_rank
    FROM 
        customer_revenue
)
SELECT
    r.customer_id,
    c.full_name,
    ROUND(net_revenue, 2) AS revenue
FROM 
    ranked_customers r
JOIN 
    customers c ON r.customer_id = c.customer_id
WHERE 
    revenue_rank <= 10
;







-- Q14: Customer Distribution by Region
-- Purpose: Understand where customers live and how much they spend.
-- Inputs: customers (customer_id, state), transactions (customer_id, price, discount_applied, quantity)
-- Output: State, Total Customers, Net Revenue, Average Order Value
-- Notes: Uses LEFT JOIN to include customers with no transactions.

SELECT 
    c.state,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    ROUND(SUM((price - discount_applied) * quantity), 2) AS net_revenue,
    ROUND(AVG(price * quantity), 2) AS avg_order_value
FROM 
    customers c
LEFT JOIN 
	transactions t ON c.customer_id = t.customer_id
GROUP BY 
    state
ORDER BY 
    net_revenue DESC
;







-- Q15: High-Risk Churn Segments
-- Purpose: Detect customer segments most likely to churn based on age and preferred channel.
-- Inputs: customers (customer_id, age, preferred_channel), transactions (customer_id, transaction_date)
-- Output: Age Group, Total Customers, Churned Customers, Churn Rate (%)
-- Notes: Defines churn as inactivity in the last 6 months relative to the most recent transaction date.

WITH last_transactions AS (
    SELECT 
        c.customer_id,
        c.age,
        c.preferred_channel,
        MAX(t.transaction_date) AS last_purchase
    FROM 
       customers c
    LEFT JOIN 
       transactions t ON c.customer_id = t.customer_id
    GROUP BY 
       c.customer_id, c.age, c.preferred_channel
),
max_txn_date AS (
    SELECT 
        MAX(transaction_date) AS max_date
    FROM 
        transactions
),
churned_count AS (
    SELECT 
        CASE 
            WHEN age IS NULL THEN 'Unknown'
            WHEN age < 18 THEN 'Under 18'
            WHEN age BETWEEN 18 AND 25 THEN '18-25'
            WHEN age BETWEEN 26 AND 35 THEN '26-35'
            WHEN age BETWEEN 36 AND 50 THEN '36-50'
            ELSE '50+'
        END AS age_group,
        COUNT(*) AS total_customers,
        SUM(CASE 
                WHEN last_purchase IS NULL OR last_purchase < (SELECT max_date FROM max_txn_date) - INTERVAL 6 MONTH THEN 1 ELSE 0 
            END
            ) AS churned_customers
    FROM 
        last_transactions
    GROUP BY 
        age_group
)
SELECT
    age_group, 
    total_customers,
    churned_customers,
    ROUND((churned_customers / total_customers) * 100, 2) AS churn_rate_pct
FROM 
    churned_count
ORDER BY 
    age_group
;






-- *****************************************************
-- End of Section 3 – Customer Segmentation & Retention
-- *****************************************************









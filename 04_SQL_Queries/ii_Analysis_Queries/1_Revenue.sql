-- ******************************************
-- Section 1 – Revenue Performance Analysis
-- ******************************************

-- Q01: Revenue Summary Metrics
-- Purpose: Track total revenue before and after discounts to reveal the true earning impact.
-- Inputs: transactions (price, quantity, discount_applied)
-- Output: Gross Revenue, Net Revenue, Discount Impact
-- Notes: Rounds results to 2 decimal places for currency formatting.

SELECT 
    ROUND(SUM(price * quantity), 2) AS gross_revenue,
    ROUND(SUM((price - discount_applied) * quantity), 2) AS net_revenue,
    ROUND(SUM(discount_applied * quantity), 2) AS discount_impact
FROM 
    transactions
;







-- Q02: Year-over-Year Revenue Growth
-- Purpose: Track monthly revenue trends to assess business momentum and seasonal patterns.
-- Inputs: transactions (transaction_date, price, discount_applied, quantity)
-- Output: Year, Month, Net Revenue, Previous Year Revenue, YoY Growth %
-- Notes: Uses LAG() to align months year-over-year; NULLIF prevents divide-by-zero errors.

WITH rev_yearly AS (
    SELECT
        YEAR(transaction_date) AS rev_year,
        MONTH(transaction_date) AS rev_month,
        ROUND(SUM((price - discount_applied) * quantity), 2) AS net_revenue
    FROM 
        transactions
    GROUP BY 
        rev_year, rev_month
),
prev_year_rev AS (
    SELECT
        rev_year,
        rev_month,
        net_revenue,
        LAG(net_revenue, 1) OVER(PARTITION BY rev_month ORDER BY rev_year) AS prev_rev
    FROM 
        rev_yearly
)
SELECT
    rev_year,
    rev_month,
    net_revenue,
    prev_rev,
    ROUND(((net_revenue - prev_rev) / NULLIF(prev_rev, 0)) * 100, 2) AS yoy_growth
FROM
    prev_year_rev
ORDER BY 
    rev_year DESC, rev_month DESC
;







-- Q03: Revenue by Product Categories
-- Purpose: Identify product categories driving the highest revenue to prioritize inventory and marketing.
-- Inputs: transactions (product_category, price, discount_applied, quantity)
-- Output: Product Category, Net Revenue
-- Notes: Orders categories by descending revenue.

SELECT 
    product_category,
    ROUND(SUM((price - discount_applied) * quantity), 2) AS net_revenue
FROM 
    transactions
GROUP BY 
    product_category
ORDER BY 
    net_revenue DESC
;







-- Q04: Top 10 Revenue-Generating Products
-- Purpose: Spotlight the highest-revenue products driving commercial performance.
-- Inputs: transactions (product_name, price, discount_applied, quantity)
-- Output: Product Name, Net Revenue
-- Notes: Uses RANK() to handle ties in revenue rankings.

WITH product_revenue AS (
    SELECT 
        product_name,
        ROUND(SUM((price - discount_applied) * quantity), 2) AS net_revenue
    FROM 
        transactions
    GROUP BY 
        product_name
),
ranked_products AS (
    SELECT 
        product_name,
        net_revenue,
        RANK() OVER (ORDER BY net_revenue DESC) AS revenue_rank
    FROM 
        product_revenue
)
SELECT 
    product_name,
    net_revenue
FROM 
    ranked_products
WHERE 
    revenue_rank <= 10
ORDER BY 
    net_revenue DESC
;







-- Q05: Revenue by Payment Method
-- Purpose: Analyze how payment choices influence revenue and order behavior.
-- Inputs: transactions (payment_method, price, discount_applied, quantity)
-- Output: Payment Method, Total Transactions, Net Revenue, Average Order Value
-- Notes: Can guide payment gateway optimization and fee management.

SELECT 
    payment_method,
    COUNT(*) AS total_transactions,
    ROUND(SUM((price - discount_applied) * quantity), 2) AS net_revenue,
    ROUND(AVG(price * quantity), 2) AS avg_order_value
FROM 
    transactions
GROUP BY 
    payment_method
ORDER BY 
    net_revenue DESC
;







-- Q06: State-Wise Revenue Performance
-- Purpose: Compare total revenue and average order value across regional markets.
-- Inputs: transactions (state, price, discount_applied, quantity)
-- Output: State, Total Transactions, Net Revenue, Average Order Value
-- Notes: Useful for geographic targeting in sales strategy.

SELECT 
    state,
    COUNT(*) AS total_transactions,
    ROUND(SUM((price - discount_applied) * quantity), 2) AS net_revenue,
    ROUND(AVG(price * quantity), 2) AS avg_order_value
FROM 
    transactions
GROUP BY 
    state
ORDER BY 
    net_revenue DESC
;







-- *****************************************************
-- End of Section 01 - Revenue Performance
-- *****************************************************


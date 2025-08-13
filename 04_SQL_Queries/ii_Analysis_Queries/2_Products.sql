-- ******************************************
-- Section 2 – Products Performance Analysis
-- ******************************************

-- Q07: Average Product Ratings
-- Purpose: Evaluate product quality perceptions through customer ratings.
-- Inputs: customer_reviews (product_name, rating)
-- Output: Product Name, Average Rating
-- Notes: Rounds to 1 decimal place; higher scores indicate better perceived quality.

SELECT 
    product_name,
    ROUND(AVG(rating), 1) AS avg_rating
FROM 
    customer_reviews
GROUP BY 
    product_name
ORDER BY 
    avg_rating DESC
;







-- Q08: Top 10 Products by Quantity Sold
-- Purpose: Discover the most popular items based on total units sold.
-- Inputs: transactions (product_name, quantity)
-- Output: Product Name, Total Quantity Sold
-- Notes: Uses RANK() to handle ties; guides replenishment and stocking strategies.

WITH product_quantity AS (
    SELECT
        product_name,
        SUM(quantity) AS total_quantity
    FROM 
        transactions
    GROUP BY 
		product_name
),
ranked_products AS (
    SELECT
        product_name,
        total_quantity,
        RANK() OVER (ORDER BY total_quantity DESC) AS rnk
    FROM 
        product_quantity
)
SELECT
    product_name,
    total_quantity
FROM 
    ranked_products
WHERE 
    rnk <= 10
;







-- Q09: Best-Selling Product Categories by Quantity Sold
-- Purpose: Compare category-level sales volume to guide inventory planning.
-- Inputs: transactions (product_category, quantity)
-- Output: Product Category, Total Quantity Sold
-- Notes: Helps determine which categories need priority restocking.

WITH category_quantity AS (
    SELECT
        product_category,
        SUM(quantity) AS total_quantity
    FROM 
        transactions
    GROUP BY 
        product_category
),
ranked_categories AS (
    SELECT
        product_category,
        total_quantity,
        RANK() OVER (ORDER BY total_quantity DESC) AS rnk
    FROM 
        category_quantity
)
SELECT
    product_category,
    total_quantity
FROM 
    ranked_categories
WHERE 
    rnk <= 10
;







-- Q10: First-Time Buyers Count by Product Category
-- Purpose: Identify which product categories attract the highest number of new customers.
-- Inputs: transactions (customer_id, product_category, transaction_date)
-- Output: Product Category, First-Time Buyers Count
-- Notes: Uses MIN(transaction_date) to find first purchase per customer, then counts distinct first-time buyers.

WITH first_orders AS (
    SELECT
        customer_id,
        MIN(transaction_date) AS first_purchase_date
    FROM 
        transactions
    GROUP BY 
        customer_id
),
first_time_categories AS (
    SELECT 
        DISTINCT t.customer_id,
        t.product_category
    FROM 
        transactions t
    JOIN 
        first_orders f ON t.customer_id = f.customer_id 
        AND t.transaction_date = f.first_purchase_date
)
SELECT
    product_category,
    COUNT(DISTINCT customer_id) AS first_time_buyers
FROM 
    first_time_categories
GROUP BY 
    product_category
ORDER BY 
    first_time_buyers DESC
;







-- *************************************************
-- End of Section 2 – Products Performance Analysis
-- *************************************************






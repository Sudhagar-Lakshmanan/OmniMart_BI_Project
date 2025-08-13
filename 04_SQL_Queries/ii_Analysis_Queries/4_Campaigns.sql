-- ******************************************
-- Section 4 – Marketing & Campaign Insights
-- ******************************************

-- Q16: Marketing Campaign Metrics by Type
-- Purpose: Evaluate budget utilization, ROI, and conversion efficiency for each campaign type.
-- Inputs: campaigns (campaign_type, budget, roi, impressions, clicks, conversions)
-- Output: Campaign Type, Total Budget, Total ROI, CTR%, Conversion Rate%, CPC, CPA, ROI%
-- Notes: Handles division-by-zero with NULLIF() for safety.

SELECT 
    campaign_type,
    SUM(budget)                                                  AS total_budget,
    SUM(roi)                                                     AS total_roi,
    SUM(impressions)                                             AS impressions,
    SUM(clicks)                                                  AS clicks,
    SUM(conversions)                                             AS conversions,
    ROUND(SUM(clicks) * 100.0 / NULLIF(SUM(impressions), 0), 2)  AS click_through_rate_pct,
    ROUND(SUM(conversions) * 100.0 / NULLIF(SUM(clicks), 0), 2)  AS conversion_rate_pct,
    ROUND(SUM(budget) / NULLIF(SUM(clicks), 0), 2)               AS cpc,  -- Cost Per Click
    ROUND(SUM(budget) / NULLIF(SUM(conversions), 0), 2)          AS cpa,  -- Cost Per Acquisition
    ROUND(SUM(roi) * 100.0 / NULLIF(SUM(budget), 0), 2)          AS roi_pct
FROM 
    campaigns
GROUP BY 
    campaign_type
ORDER BY 
    conversion_rate_pct DESC;







-- Q17: Peak Purchase Hours
-- Purpose: Identify the hours of the day that generate the most purchases.
-- Inputs: interactions (interaction_date, interaction_type)
-- Output: Purchase Hour (0–23), Purchase Count
-- Notes: Uses HOUR() to extract hour from interaction_date.

SELECT 
    HOUR(interaction_date) AS purchase_hour, 
    COUNT(*) AS purchase_count
FROM 
    interactions
WHERE 
	interaction_type = 'purchase'
GROUP BY 
    purchase_hour
ORDER BY 
    purchase_hour
;







-- Q18: ROI Efficiency by Target Segment
-- Purpose: Determine which target segments yield the highest return on investment.
-- Inputs: campaigns (target_segment, budget, roi)
-- Output: Target Segment, Total Campaign Budget, Total ROI
-- Notes: Filters out NULL ROI values to avoid misleading results.

SELECT 
    target_segment,
    SUM(budget) AS total_campaign_budget,       
    SUM(roi) AS total_roi            
FROM 
    campaigns
WHERE 
    roi IS NOT NULL
GROUP BY 
    target_segment
ORDER BY 
    total_roi DESC
;







-- Q19: Session Duration by Channel
-- Purpose: Discover which marketing channels retain user attention the longest.
-- Inputs: interactions (channel, duration)
-- Output: Channel, Average Session Duration
-- Notes: Ignores NULL channels to ensure accuracy.

SELECT 
    `channel`,
    AVG(duration) AS avg_session_duration
FROM 
    interactions
WHERE
    `channel` IS NOT NULL
GROUP BY 
    `channel`
;







-- Q20: User Interaction Volume by Channel
-- Purpose: Understand total user engagement volume by channel.
-- Inputs: interactions (channel)
-- Output: Channel, Interaction Count
-- Notes: Counts all interaction types.

SELECT 
    `channel`,
    COUNT(*) AS interaction_count
FROM 
    interactions
GROUP BY 
    `channel`
;







-- Q21: Purchase & Add-to-Cart Actions by Channel
-- Purpose: Identify which channels drive the most purchases and cart additions.
-- Inputs: interactions (channel, interaction_type)
-- Output: Channel, Purchase/Add-to-Cart Count
-- Notes: Filters for 'purchase' and 'add_to_cart' interaction types.
SELECT 
    `channel`,
    COUNT(*) AS purchase_actions
FROM 
    interactions
WHERE 
    interaction_type IN ('purchase', 'add_to_cart')
GROUP BY 
    `channel`
;








-- *************************************************
-- End of Section 4 – Marketing & Campaign Insights
-- *************************************************




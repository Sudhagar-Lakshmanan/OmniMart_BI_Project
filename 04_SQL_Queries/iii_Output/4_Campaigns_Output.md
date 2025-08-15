# Section 4 - Marketing & Campaign Insights (SQL Ouput)

---

## Q16 : Marketing Campaign Metrics by Type  
**Purpose:** Evaluate budget utilization, ROI, and conversion efficiency for each campaign type.  

| campaign_type        | total_budget | total_roi | impressions | clicks   | conversions | click_through_rate_pct | conversion_rate_pct | cpc  | cpa   | roi_pct |
|----------------------|--------------|-----------|-------------|----------|-------------|-------------------------|---------------------|------|-------|---------|
| In-Store Promotion   | 335,493.79   | 48,634.81 | 16,279,072  | 103,959  | 30,198      | 0.64                    | 29.05               | 3.23 | 11.11 | 14.50   |
| Search Engine Marketing | 503,441.26 | 162,643.49| 23,792,875  | 1,312,124| 137,064     | 5.51                    | 10.45               | 0.38 | 3.67  | 32.31   |
| Unknown              | 255,211.76   | 6,967.55  | 13,723,617  | 120,898  | 6,862       | 0.88                    | 5.68                | 2.11 | 37.19 | 2.73    |
| Email Marketing      | 243,040.71   | 38,701.52 | 17,808,883  | 521,788  | 25,349      | 2.93                    | 4.86                | 0.47 | 9.59  | 15.92   |
| TV Advertisement     | 2,223,399.08 | 3,641.43  | 88,984,482  | 572,960  | 19,133      | 0.64                    | 3.34                | 3.88 | 116.21| 0.16    |
| Radio Advertisement  | 2,341,382.95 | 7,930.71  | 111,968,799 | 772,855  | 25,767      | 0.69                    | 3.33                | 3.03 | 90.87 | 0.34    |
| Online Display Ads   | 726,456.71   | 8,237.28  | 43,491,503  | 240,203  | 7,891       | 0.55                    | 3.29                | 3.02 | 92.06 | 1.13    |
| Print Advertisement  | 1,200,438.58 | 4,887.21  | 66,968,184  | 373,138  | 12,203      | 0.56                    | 3.27                | 3.22 | 98.37 | 0.41    |
| Influencer Marketing | 951,232.57   | 6,005.61  | 48,141,952  | 238,340  | 7,531       | 0.50                    | 3.16                | 3.99 | 126.31| 0.63    |
| Social Media         | 331,621.26   | 6,810.02  | 18,182,609  | 220,145  | 6,863       | 1.21                    | 3.12                | 1.51 | 48.32 | 2.05    |
| SMS Marketing        | 343,555.73   | 2,395.62  | 16,987,593  | 89,466   | 2,696       | 0.53                    | 3.01                | 3.84 | 127.43| 0.70    |

---

## Q17 : Peak Purchase Hours  
**Purpose:** Identify the hours of the day that generate the most purchases.  

| purchase_hour | purchase_count |
|---------------|----------------|
| 0             | 31             |
| 1             | 41             |
| 2             | 62             |
| 3             | 93             |
| 4             | 117            |
| 5             | 208            |
| 6             | 295            |
| 7             | 330            |
| 8             | 411            |
| 9             | 537            |
| 10            | 650            |
| 11            | 767            |
| 12            | 829            |
| 13            | 792            |
| 14            | 809            |
| 15            | 724            |
| 16            | 689            |
| 17            | 662            |
| 18            | 570            |
| 19            | 442            |
| 20            | 386            |
| 21            | 253            |
| 22            | 193            |
| 23            | 364            |

---

## Q18 : ROI Efficiency by Target Segment  
**Purpose:** Determine which target segments yield the highest return on investment.  

| target_segment         | total_campaign_budget | total_roi |
|-------------------------|-----------------------|-----------|
| Home Improvement        | 493,044.32            | 59,085.43 |
| All Customers           | 236,874.94            | 48,719.98 |
| New Customers           | 165,528.47            | 27,377.96 |
| West Coast              | 312,457.62            | 18,994.16 |
| Middle-aged (41-60)     | 814,844.46            | 16,774.72 |
| Southern States         | 584,327.28            | 15,561.71 |
| Midwest                 | 396,917.84            | 13,699.78 |
| Inactive Customers      | 796,363.92            | 13,291.20 |
| High-Value Customers    | 363,127.86            | 12,590.35 |
| Seniors (60+)           | 592,780.07            | 11,532.97 |
| East Coast              | 950,914.18            | 11,487.57 |
| Adults (26-40)          | 582,330.65            | 9,886.13  |
| Technology Enthusiasts  | 540,387.98            | 8,417.69  |
| Young Adults (18-25)    | 333,060.11            | 8,308.26  |
| Online Shoppers         | 450,

---


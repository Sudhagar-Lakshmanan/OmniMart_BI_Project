# Section 1 – Revenue Performance Analysis (SQL output)


## Q1 : Revenue Summary Metrics  
**Purpose:** Track total revenue before and after discounts to reveal the true earning impact.

| gross_revenue | net_revenue | discount_impact |
|---------------|-------------|-----------------|
| 27791844.84   | 27555304.84 | 240770          |



## Q2 : Year-over-Year Revenue Growth  
**Purpose:** Track monthly Revenue trends to assess business momentum and seasonal patterns.

| rev_year | rev_month | net_revenue | prev_rev | yoy_growth |
|----------|-----------|-------------|----------|------------|
| 2025 | 2 | 572852.51 | 763212.57 | -24.94 |
| 2025 | 1 | 689471.79 | 559757.72 | 23.17 |
| 2024 | 12 | 1308525.48 | 977017.74 | 33.93 |
| 2024 | 11 | 1233851.85 | 992605.56 | 24.30 |
| 2024 | 10 | 744805.77 | 503072.85 | 48.05 |
| 2024 | 9 | 650822.05 | 480233.27 | 35.52 |
| 2024 | 8 | 980617.07 | 874447.23 | 12.14 |
| 2024 | 7 | 917861.04 | 774500.61 | 18.51 |
| 2024 | 6 | 809913.01 | 575738.45 | 40.67 |
| 2024 | 5 | 654398.15 | 558888.50 | 17.09 |
| 2024 | 4 | 613797.13 | 443857.20 | 38.29 |
| 2024 | 3 | 655947.31 | 461358.49 | 42.18 |
| 2024 | 2 | 763212.57 | 384542.30 | 98.47 |
| 2024 | 1 | 559757.72 | 428567.02 | 30.61 |
| 2023 | 12 | 977017.74 | 797844.57 | 22.46 |
| 2023 | 11 | 992605.56 | 813412.27 | 22.03 |
| 2023 | 10 | 503072.85 | 351643.61 | 43.06 |
| 2023 | 9 | 480233.27 | 339253.33 | 41.56 |
| 2023 | 8 | 874447.23 | 693598.26 | 26.07 |
| 2023 | 7 | 774500.61 | 578361.46 | 33.91 |
| 2023 | 6 | 575738.45 | 345335.43 | 66.72 |
| 2023 | 5 | 558888.50 | 294159.97 | 89.99 |
| 2023 | 4 | 443857.20 | 275105.44 | 61.34 |
| 2023 | 3 | 461358.49 | 255960.28 | 80.25 |
| 2023 | 2 | 384542.30 | 224012.58 | 71.66 |
| 2023 | 1 | 428567.02 | 219087.99 | 95.61 |
| 2022 | 12 | 797844.57 | 485201.01 | 64.44 |
| 2022 | 11 | 813412.27 | 475902.47 | 70.92 |
| 2022 | 10 | 351643.61 | 200569.17 | 75.32 |
| 2022 | 9 | 339253.33 | 213383.07 | 58.99 |
| 2022 | 8 | 693598.26 | 344760.17 | 101.18 |
| 2022 | 7 | 578361.46 | 287677.48 | 101.05 |
| 2022 | 6 | 345335.43 | 170482.14 | 102.56 |
| 2022 | 5 | 294159.97 | 145407.85 | 102.30 |
| 2022 | 4 | 275105.44 | 137986.58 | 99.37 |
| 2022 | 3 | 255960.28 | 180269.91 | 41.99 |
| 2022 | 2 | 224012.58 | 119343.67 | 87.70 |
| 2022 | 1 | 219087.99 | 124294.40 | 76.27 |
| 2021 | 12 | 485201.01 | 218015.83 | 122.55 |
| 2021 | 11 | 475902.47 | 198749.20 | 139.45 |
| 2021 | 10 | 200569.17 | 86029.22 | 133.14 |
| 2021 | 9 | 213383.07 | 125711.14 | 69.74 |
| 2021 | 8 | 344760.17 | 84828.64 | 306.42 |
| 2021 | 7 | 287677.48 | 83039.86 | 246.43 |
| 2021 | 6 | 170482.14 | 19703.65 | 765.23 |
| 2021 | 5 | 145407.85 | 30702.48 | 373.60 |
| 2021 | 4 | 137986.58 | 19253.72 | 616.67 |
| 2021 | 3 | 180269.91 | 5555.32 | 3145.00 |
| 2021 | 2 | 119343.67 | NULL | NULL |
| 2021 | 1 | 124294.40 | NULL | NULL |
| 2020 | 12 | 218015.83 | NULL | NULL |
| 2020 | 11 | 198749.20 | NULL | NULL |
| 2020 | 10 | 86029.22 | NULL | NULL |
| 2020 | 9 | 125711.14 | NULL | NULL |
| 2020 | 8 | 84828.64 | NULL | NULL |
| 2020 | 7 | 83039.86 | NULL | NULL |
| 2020 | 6 | 19703.65 | NULL | NULL |
| 2020 | 5 | 30702.48 | NULL | NULL |
| 2020 | 4 | 19253.72 | NULL | NULL |
| 2020 | 3 | 5555.32 | NULL | NULL |



## Q3 : Revenue by Product Categories  
**Purpose:** Identify product categories driving the highest Revenue to prioritize inventory and marketing.

| product_category         | net_revenue |
|--------------------------|-------------|
| Furniture                | 6134000.89  |
| Smartphones              | 4941033.38  |
| Laptops                  | 3948494.00  |
| TVs                      | 3251099.93  |
| Kitchen Appliances       | 2918114.02  |
| Desktop Computers        | 1126354.76  |
| Gaming Consoles          | 1098230.56  |
| Smart Home Devices       | 990944.10   |
| Home Decor               | 849579.89   |
| Audio Equipment          | 691981.44   |
| Unknown                  | 581016.61   |
| Tablets                  | 411393.05   |
| Cookware                 | 212180.48   |
| Small Kitchen Appliances | 186947.41   |
| Bedding                  | 141803.01   |
| Computer Accessories     | 72131.31    |



## Q4 : Top 10 Revenue-Generating Products  
**Purpose:** Spotlight the highest-Revenue products driving commercial performance.

| product_name | net_revenue |
|--------------|-------------|
| Bed Frame    | 1371878.36  |
| Office Desk  | 1224718.37  |
| Sofa         | 1217507.58  |
| Bookshelf    | 1214888.89  |
| Dining Table | 1084810.27  |
| Xiaomi Mi 12 | 1040673.31  |
| OnePlus 10   | 1037559.93  |
| iPhone 13    | 1005527.06  |
| Google Pixel 6 | 966569.77 |
| HP Spectre   | 887793.39   |



## Q5 : Revenue by Payment Method  
**Purpose:** Analyze how Payment choices influence Revenue and order behavior.

| payment_method | total_transactions | net_revenue | avg_order_value |
|----------------|--------------------|-------------|-----------------|
| Credit Card    | 10907              | 9384482.20  | 903.40 |
| Debit Card     | 7968               | 6947690.70  | 913.72 |
| PayPal         | 4798               | 4124542.81  | 903.67 |
| Apple Pay      | 3160               | 2704956.68  | 897.43 |
| Cash           | 1573               | 1413901.46  | 939.69 |
| Gift Card      | 1596               | 1242082.81  | 816.63 |
| Google Pay     | 1633               | 1236664.93  | 795.40 |
| Unknown        | 660                | 500983.25   | 798.61 |



## Q6 : State-Wise Revenue Performance  
**Purpose:** Compare total Revenue and average order value across regional markets.

| state         | total_transactions | net_revenue | avg_order_value |
|---------------|--------------------|-------------|-----------------|
| Online        | 16108              | 13978407.46 | 910.50 |
| California    | 3049               | 2660263.12  | 914.61 |
| Texas         | 1630               | 1393108.41  | 895.16 |
| Illinois      | 1559               | 1344152.28  | 907.04 |
| Massachusetts | 1528               | 1322927.55  | 909.75 |
| New York      | 1562               | 1295430.17  | 866.49 |
| Georgia       | 1563               | 1283274.94  | 859.37 |
| Washington    | 1536               | 1237270.92  | 841.37 |
| Colorado      | 1529               | 1223314.59  | 842.51 |
| Florida       | 1587               | 1193083.81  | 794.99 |
| Unknown       | 644                | 624071.59   | 1018.26 |



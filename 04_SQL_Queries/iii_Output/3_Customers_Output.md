# Section 3 - Customer Segmentation & Retention (SQL Output)



## Q11 : Repeat Customers Count by Preferred Channel  
**Purpose:** See which communication channels build stronger customer loyalty.  

| preferred_channel | repeat_customers | repeat_purchase_rate |
|-------------------|------------------|-----------------------|
| online            | 2056             | 83.14                 |
| in-store          | 775              | 81.07                 |
| both              | 1271             | 87.23                 |
| Unknown           | 95               | 83.33                 |  

---

## Q12 : Top Spend by Age & Gender  
**Purpose:** Identify which demographic segments generate the most revenue.  

| gender            | age_group | net_revenue   |
|-------------------|-----------|---------------|
| Female            | 36-50     | 5,234,873.28  |
| Male              | 36-50     | 5,156,987.69  |
| Male              | 26-35     | 4,271,511.92  |
| Female            | 26-35     | 4,120,395.55  |
| Female            | 18-25     | 2,275,062.70  |
| Male              | 18-25     | 1,844,521.99  |
| Male              | 50+       | 1,091,015.73  |
| Female            | 50+       | 1,066,030.11  |
| Female            | Unknown   | 544,601.88    |
| Male              | Unknown   | 404,374.33    |
| Non-binary        | 36-50     | 258,622.89    |
| Unknown           | 36-50     | 230,751.13    |
| Unknown           | 26-35     | 209,783.89    |
| Non-binary        | 26-35     | 198,191.10    |
| Non-binary        | 18-25     | 178,137.85    |
| Unknown           | 18-25     | 100,120.51    |
| Prefer not to say | 26-35     | 97,204.98     |
| Prefer not to say | 36-50     | 55,507.67     |
| Unknown           | 50+       | 50,731.70     |
| Prefer not to say | 18-25     | 50,208.33     |
| Non-binary        | 50+       | 44,566.15     |
| Prefer not to say | 50+       | 22,516.51     |
| Prefer not to say | Unknown   | 18,874.04     |
| Non-binary        | Unknown   | 18,544.80     |
| Unknown           | Unknown   | 12,168.11     |

---

## Q13 : Top 10 Customers by Revenue  
**Purpose:** Highlight individual customers with the highest spending.  

| customer_id                              | full_name        | revenue    |
|------------------------------------------|------------------|------------|
| 09336038-48af-4a40-9d70-e502c23f7e08     | Tracey Patterson | 144,315.34 |
| 4958c3f4-a361-467e-abf3-8240fb3b0e61     | Margaret Liu     | 115,346.58 |
| 5b731042-f7ca-44ce-b350-f6c30abb6668     | Bethany Cowan    | 106,029.93 |
| 488b5382-f1f2-4352-97d7-f6e1507ec18e     | John Williams    | 97,823.81  |
| dd9e9b85-a4f6-450f-a63e-dcd26e488b22     | Brandi Sullivan  | 75,052.00  |
| 92a08093-7c51-42c8-af53-d91feff0824d     | Paul Sullivan    | 72,685.85  |
| 81efc54e-219d-4239-bf70-ee71c2b801a9     | Jermaine Baker   | 69,075.93  |
| 3e704f9d-46f7-4b86-a849-36324119649b     | James Petty      | 66,649.13  |
| f89ff216-5ca6-4633-a908-c408d9399a60     | Lance Osborne    | 66,154.18  |
| a80c43f9-57f0-4d0a-87fb-8ffe3d48cf2e     | Timothy Haynes   | 66,067.44  |

---

## Q14 : Customer Distribution by Region  
**Purpose:** Understand where customers live and how much they spend.  

| state         | total_customers | net_revenue  | avg_order_value |
|---------------|-----------------|--------------|-----------------|
| California    | 873             | 5,079,503.84 | 936.30          |
| Texas         | 644             | 3,573,068.69 | 901.99          |
| Florida       | 542             | 2,988,780.04 | 898.38          |
| New York      | 469             | 2,601,548.28 | 904.55          |
| Pennsylvania  | 294             | 1,783,130.26 | 930.04          |
| Illinois      | 294             | 1,614,993.64 | 901.51          |
| Ohio          | 258             | 1,440,218.86 | 870.61          |
| Michigan      | 208             | 1,325,398.98 | 990.67          |
| Georgia       | 247             | 1,203,030.92 | 811.75          |
| North Carolina| 226             | 1,122,843.99 | 819.89          |
| Virginia      | 198             | 1,034,557.07 | 878.54          |
| New Jersey    | 172             | 930,703.12   | 898.09          |
| Arizona       | 159             | 828,957.01   | 847.39          |
| Washington    | 166             | 805,509.71   | 836.97          |
| Massachusetts | 157             | 748,913.11   | 830.25          |
| Unknown       | 93              | 474,147.32   | 818.45          |

---

## Q15 : High-Risk Churn Segments  
**Purpose:** Detect customer segments most likely to churn based on age and preferred channel.  

| age_group | total_customers | churned_customers | churn_rate_pct |
|-----------|-----------------|-------------------|----------------|
| 18-25     | 1079            | 421               | 39.02          |
| 26-35     | 1469            | 341               | 23.21          |
| 36-50     | 1833            | 462               | 25.20          |
| 50+       | 433             | 170               | 39.26          |
| Unknown   | 186             | 36                | 19.35          |




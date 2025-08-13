-- ******************************************
-- Section 1. Missing or Null Handling
-- ******************************************

-- // 1. Replace blank resolution_date in Support Tickets
UPDATE 
    support_tickets
SET 
    resolution_date = '1900-01-01'
WHERE
	resolution_date IS NULL
;




-- // 2. Support tickets with missing priority or issue_category
SELECT 
    *  
FROM 
    support_tickets
WHERE 
	priority IS NULL OR issue_category IS NULL
;




-- // 3. Campaigns with missing budget, impressions, or ROI
SELECT 
    * 
FROM 
    campaigns
WHERE 
	budget IS NULL OR impressions IS NULL OR roi IS NULL
;




-- // 4. Reviews with missing rating or review text
SELECT 
    * 
FROM 
    customer_reviews
WHERE 
    rating IS NULL OR review_text IS NULL
;




-- // 5. Transactions with blank or null product names
SELECT 
    *
FROM 
    transactions
WHERE 
    product_name IS NULL OR TRIM(product_name) = ''
;









-- ******************************************
-- Section 2. Duplicates & Uniqueness Checks 
-- ******************************************

-- // 1. Customers with duplicate customer_id
SELECT 
    customer_id, 
    COUNT(*) 
FROM 
    customers 
GROUP BY 
    customer_id 
HAVING 
	COUNT(*) > 1
;




-- // 2. Replacing duplicate email IDs with 'Unknown'
UPDATE 
    customers c
JOIN (
	  SELECT email 
      FROM customers 
      GROUP BY email 
      HAVING COUNT(*) > 1
      ) dup ON c.email = dup.email
SET 
     c.email = 'Unknown'
;







-- ******************************************
-- Section 3. Format Validations 
-- ******************************************

-- // 1. Invalid email format
SELECT 
    * 
FROM 
    customers
WHERE 
	email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    AND email != 'Unknown'
;





-- // 2. Invalid or missing phone numbers
SELECT 
    * 
FROM 
    customers
WHERE 
    phone IS NULL OR phone = '' OR phone NOT REGEXP '^[0-9]{10,15}$'
;


-- Note: Found uncleaned phone numbers, hence fixing 'Phone' column. Create "phone_cleaned"(without exten), "phone_extension" columnns
-- Step: 1 - Add new column "phone cleaned"
ALTER TABLE 
    customers 
ADD COLUMN 
    phone_cleaned VARCHAR(20)
;


-- Step: 2 - Extract numeric part (before 'x'), remove non-digits
UPDATE 
    customers
SET 
    phone_cleaned = REGEXP_REPLACE(SUBSTRING_INDEX(LOWER(phone), 'x', 1),'[^0-9]', '')
WHERE 
    phone IS NOT NULL
;


-- Step: 3 - Mark invalids/nulls/blanks as 'Unknown'
UPDATE 
    customers
SET 
    phone_cleaned = 'Unknown'
WHERE 
    phone_cleaned IS NULL OR TRIM(phone_cleaned) = ''
;


-- Step: 4 - Add new column "phone_extension"
ALTER TABLE 
    customers 
ADD COLUMN 
    phone_extension VARCHAR(10)
;


-- Step: 5 - Extract extension if 'x' exists
UPDATE 
    customers
SET 
    phone_extension = TRIM(SUBSTRING_INDEX(phone, 'x', -1))
WHERE 
    LOWER(phone) LIKE '%x%'
;


-- Step: 6 - Mark null/empty as 'Unknown'
UPDATE 
    customers
SET 
    phone_extension = 'Unknown'
WHERE 
    phone_extension IS NULL OR TRIM(phone_extension) = ''
;




-- // 3. Special characters in customer full names //
SELECT 
    * 
FROM 
    customers
WHERE 
    full_name REGEXP '[^a-zA-Z0-9 ]'
;






-- ****************************************************
-- Section 4. Orphan Records (Foreign Key Validation)
-- ****************************************************

-- // 1. Transactions with no matching customer // 
SELECT 
    t.*
FROM
    transactions t
LEFT JOIN 
    customers c ON t.customer_id = c.customer_id
WHERE 
    c.customer_id IS NULL
;




-- // 2. Interactions with no matching customer //
SELECT 
    i.*
FROM 
    interactions i
LEFT JOIN 
    customers c ON i.customer_id = c.customer_id
WHERE 
    c.customer_id IS NULL
;





-- // 3. Support tickets with no matching customer //
SELECT 
    s.*
FROM 
    support_tickets s
LEFT JOIN 
    customers c ON s.customer_id = c.customer_id
WHERE 
    c.customer_id IS NULL
;





-- // 4. Customer reviews with no matching customer //
SELECT 
    cr.*
FROM
    customer_reviews cr
LEFT JOIN 
    customers c ON cr.customer_id = c.customer_id
WHERE 
    c.customer_id IS NULL
;






-- ****************************************************
-- Section 5. Outlier Detection
-- ****************************************************

-- // 1. Age outliers in customers //
SELECT 
    * 
FROM 
    customers 
WHERE 
    age < 10 OR age > 100
;




-- // 2. Negative or invalid price/quantity in transactions //
SELECT 
    * 
FROM 
    transactions 
WHERE 
    price < 0 OR quantity <= 0
;




-- // 3. Customer satisfaction score outliers //
SELECT 
    *
FROM 
    support_tickets 
WHERE 
    customer_satisfaction_score < 1 OR customer_satisfaction_score > 5
;







-- *************************************************************
-- Section 6. Recalculating Derived Columns (Campaigns Table) 
-- *************************************************************

-- // 1. Recalculate missing Conversion Rate //
UPDATE 
    campaigns
SET 
    conversion_rate = (conversions / clicks) * 100
WHERE 
    conversion_rate = 0 AND conversions IS NOT NULL AND clicks IS NOT NULL AND clicks != 0
;



-- // 2. Recalculate missing Conversions //
UPDATE 
    campaigns
SET 
    conversions = ROUND((conversion_rate / 100) * clicks)
WHERE
    conversions = 0 AND conversion_rate IS NOT NULL AND clicks IS NOT NULL
;



-- // 3. Recalculate missing Clicks //
UPDATE 
    campaigns
SET 
    clicks = ROUND(conversions / (conversion_rate / 100))
WHERE 
    clicks = 0 AND conversions IS NOT NULL AND conversion_rate IS NOT NULL AND conversion_rate != 0
;







-- *********************************************************************
-- Section 7. Split " store location " into columns like CITY, STATE
-- *********************************************************************

-- Step 1 : Rename as City
ALTER TABLE 
    transactions
CHANGE COLUMN 
    store_location city VARCHAR(255)
;



-- Step 2 : Add State Column
ALTER TABLE 
    transactions
ADD COLUMN 
    state VARCHAR(50)
;



-- Step 3 : Extract the acronym State name from City column
UPDATE 
    transactions
SET 
    state = CASE
				WHEN city = 'Online' THEN 'Online'
                WHEN city = 'Unknown' THEN 'Unknown'
				WHEN city LIKE '%,%' THEN TRIM(SUBSTRING_INDEX(city, ',', -1))
				ELSE NULL
			END;



-- Step 4 : Abbreviating the State Names
-- ELSE keeps 'Online', 'Unknown', or already-full names unchanged
UPDATE 
    transactions
SET 
    state = CASE
				WHEN state = 'AL' THEN 'Alabama'
				WHEN state = 'AK' THEN 'Alaska'
				WHEN state = 'AZ' THEN 'Arizona'
				WHEN state = 'AR' THEN 'Arkansas'
				WHEN state = 'CA' THEN 'California'
				WHEN state = 'CO' THEN 'Colorado'
				WHEN state = 'CT' THEN 'Connecticut'
				WHEN state = 'DE' THEN 'Delaware'
				WHEN state = 'FL' THEN 'Florida'
				WHEN state = 'GA' THEN 'Georgia'
				WHEN state = 'HI' THEN 'Hawaii'
				WHEN state = 'ID' THEN 'Idaho'
				WHEN state = 'IL' THEN 'Illinois'
				WHEN state = 'IN' THEN 'Indiana'
				WHEN state = 'IA' THEN 'Iowa'
				WHEN state = 'KS' THEN 'Kansas'
				WHEN state = 'KY' THEN 'Kentucky'
				WHEN state = 'LA' THEN 'Louisiana'
				WHEN state = 'ME' THEN 'Maine'
				WHEN state = 'MD' THEN 'Maryland'
				WHEN state = 'MA' THEN 'Massachusetts'
				WHEN state = 'MI' THEN 'Michigan'
				WHEN state = 'MN' THEN 'Minnesota'
				WHEN state = 'MS' THEN 'Mississippi'
				WHEN state = 'MO' THEN 'Missouri'
				WHEN state = 'MT' THEN 'Montana'
				WHEN state = 'NE' THEN 'Nebraska'
				WHEN state = 'NV' THEN 'Nevada'
				WHEN state = 'NH' THEN 'New Hampshire'
				WHEN state = 'NJ' THEN 'New Jersey'
				WHEN state = 'NM' THEN 'New Mexico'
				WHEN state = 'NY' THEN 'New York'
				WHEN state = 'NC' THEN 'North Carolina'
				WHEN state = 'ND' THEN 'North Dakota'
				WHEN state = 'OH' THEN 'Ohio'
				WHEN state = 'OK' THEN 'Oklahoma'
				WHEN state = 'OR' THEN 'Oregon'
				WHEN state = 'PA' THEN 'Pennsylvania'
				WHEN state = 'RI' THEN 'Rhode Island'
				WHEN state = 'SC' THEN 'South Carolina'
				WHEN state = 'SD' THEN 'South Dakota'
				WHEN state = 'TN' THEN 'Tennessee'
				WHEN state = 'TX' THEN 'Texas'
				WHEN state = 'UT' THEN 'Utah'
				WHEN state = 'VT' THEN 'Vermont'
				WHEN state = 'VA' THEN 'Virginia'
				WHEN state = 'WA' THEN 'Washington'
				WHEN state = 'WV' THEN 'West Virginia'
				WHEN state = 'WI' THEN 'Wisconsin'
				WHEN state = 'WY' THEN 'Wyoming'
				ELSE state                                         
			END;  



-- Step 5 : Removing State names from City column
UPDATE 
    transactions
SET 
    city = TRIM(SUBSTRING_INDEX(city, ',', 1))
;



















CREATE DATABASE IF NOT EXISTS retail_customer_insights;
USE retail_customer_insights;


-- ******************************************
--  TABLE CREATION
-- ******************************************
-- 1. Create customers (no dependencies)

CREATE TABLE customers (
    customer_id CHAR(50) PRIMARY KEY,
    full_name VARCHAR(255),
    age INT,
    gender VARCHAR(30),
    email VARCHAR(255),
    phone VARCHAR(50),
    street_address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20),
    registration_date DATE,   -- date format changed
    preferred_channel VARCHAR(50)
);






-- 2. Create campaigns (no foreign key dependencies)

CREATE TABLE campaigns (
    campaign_id CHAR(50) PRIMARY KEY,
    campaign_name VARCHAR(255),
    campaign_type VARCHAR(100),
    start_date DATE,
    end_date DATE,
    target_segment VARCHAR(255),
    budget DECIMAL(10, 2),
    impressions INT,
    clicks INT,
    conversions INT,
    conversion_rate DECIMAL(5, 2),
    roi DECIMAL(10, 2)
);







-- 3. Create transactions (depends on customers)

CREATE TABLE transactions (
    transaction_id CHAR(50) PRIMARY KEY,
    customer_id CHAR(50),
    product_name VARCHAR(255),
    product_category VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2),
    transaction_date DATE,
    store_location VARCHAR(255),
    payment_method VARCHAR(50),
    discount_applied INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);






--  4. Create interactions (depends on customers)

CREATE TABLE interactions (
    interaction_id CHAR(50) PRIMARY KEY,
    customer_id CHAR(50),
    channel VARCHAR(50),
    interaction_type VARCHAR(50),
    interaction_date DATETIME,
    duration INT,
    page_or_product VARCHAR(255),
    session_id VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);






-- 5. Create support_tickets (depends on customers)

CREATE TABLE support_tickets (
    ticket_id CHAR(50) PRIMARY KEY,
    customer_id CHAR(50),
    issue_category VARCHAR(100),
    priority VARCHAR(20),
    submission_date DATETIME,
    resolution_date DATETIME NULL,  -- some date details were not available
    resolution_status VARCHAR(50),
    resolution_time_hours INT,
    customer_satisfaction_score INT,
    notes TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);







-- 6. Create customer_reviews (depends on customers)

CREATE TABLE customer_reviews (
    review_id VARCHAR(100) PRIMARY KEY,
    customer_id CHAR(100),
    product_name VARCHAR(255),
    product_category VARCHAR(100),
    full_name VARCHAR(255),
    transaction_date DATE,
    review_date DATE,
    rating INT,
    review_title VARCHAR(255),
    review_text TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);







-- ******************************************
--  INSERT DATA
-- ******************************************

-- Insert data into Customers

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\retail_customer_insights\\customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;





-- Insert data into Campaigns

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\retail_customer_insights\\campaigns.csv'
INTO TABLE campaigns
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;





-- Insert data into Transactions

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\retail_customer_insights\\transactions.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;





-- Insert data into Interactions

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\retail_customer_insights\\interactions.csv'
INTO TABLE interactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;





-- Insert data into Support Tickets

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\retail_customer_insights\\support_tickets.csv'
INTO TABLE support_tickets
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;





-- Insert data into Customer_Reviews

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\retail_customer_insights\\customer_reviews.csv'
INTO TABLE customer_reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
;







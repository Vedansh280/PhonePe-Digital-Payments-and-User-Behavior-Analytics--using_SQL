-- 1. Aggregate Transactions

CREATE TABLE agg_transactions (
    state VARCHAR(100),
    year INT,
    quarter INT,
    transaction_type VARCHAR(100),
    transaction_count BIGINT,
    transaction_amount NUMERIC(20,2),
    region VARCHAR(50)
);

-- 2. Aggregate Users

CREATE TABLE agg_users (
    state VARCHAR(100),
    year INT,
    quarter INT,
    brand VARCHAR(100),
    transaction_count BIGINT,
    percentage NUMERIC(10,5),
    region VARCHAR(50)
);

-- 3. Map Transactions
CREATE TABLE map_transactions (
    state VARCHAR(100),
    year INT,
    quarter INT,
    district VARCHAR(100),
    transaction_count BIGINT,
    transaction_amount NUMERIC(20,2),
    latitude NUMERIC(10,6),
    longitude NUMERIC(10,6),
    region VARCHAR(50)
);

-- 4. Map Users

CREATE TABLE map_users (
    state VARCHAR(100),
    year INT,
    quarter INT,
    district VARCHAR(100),
    registered_users BIGINT,
    app_opens BIGINT,
    latitude NUMERIC(10,6),
    longitude NUMERIC(10,6),
    region VARCHAR(50)
);


-- 5. Top Transaction District

CREATE TABLE top_transactions_district (
    state VARCHAR(100),
    year INT,
    quarter INT,
    district VARCHAR(100),
    transaction_count BIGINT,
    transaction_amount NUMERIC(20,2),
    latitude NUMERIC(10,6),
    longitude NUMERIC(10,6),
    region VARCHAR(50)
);

-- 6. Top Transaction Pincode

CREATE TABLE top_transactions_pincode (
    state VARCHAR(100),
    year INT,
    quarter INT,
    pincode BIGINT,
    transaction_count BIGINT,
    transaction_amount NUMERIC(20,2),
    region VARCHAR(50)
);

-- 7. Top Users District

CREATE TABLE top_users_district (
    state VARCHAR(100),
    year INT,
    quarter INT,
    district VARCHAR(100),
    registered_users BIGINT,
    latitude NUMERIC(10,6),
    longitude NUMERIC(10,6),
    region VARCHAR(50)
);

-- 8. Top Users Pincode

CREATE TABLE top_users_pincode (
    state VARCHAR(100),
    year INT,
    quarter INT,
    pincode BIGINT,
    registered_users BIGINT,
    region VARCHAR(50)
);

SELECT * FROM agg_transactions;

SELECT * FROM agg_users;

SELECT * FROM map_transactions;

SELECT * FROM map_users;

SELECT * FROM top_transactions_district;

SELECT * FROM top_transactions_pincode;

SELECT * FROM top_users_district;

SELECT * FROM top_users_pincode;

--BUSINESS PROBLEM 1: Find the Total Number of Transactions


SELECT
    SUM(transaction_count) AS total_transactions
FROM agg_transactions;

-- BUSINESS PROBLEM 2: Find the Total Transaction Amount


SELECT
    ROUND(SUM(transaction_amount),2) AS total_transaction_amount
FROM agg_transactions;


--BUSINESS PROBLEM 3: Find Total Registered Users

SELECT
    SUM(registered_users) AS total_registered_users
FROM map_users;

 --BUSINESS PROBLEM 4: Find Total App Opens

SELECT
    SUM(app_opens) AS total_app_opens
FROM map_users;

--BUSINESS PROBLEM 5: State-wise Transaction Count

SELECT
    state,
    SUM(transaction_count) AS total_transactions
FROM agg_transactions
GROUP BY state
ORDER BY total_transactions DESC;

--BUSINESS PROBLEM 6: State-wise Transaction Amount

SELECT
    state,
    ROUND(SUM(transaction_amount),2) AS total_transaction_amount
FROM agg_transactions
GROUP BY state
ORDER BY total_transaction_amount DESC;

--BUSINESS PROBLEM 7: Top 10 States by Transaction Amount

SELECT
    state,
    ROUND(SUM(transaction_amount),2) AS total_transaction_amount
FROM agg_transactions
GROUP BY state
ORDER BY total_transaction_amount DESC
LIMIT 10;

--BUSINESS PROBLEM 8: Top 10 States by Registered Users

SELECT
    state,
    SUM(registered_users) AS total_registered_users
FROM map_users
GROUP BY state
ORDER BY total_registered_users DESC
LIMIT 10;

--BUSINESS PROBLEM 9: Quarter-wise Transaction Amount

SELECT
    year,
    ROUND(SUM(transaction_amount),2) AS total_transaction_amount
FROM agg_transactions
GROUP BY year
ORDER BY year;

-- Business Problem 11: Region-wise Transaction Analysis

SELECT
    region,
    SUM(transaction_count) AS total_transactions,
    ROUND(SUM(transaction_amount),2) AS total_transaction_amount
FROM agg_transactions
GROUP BY region
ORDER BY total_transaction_amount DESC;


-- Business Problem 12: Region-wise Registered Users

SELECT
    region,
    SUM(registered_users) AS total_registered_users
FROM map_users
GROUP BY region
ORDER BY total_registered_users DESC;


-- Business Problem 13: Transaction Type Analysis

SELECT
    transaction_type,
    SUM(transaction_count) AS total_transactions,
    ROUND(SUM(transaction_amount),2) AS total_transaction_amount
FROM agg_transactions
GROUP BY transaction_type
ORDER BY total_transaction_amount DESC;


-- Business Problem 14: Average Transaction Value by State

SELECT
    state,
    ROUND(SUM(transaction_amount) / SUM(transaction_count),2) AS avg_transaction_value
FROM agg_transactions
GROUP BY state
ORDER BY avg_transaction_value DESC;


-- Business Problem 15: Highest Performing Quarter

SELECT
    quarter,
    ROUND(SUM(transaction_amount),2) AS total_transaction_amount
FROM agg_transactions
GROUP BY quarter
ORDER BY total_transaction_amount DESC;


-- Business Problem 16: Top 10 Districts by Transaction Amount

SELECT
    district,
    ROUND(SUM(transaction_amount),2) AS total_transaction_amount
FROM map_transactions
GROUP BY district
ORDER BY total_transaction_amount DESC
LIMIT 10;


-- Business Problem 17: Top 10 Districts by Registered Users

SELECT
    district,
    SUM(registered_users) AS total_registered_users
FROM map_users
GROUP BY district
ORDER BY total_registered_users DESC
LIMIT 10;


-- Business Problem 18: Top 10 Pincodes by Transaction Amount

SELECT
    pincode,
    ROUND(SUM(transaction_amount),2) AS total_transaction_amount
FROM top_transactions_pincode
GROUP BY pincode
ORDER BY total_transaction_amount DESC
LIMIT 10;


-- Business Problem 19: Top 10 Pincodes by Registered Users

SELECT
    pincode,
    SUM(registered_users) AS total_registered_users
FROM top_users_pincode
GROUP BY pincode
ORDER BY total_registered_users DESC
LIMIT 10;


-- Business Problem 20: Mobile Brand Market Share

SELECT
    brand,
    SUM(transaction_count) AS users,
    ROUND(AVG(percentage),2) AS market_share_percentage
FROM agg_users
GROUP BY brand
ORDER BY users DESC;


-- Business Problem 21: Top 10 Mobile Brands by Users

SELECT
    brand,
    SUM(transaction_count) AS users
FROM agg_users
GROUP BY brand
ORDER BY users DESC
LIMIT 10;


-- Business Problem 22: State-wise Mobile Brand Distribution

SELECT
    state,
    brand,
    SUM(transaction_count) AS users
FROM agg_users
GROUP BY state, brand
ORDER BY state, users DESC;


-- Business Problem 23: Average App Opens per Registered User

SELECT
    state,
    ROUND(
        SUM(app_opens)::NUMERIC /
        NULLIF(SUM(registered_users),0),
    2) AS avg_app_opens_per_user
FROM map_users
GROUP BY state
ORDER BY avg_app_opens_per_user DESC;


-- Business Problem 24: Quarter-wise Transaction Analysis

SELECT
    year,
    quarter,
    ROUND(SUM(transaction_amount),2) AS total_transaction_amount
FROM agg_transactions
GROUP BY year, quarter
ORDER BY year, quarter;


-- Business Problem 25: State Ranking by Transaction Amount

SELECT
    state,
    ROUND(SUM(transaction_amount),2) AS total_transaction_amount,
    RANK() OVER(
        ORDER BY SUM(transaction_amount) DESC
    ) AS state_rank
FROM agg_transactions
GROUP BY state;

-- Business Problem 26: Running Total of Transaction Amount Year-wise

SELECT
    year,
    ROUND(SUM(transaction_amount),2) AS yearly_amount,
    ROUND(SUM(SUM(transaction_amount)) OVER(ORDER BY year),2) AS running_total
FROM agg_transactions
GROUP BY year
ORDER BY year;


-- Business Problem 27: Running Total of Registered Users

SELECT
    year,
    SUM(registered_users) AS total_users,
    SUM(SUM(registered_users)) OVER(ORDER BY year) AS running_total_users
FROM map_users
GROUP BY year
ORDER BY year;


-- Business Problem 28: Dense Rank States by Registered Users

SELECT
    state,
    SUM(registered_users) AS total_users,
    DENSE_RANK() OVER(ORDER BY SUM(registered_users) DESC) AS state_rank
FROM map_users
GROUP BY state;


-- Business Problem 29: Year-over-Year Transaction Growth

SELECT
    year,
    ROUND(SUM(transaction_amount),2) AS total_amount
FROM agg_transactions
GROUP BY year
ORDER BY year;


-- Business Problem 30: Quarter-over-Quarter Transaction Growth

SELECT
    year,
    quarter,
    ROUND(SUM(transaction_amount),2) AS total_amount,
    ROUND(
        SUM(transaction_amount) -
        LAG(SUM(transaction_amount)) OVER(ORDER BY year, quarter),
    2) AS growth
FROM agg_transactions
GROUP BY year, quarter
ORDER BY year, quarter;


-- Business Problem 31: State Contribution to Total Transaction Amount

SELECT
    state,
    ROUND(SUM(transaction_amount),2) AS total_amount,
    ROUND(
        SUM(transaction_amount) * 100.0 /
        SUM(SUM(transaction_amount)) OVER(),
    2) AS contribution_percentage
FROM agg_transactions
GROUP BY state
ORDER BY contribution_percentage DESC;


-- Business Problem 32: Top 5 States Every Year

SELECT *
FROM
(
    SELECT
        year,
        state,
        ROUND(SUM(transaction_amount),2) AS total_amount,
        ROW_NUMBER() OVER(
            PARTITION BY year
            ORDER BY SUM(transaction_amount) DESC
        ) AS rn
    FROM agg_transactions
    GROUP BY year, state
) x
WHERE rn <= 5;


-- Business Problem 33: Transaction Amount per User

SELECT
    a.state,
    ROUND(SUM(a.transaction_amount),2) AS total_amount,
    SUM(m.registered_users) AS total_users,
    ROUND(
        SUM(a.transaction_amount) /
        SUM(m.registered_users),
    2) AS amount_per_user
FROM agg_transactions a
JOIN map_users m
ON a.state = m.state
AND a.year = m.year
AND a.quarter = m.quarter
GROUP BY a.state
ORDER BY amount_per_user DESC;


-- Business Problem 34: Highest Average Transaction Value

SELECT
    state,
    ROUND(AVG(transaction_amount),2) AS avg_transaction_amount
FROM agg_transactions
GROUP BY state
ORDER BY avg_transaction_amount DESC
LIMIT 10;


-- Business Problem 35: Region-wise Contribution Percentage

SELECT
    region,
    ROUND(SUM(transaction_amount),2) AS total_amount,
    ROUND(
        SUM(transaction_amount) * 100.0 /
        SUM(SUM(transaction_amount)) OVER(),
    2) AS contribution_percentage
FROM agg_transactions
GROUP BY region
ORDER BY contribution_percentage DESC;


-- Business Problem 36: State with Highest App Engagement

SELECT
    state,
    ROUND(
        SUM(app_opens)::NUMERIC /
        SUM(registered_users),
    2) AS app_opens_per_user
FROM map_users
GROUP BY state
ORDER BY app_opens_per_user DESC
LIMIT 10;


-- Business Problem 37: Year-wise Registered Users

SELECT
    year,
    SUM(registered_users) AS total_users
FROM map_users
GROUP BY year
ORDER BY year;


-- Business Problem 38: Top 10 Districts by App Opens

SELECT
    district,
    SUM(app_opens) AS total_app_opens
FROM map_users
GROUP BY district
ORDER BY total_app_opens DESC
LIMIT 10;


-- Business Problem 39: State-wise Average App Opens

SELECT
    state,
    ROUND(AVG(app_opens),2) AS avg_app_opens
FROM map_users
GROUP BY state
ORDER BY avg_app_opens DESC;
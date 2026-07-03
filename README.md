# PhonePe-Digital-Payments-and-User-Behavior-Analytics--using_SQL

📌 Project Overview

This project is an end-to-end SQL-based data analysis of PhonePe Pulse data — India's largest digital payments platform. Using PostgreSQL, the project explores transaction trends, user engagement, and geographic distribution of digital payments across Indian states, districts, and pincodes over multiple years and quarters.

The goal is to extract actionable business insights from raw transactional and user data using structured SQL queries — ranging from basic aggregations to advanced window functions — that mirror real-world analyst workflows: identifying growth trends, ranking top-performing regions, measuring user engagement, and tracking market share across device brands.


🎯 Objective

To analyze PhonePe's transaction and user data at a national, regional, state, district, and pincode level in order to answer key business questions such as:


Where is digital payment adoption growing fastest?
Which states/regions contribute the most to overall transaction value?
How engaged are registered users (app opens vs. registrations)?
What does year-over-year and quarter-over-quarter growth look like?
Which mobile brands dominate the user base?
How are top districts and pincodes performing in transactions and registrations?



🗃️ Dataset Description

The dataset is structured into 8 core tables, mirroring the official PhonePe Pulse data categories:

TableDescriptionagg_transactionsState-level aggregated transaction data by type, year, and quarteragg_usersState-level aggregated registered user data by mobile brandmap_transactionsDistrict-level transaction data with geo-coordinatesmap_usersDistrict-level registered users and app opens with geo-coordinatestop_transactions_districtTop-performing districts by transaction volume/valuetop_transactions_pincodeTop-performing pincodes by transaction volume/valuetop_users_districtTop-performing districts by registered userstop_users_pincodeTop-performing pincodes by registered users

Key columns across tables: state, year, quarter, district/pincode, transaction_type, transaction_count, transaction_amount, registered_users, app_opens, brand, region, latitude, longitude.


🛠️ Tools & Technologies


Database: PostgreSQL
Language: SQL (DDL, DML, Aggregate Functions, Window Functions, Joins, Subqueries)
Concepts Used: GROUP BY aggregations, RANK/DENSE_RANK, ROW_NUMBER, LAG (growth analysis), running totals with window functions, contribution percentage analysis, multi-table JOINs, NULLIF for safe division



🔍 Business Problems Solved

The project answers 39 real-world business questions, organized into the following categories:

1. National-Level Metrics
Total transactions, total transaction amount, total registered users, total app opens.

2. State & Region-Wise Analysis
State-wise transaction count/amount, region-wise transaction and user analysis, top 10 states by amount and registered users, state ranking and contribution percentage.

3. Time-Based Trend Analysis
Quarter-wise and year-wise transaction trends, highest performing quarter, year-over-year and quarter-over-quarter growth using LAG(), running totals using window functions.

4. District & Pincode-Level Insights
Top 10 districts/pincodes by transaction amount, registered users, and app opens.

5. User Engagement Analysis
Average app opens per registered user (state-wise), state with highest app engagement, state-wise average app opens.

6. Mobile Brand / Market Share Analysis
Brand-wise user share, top 10 mobile brands, state-wise brand distribution.

7. Advanced Analytical Queries
Top 5 states every year (using ROW_NUMBER() + PARTITION BY), transaction amount per registered user (via multi-table JOIN), average transaction value by state, dense ranking of states by users.


💡 Key Insights (fill in with your actual output values)


Replace these placeholders with the real numbers once you run the queries on your dataset.




Total transactions processed: [value]
Total transaction amount: ₹[value]
Total registered users: [value]
Top-performing state by transaction amount: [state name]
Fastest-growing quarter: [quarter]
Leading mobile brand by user share: [brand name]
State with highest app engagement (opens per user): [state name]



📁 Project Structure

phonepe-pulse-sql-analysis/
│
├── schema.sql              # Table creation scripts (DDL)
├── business_queries.sql    # All 39 business problem queries
├── README.md                # Project documentation
└── insights_summary.md      # (optional) Key findings write-up


🚀 How to Run


Set up a PostgreSQL database and run the table creation scripts in schema.sql.
Load the PhonePe Pulse dataset into the respective tables.
Execute the queries in business_queries.sql sequentially or individually based on the business question you want answered.
(Optional) Connect the database to Power BI/Tableau for visualization.



📈 Future Scope


Build an interactive Power BI dashboard on top of these SQL insights
Automate data refresh using a Python ETL pipeline
Extend analysis to include insurance transaction data from PhonePe Pulse
Add predictive modeling for transaction growth forecasting



👤 Author

Vedansh Tiwari
LinkedIn | GitHub

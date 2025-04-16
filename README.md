# Task-6-Elevate-labs-DATA-ANALYST-INTERNSHIP

📊 Sales Trend Analysis using SQL
This project is part of a Data Analyst Internship and focuses on analyzing sales trends using structured SQL queries. The dataset contains two tables: Orderstask6 and Detailstask6, which simulate real-world sales order and transaction data. The analysis was performed using SQLite.

📁 Dataset Preparation and Import
I split and normalized the original dataset into two structured tables:

Orderstask6: Contains order-level information including order ID and order date.

Detailstask6: Contains transaction-level details like order ID and amount.

Both CSV files were imported into SQLite for relational database querying. This structure enabled efficient use of JOINs, aggregations, and filtering techniques.


🔍 SQL Query Execution and Analysis
After importing the data, I performed various SQL queries to extract and analyze insights from the sales dataset. Key SQL concepts applied include:

SELECT, WHERE, ORDER BY, GROUP BY for data retrieval and organization.

Aggregate functions like SUM(), AVG(), MAX(), MIN(), COUNT().

JOIN operations between orders and transaction tables to compute:

Monthly sales revenue

Order volumes

Top-performing months

Handling NULL values using COALESCE() for safe aggregation

Date parsing and formatting using SUBSTR() and strftime() for time-based grouping.

Each query was written and tested for performance and accuracy.

📌 Key Insights
Identified total revenue and average transaction amounts.

Discovered top 3 months by revenue.

Tracked monthly order volume trends.

Safely handled missing data and ensured accurate aggregation.

✅ Conclusion
This project strengthened my SQL skills in data analysis and gave me hands-on experience working with real-world datasets. I learned how to derive actionable business insights from raw data using SQL, which is essential for any data analyst role.

🛠️ Tools Used
SQLite

SQL (Core, Aggregates, Joins, Date Functions)

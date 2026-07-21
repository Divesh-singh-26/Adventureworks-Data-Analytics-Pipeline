# 📊 SQL Analysis Documentation

# Overview

This document describes the SQL analysis performed on the AdventureWorks Data Warehouse.

The warehouse follows a **Star Schema** consisting of Fact and Dimension tables designed for analytical reporting.

More than **60 SQL queries** were written to answer real-world business questions related to sales, customers, products, territories, and returns.

---

# Database Schema

## Fact Tables

- fact_sales
- fact_returns

## Dimension Tables

- dim_customers
- dim_products
- dim_categories
- dim_subcategories
- dim_calendar
- dim_territories

---

# SQL Topics Covered

The project demonstrates practical SQL skills including:

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- CASE WHEN
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- Common Table Expressions (CTEs) 
- Window Functions 
- Ranking Functions 
- Date Functions
- String Functions
- Subqueries

---

# Business Questions Answered

The SQL analysis focuses on answering key business questions such as:

- What is the total revenue?
- Which products generate the highest revenue?
- Which customers contribute the most sales?
- Which territories perform best?
- Which categories have the highest returns?
- How do sales change over time?
- Which customer segments generate the highest profit?

---

# Revenue Analysis

The following analyses were performed:

- Total Revenue
- Total Profit
- Profit Margin
- Revenue by Year
- Revenue by Month
- Revenue by Category
- Revenue by Product
- Revenue by Territory
- Average Order Value
- Revenue Trend Analysis

Example Metrics

| Metric | Description |
|---------|-------------|
| Total Revenue | Total sales generated |
| Total Profit | Revenue minus product cost |
| Profit Margin | Profit percentage |

---

# Customer Analysis

Customer-focused analyses include:

- Total Customers
- Top 10 Customers by Revenue
- Revenue by Gender
- Revenue by Occupation
- Revenue by Education Level
- Revenue by Home Ownership
- Customer Age Analysis
- Average Revenue per Customer

Business Goal

Understand customer purchasing behaviour and identify high-value customer segments.

---

# Product Analysis

Product analyses include:

- Best Selling Products
- Lowest Selling Products
- Product Revenue
- Product Profit
- Revenue by Category
- Revenue by Subcategory
- Product Performance Ranking

Business Goal

Identify products contributing the most to business revenue and profitability.

---

# Territory Analysis

Geographical analyses include:

- Revenue by Country
- Revenue by Region
- Revenue by Territory
- Orders by Territory
- Profit by Territory

Business Goal

Evaluate regional sales performance.

---

# Returns Analysis

Return analyses include:

- Total Returned Quantity
- Return Rate
- Most Returned Products
- Returns by Territory
- Returns by Category

Business Goal

Identify products and regions with high return rates.

---

# Time Series Analysis

Time-based analyses include:

- Monthly Revenue Trend
- Yearly Revenue Trend
- Quarterly Sales
- Monthly Orders
- Seasonal Performance

Business Goal

Understand business growth and seasonality.

---

# Advanced SQL Features

The project demonstrates the use of:

- Aggregate Functions
- CASE Statements
- Multiple Table Joins
- Aliases
- Nested Queries 
- CTEs 
- Window Functions 

---


# Sample Query

Example: Total Revenue

```sql
SELECT
    ROUND(SUM(revenue),2) AS total_revenue
FROM fact_sales;
```

Example: Top 10 Customers

```sql
SELECT
    c.customer_key,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    ROUND(SUM(s.revenue),2) AS revenue
FROM fact_sales s
JOIN dim_customers c
ON s.customer_key = c.customer_key
GROUP BY c.customer_key, customer_name
ORDER BY revenue DESC
LIMIT 10;
```

---

# Business Value

The SQL analysis helps answer important business questions such as:

- Who are the highest-value customers?
- Which products generate the most profit?
- Which territories require attention?
- Which products have high return rates?
- How does revenue change over time?

These insights support data-driven business decisions.

---

# Skills Demonstrated

- Data Warehousing
- SQL Analytics
- Relational Database Design
- Star Schema Modeling
- Business Intelligence
- KPI Reporting
- Data Aggregation
- Multi-table Joins
- Performance-oriented Query Writing

---

# Summary

The SQL component of this project demonstrates how a structured data warehouse can be used to answer complex business questions using SQL.

By combining fact and dimension tables, the analysis provides actionable insights into sales performance, customer behavior, product trends, geographic performance, and return patterns.
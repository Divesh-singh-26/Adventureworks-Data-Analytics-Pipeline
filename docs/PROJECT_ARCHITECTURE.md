# 🏗️ Project Architecture

# Overview

The AdventureWorks Analytics Pipeline follows a modern analytics workflow that transforms raw CSV files into interactive business intelligence dashboards.

The project combines Python for ETL, MySQL for data warehousing, SQL for business analysis, and Power BI for visualization.

---

# Architecture Diagram

```
                     AdventureWorks Analytics Pipeline

                ┌─────────────────────────────────────┐
                │         Raw CSV Files               │
                │                                     │
                │ Customers                           │
                │ Products                            │
                │ Categories                          │
                │ Subcategories                       │
                │ Calendar                            │
                │ Territories                         │
                │ Returns                             │
                │ Sales 2015                          │
                │ Sales 2016                          │
                │ Sales 2017                          │
                └─────────────────────────────────────┘
                               │
                               ▼
                ┌─────────────────────────────────────┐
                │          Python ETL                 │
                │                                     │
                │ • Read CSV Files                    │
                │ • Data Cleaning                     │
                │ • Datatype Conversion               │
                │ • Feature Engineering               │
                │ • Validation                        │
                │ • Export Clean Data                 │
                └─────────────────────────────────────┘
                               │
                               ▼
                ┌─────────────────────────────────────┐
                │       Cleaned CSV Files             │
                │                                     │
                │ Dimension Tables                    │
                │ Fact Tables                         │
                └─────────────────────────────────────┘
                               │
                               ▼
                ┌─────────────────────────────────────┐
                │      MySQL Data Warehouse           │
                │                                     │
                │ Star Schema                         │
                │ Primary Keys                        │
                │ Foreign Keys                        │
                │ Fact & Dimension Tables             │
                └─────────────────────────────────────┘
                               │
                               ▼
                ┌─────────────────────────────────────┐
                │         SQL Analytics               │
                │                                     │
                │ Revenue Analysis                    │
                │ Customer Analysis                   │
                │ Product Analysis                    │
                │ Territory Analysis                  │
                │ Returns Analysis                    │
                └─────────────────────────────────────┘
                               │
                               ▼
                ┌─────────────────────────────────────┐
                │       Power BI Dashboard            │
                │                                     │
                │ Executive Dashboard                 │
                │ Sales Dashboard                     │
                │ Customer Dashboard                  │
                │ Product Dashboard                   │
                │ Returns Dashboard                   │
                └─────────────────────────────────────┘
```

---

# Project Components

## 1. Raw Data

The project starts with raw AdventureWorks CSV files stored in:

```
data/raw/
```

These files contain customer, product, sales, territory, returns, and calendar data.

---

## 2. Python ETL

Python is used to clean and transform the raw datasets.

Main tasks include:

- Reading CSV files
- Standardizing column names
- Handling missing values
- Converting data types
- Creating calculated columns
- Exporting cleaned datasets

For sales data, an automation pipeline processes multiple yearly files into a single `fact_sales.csv`.

---

## 3. Cleaned Data

The transformed datasets are stored in:

```
data/cleaned/
```

These files are analytics-ready and used to populate the data warehouse.

---

## 4. MySQL Data Warehouse

The cleaned datasets are loaded into MySQL.

The warehouse follows a **Star Schema** consisting of:

### Fact Tables

- fact_sales
- fact_returns

### Dimension Tables

- dim_customers
- dim_products
- dim_categories
- dim_subcategories
- dim_calendar
- dim_territories

---

## 5. SQL Analytics

Business questions are answered using SQL.

Areas of analysis include:

- Revenue
- Profit
- Customers
- Products
- Territories
- Returns
- Time trends

The project contains over **60 SQL queries** organized by business domain.

---

## 6. Power BI Dashboard

Power BI connects to the warehouse to create interactive dashboards.

Dashboard pages include:

- Executive Overview
- Sales Analysis
- Customer Analysis
- Product & Geographic Analysis
- Returns Analysis

---

# Technology Stack

| Layer | Technology |
|--------|------------|
| Programming | Python |
| Data Processing | Pandas |
| Database | MySQL |
| Query Language | SQL |
| Visualization | Power BI |
| Version Control | Git |
| Repository | GitHub |

---

# Data Flow

```
Raw CSV Files
      │
      ▼
Python ETL
      │
      ▼
Cleaned CSV Files
      │
      ▼
MySQL Data Warehouse
      │
      ▼
SQL Analysis
      │
      ▼
Power BI Dashboard
      │
      ▼
Business Insights
```

---

# Folder Structure

```
AdventureWorks_Analytics/

├── data/
│   ├── raw/
│   └── cleaned/
│
├── notebooks/
│
├── sql/
│
├── powerbi/
│
├── images/
│
├── docs/
│
├── README.md
├── requirements.txt
└── .gitignore
```

---

# Design Principles

The project was designed with the following principles:

- Modular structure
- Reusable ETL logic
- Consistent naming conventions
- Star Schema data modeling
- Scalable sales automation
- Clear documentation
- Interactive reporting

---

# Future Enhancements

Potential improvements include:

- Automated SQL data loading
- Workflow orchestration with Apache Airflow
- Cloud storage integration
- Incremental data loading
- Scheduled Power BI refresh
- Containerization using Docker

---

# Summary

The AdventureWorks Analytics Pipeline demonstrates a complete end-to-end analytics workflow.

Starting from raw CSV files, the project applies Python-based ETL, stores cleaned data in a MySQL data warehouse, performs SQL analysis, and presents insights through interactive Power BI dashboards.

The modular design makes the project maintainable, scalable, and suitable for demonstrating practical data analytics skills.
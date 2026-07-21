# 📚 Data Dictionary

# Overview

This document describes the datasets, tables, columns, and relationships used in the AdventureWorks Analytics Pipeline.

The project follows a **Star Schema** design consisting of **Fact Tables** and **Dimension Tables**, optimized for SQL analysis and Power BI reporting.

---

# Star Schema

```
                    dim_calendar
                         │
                         │
                         │
dim_customers ─── fact_sales ─── dim_products
                         │
                         │
                  dim_territories
                         │
                         │
                    fact_returns
```

---

# Fact Tables

## 1. fact_sales

### Description

Stores transactional sales data at the **order line level**.

### Primary Key

Composite Primary Key

```
(order_number, order_line_item)
```

### Columns

| Column | Data Type | Description |
|----------|-----------|-------------|
| order_date | DATETIME | Date when the order was placed |
| stock_date | DATETIME | Date when the product became available |
| order_number | VARCHAR | Unique sales order number |
| product_key | INT | References `dim_products` |
| customer_key | INT | References `dim_customers` |
| territory_key | INT | References `dim_territories` |
| order_line_item | INT | Line item number within an order |
| order_quantity | INT | Number of units sold |
| product_price | DECIMAL | Selling price per unit |
| product_cost | DECIMAL | Cost per unit |
| revenue | DECIMAL | Total sales amount |
| profit | DECIMAL | Revenue minus product cost |
| profit_margin | DECIMAL | Profit expressed as a percentage of revenue |

---

## 2. fact_returns

### Description

Stores returned product transactions.

### Columns

| Column | Data Type | Description |
|----------|-----------|-------------|
| return_date | DATETIME | Date of product return |
| territory_key | INT | References `dim_territories` |
| product_key | INT | References `dim_products` |
| return_quantity | INT | Number of units returned |

---

# Dimension Tables

## 1. dim_customers

### Description

Contains customer demographic information.

| Column | Data Type | Description |
|----------|-----------|-------------|
| customer_key | INT | Unique customer identifier |
| prefix | VARCHAR | Customer title |
| first_name | VARCHAR | Customer first name |
| last_name | VARCHAR | Customer last name |
| birth_date | DATE | Customer birth date |
| marital_status | VARCHAR | Marital status |
| gender | VARCHAR | Customer gender |
| email_address | VARCHAR | Customer email |
| annual_income | INT | Annual income |
| total_children | INT | Number of children |
| education_level | VARCHAR | Education level |
| occupation | VARCHAR | Occupation |
| home_owner | VARCHAR | Home ownership status |
| age | INT | Customer age |

---

## 2. dim_products

### Description

Contains product information.

| Column | Data Type | Description |
|----------|-----------|-------------|
| product_key | INT | Unique product identifier |
| product_subcategory_key | INT | Product subcategory key |
| product_name | VARCHAR | Product name |
| model_name | VARCHAR | Product model |
| product_color | VARCHAR | Product color |
| product_size | VARCHAR | Product size |
| product_style | VARCHAR | Product style |
| product_cost | DECIMAL | Product cost |
| product_price | DECIMAL | Product selling price |

---

## 3. dim_categories

### Description

Stores high-level product categories.

| Column | Data Type | Description |
|----------|-----------|-------------|
| category_key | INT | Category identifier |
| category_name | VARCHAR | Product category |

---

## 4. dim_subcategories

### Description

Stores product subcategories.

| Column | Data Type | Description |
|----------|-----------|-------------|
| subcategory_key | INT | Subcategory identifier |
| category_key | INT | Parent category identifier |
| subcategory_name | VARCHAR | Product subcategory |

---

## 5. calendar

### Description

Calendar dimension used for time intelligence.

| Column | Data Type | Description |
|----------|-----------|-------------|
| date | DATE | Calendar date |
| day | INT | Day of month |
| month | INT | Month number |
| month_name | VARCHAR | Month name |
| quarter | INT | Quarter number |
| year | INT | Calendar year |
| week | INT | Week number |

---

## 6. territories

### Description

Contains geographical sales information.

| Column | Data Type | Description |
|----------|-----------|-------------|
| territory_key | INT | Territory identifier |
| region | VARCHAR | Sales region |
| country | VARCHAR | Country |
| continent | VARCHAR | Continent |

---

# Table Relationships

| Parent Table | Child Table | Relationship |
|---------------|------------|--------------|
| customers | fact_sales | customer_key |
| products | fact_sales | product_key |
| territories | fact_sales | territory_key |
| products | fact_returns | product_key |
| territories | fact_returns | territory_key |

---

# Naming Convention

| Prefix | Meaning |
|----------|---------|
| dim_ | Dimension Table |
| fact_ | Fact Table |

Examples:

- dim_customers
- dim_products
- fact_sales
- fact_returns

---

# Data Types Used

| Data Type | Purpose |
|------------|----------|
| INT | Keys, quantities, counts |
| VARCHAR | Text fields |
| DATE | Calendar dates |
| DATETIME | Transaction timestamps |
| DECIMAL | Monetary values and percentages |

---

# Notes

- The project follows a **Star Schema** design.
- `fact_sales` uses a **composite primary key** (`order_number`, `order_line_item`).
- Foreign keys establish relationships between fact and dimension tables.
- Column names are standardized using **snake_case** during the ETL process.
- Revenue, Profit, and Profit Margin are calculated during feature engineering in Python.
- Cleaned datasets are exported as CSV files before being loaded into MySQL for SQL analysis and Power BI reporting.
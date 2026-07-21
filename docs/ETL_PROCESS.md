# 🏛️ Data Warehouse Design

# Overview

The AdventureWorks Analytics project uses a **Star Schema** data warehouse to organize data for reporting and business intelligence.

The warehouse separates transactional data (Fact Tables) from descriptive data (Dimension Tables), enabling fast analytical queries and efficient Power BI reporting.

---

# Why Star Schema?

A Star Schema was chosen because it provides:

- Faster analytical queries
- Simpler SQL joins
- Better Power BI performance
- Easy scalability
- Easy understanding of business data

---

# Data Warehouse Architecture

```
                        dim_calendar
                             │
                             │
                             │
dim_customers ─────── fact_sales ─────── dim_products
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

### Purpose

Stores each sales transaction at the order line level.

### Primary Key

The `fact_sales` table uses a **composite primary key** consisting of:

```
(order_number, order_line_item)
```

This ensures that each row represents a unique line item within an order.

### Foreign Keys

| Column | References |
|---------|------------|
| customer_key | dim_customers |
| product_key | dim_products |
| territory_key | dim_territories |

### Measures

- Order Quantity
- Product Price
- Product Cost
- Revenue
- Profit
- Profit Margin

## 2. fact_returns

### Purpose

Stores returned products.

### Foreign Keys

| Column | References |
|---------|------------|
| product_key | dim_products |
| territory_key | dim_territories |

### Measures

- Return Quantity

---

# Dimension Tables

## dim_customers

Stores customer information.

Key:

```
customer_key
```

Contains:

- Customer Name
- Gender
- Income
- Occupation
- Education
- Home Owner
- Age

---

## dim_products

Stores product information.

Key

```
product_key
```

Contains

- Product Name
- Category
- Subcategory
- Price
- Cost

---

## dim_categories

Stores product categories.

Primary Key

```
category_key
```

---

## dim_subcategories

Stores product subcategories.

Primary Key

```
subcategory_key
```

---

## dim_calendar

Stores date information for time intelligence.

Primary Key

```
date
```

Contains

- Year
- Quarter
- Month
- Week
- Day

---

## dim_territories

Stores sales territory information.

Primary Key

```
territory_key
```

Contains

- Region
- Country
- Continent (if available)

---

# Relationships

| Parent Table | Child Table | Key |
|---------------|------------|------|
| dim_customers | fact_sales | customer_key |
| dim_products | fact_sales | product_key |
| dim_territories | fact_sales | territory_key |
| dim_products | fact_returns | product_key |
| dim_territories | fact_returns | territory_key |

---

# Data Flow

```
Raw CSV Files
        │
        ▼
Python ETL
        │
        ▼
Clean CSV Files
        │
        ▼
MySQL Data Warehouse
        │
        ▼
SQL Analysis
        │
        ▼
Power BI Dashboard
```

---

# Warehouse Naming Convention

| Table Type | Prefix | Example |
|-------------|--------|---------|
| Dimension | dim_ | dim_customers |
| Fact | fact_ | fact_sales |

This naming convention improves readability and follows common data warehousing practices.

---

# Business Benefits

The warehouse design provides:

- Consistent reporting
- Faster aggregations
- Simplified joins
- Better dashboard performance
- Reusable analytical model

---

# Technologies Used

- Python
- Pandas
- MySQL
- SQL
- Power BI

---

# Summary

The AdventureWorks Data Warehouse follows a Star Schema design with:

- 2 Fact Tables
- 6 Dimension Tables
- Well-defined relationships
- Optimized structure for SQL analytics and Power BI reporting

This design supports efficient business intelligence and scalable analytical workflows.
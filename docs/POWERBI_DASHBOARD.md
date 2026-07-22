# 📊 Power BI Dashboard Documentation

# Overview

The AdventureWorks Power BI Dashboard provides an interactive view of sales performance, customer behavior, product performance, geographic trends, and product returns.

The dashboard is built on a Star Schema data model and uses cleaned datasets generated through the Python ETL pipeline and SQL data warehouse.

The report is designed to help business users monitor key performance indicators (KPIs), identify trends, and make data-driven decisions.

---

# Dashboard Objectives

The dashboard enables users to:

- Monitor overall business performance
- Track sales and profit trends
- Analyze customer behavior
- Evaluate product performance
- Compare territory performance
- Monitor return rates
- Identify business opportunities

---

# Data Source

The dashboard uses data from the following warehouse tables:

Fact Tables

- fact_sales
- fact_returns

Dimension Tables

- dim_customers
- dim_products
- dim_categories
- dim_subcategories
- dim_calendar
- dim_territories

---

# Dashboard Pages

The report consists of five interactive pages.

---

# Page 1 — Executive Dashboard

## Purpose

Provide a high-level overview of business performance.

### KPIs

- Total Revenue
- Total Profit
- Profit Margin
- Total Orders
- Total Customers
- Total Quantity Sold
- Total Return Quantity

### Visuals

- Revenue Trend
- Revenue by Country
- Revenue by Category
- Top Products
- Monthly Sales Trend

### Business Questions Answered

- How much revenue has the business generated?
- Is revenue increasing over time?
- Which countries generate the highest revenue?
- Which product categories contribute the most?

---

# Page 2 — Sales Analysis

## Purpose

Analyze overall sales performance.

### KPIs

- Revenue
- Profit
- Quantity Sold
- Average Order Value

### Visuals

- Monthly Revenue Trend
- Revenue by Category
- Revenue by Territory
- Revenue by Product
- Top 10 Products

### Business Questions

- Which months generate the highest sales?
- Which products perform best?
- Which territories generate the highest revenue?

---

# Page 3 — Customer Analysis

## Purpose

Understand customer demographics and purchasing behavior.

### KPIs

- Total Customers
- Average Revenue per Customer

### Visuals

- Revenue by Gender
- Revenue by Occupation
- Revenue by Education Level
- Revenue by Home Owner
- Revenue by Age Group
- Customer Segmentation

### Business Questions

- Which customer segment generates the highest revenue?
- Which occupation spends the most?
- How does revenue vary across age groups?

---

# Page 4 — Product & Geographic Analysis

## Purpose

Evaluate product and regional performance.

### Visuals

- Revenue by Product
- Revenue by Category
- Revenue by Subcategory
- Revenue by Country
- Revenue by Region
- Territory Performance

### Business Questions

- Which products are most profitable?
- Which product categories perform best?
- Which countries generate the most revenue?

---

# Page 5 — Returns Analysis

## Purpose

Monitor product returns and identify improvement opportunities.

### KPIs

- Total Returned Quantity
- Return Rate

### Visuals

- Returns by Product
- Returns by Category
- Returns by Territory
- Monthly Returns Trend
- Top Returned Products

### Business Questions

- Which products are returned most frequently?
- Which categories have the highest returns?
- Which territories experience the highest return rates?

---

# Filters and Slicers

The dashboard includes interactive slicers to allow users to filter reports dynamically.

Available slicers include:

- Year
- Month
- Country
- Territory
- Product Category
- Product Subcategory

Selecting a value updates all visuals on the page automatically.

---

# Navigation

Users can navigate between pages using the page tabs at the bottom of the report.

Each page focuses on a different business area while maintaining consistent filters and interactions.

---

# Color Palette

The dashboard uses a consistent color palette to improve readability.

| Color | Represents |
|---------|------------|
| Blue | Revenue |
| Green | Customers |
| Orange | Quantity |
| Red | Returns |

Using consistent colors across all pages makes the report easier to interpret.

---

# Dashboard Design Principles

The dashboard was designed following business intelligence best practices.

- Consistent layout
- Minimal visual clutter
- Interactive filtering
- Clear KPI cards
- Appropriate chart selection
- Responsive report design

---

# Business Value

The dashboard helps decision-makers to:

- Track company performance
- Identify high-performing products
- Understand customer behavior
- Compare regional sales
- Monitor return trends
- Support strategic planning

---

# Dashboard Workflow

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

# Dashboard Preview

# 📷 Dashboard Preview

## Executive Dashboard

![Executive Dashboard](../Dashboard%20images/Executive%20Dashboard.PNG)

---

## Sales Dashboard

![Sales Analysis Dashboard](../Dashboard%20images/Sales%20Analysis%20Dashboard.PNG)

---

## Customer Dashboard

![Customer Analysis Dashboard](../Dashboard%20images/Customer%20Analysis%20Dashboard.PNG)

---

## Product & Geographic Dashboard

![Product & Geographic Dashboard](../Dashboard%20images/Product%20%26%20Geographic%20Analysis%20Dashboard.PNG)

---

## Returns Dashboard

![Return Analysis Dashboard](../Dashboard%20images/Return%20Analysis%20Dashboard.PNG)
```


# Summary

The Power BI dashboard transforms raw sales data into an interactive business intelligence solution.

By combining KPIs, charts, filters, and drill-down capabilities, the dashboard enables users to explore sales performance, customer behavior, product trends, geographic insights, and return analysis in a single reporting environment.

# 📊 AdventureWorks Analytics Pipeline

An end-to-end Data Analytics project that transforms raw AdventureWorks sales data into actionable business insights using **Python, MySQL, SQL, and Power BI**.

The project demonstrates the complete analytics lifecycle, including data cleaning, automation, data warehousing, SQL analysis, and interactive dashboard development.

---

# 🚀 Project Overview

This project was built to simulate a real-world business analytics workflow.

The pipeline:

- Extracts raw AdventureWorks datasets
- Cleans and transforms the data using Python
- Automates yearly sales data processing
- Loads analytics-ready datasets into MySQL
- Performs SQL business analysis
- Visualizes KPIs and trends in Power BI

---

# 🛠️ Technology Stack

| Technology | Purpose |
|------------|---------|
| Python | ETL & Automation |
| Pandas | Data Cleaning & Transformation |
| MySQL | Data Warehouse |
| SQL | Business Analysis |
| Power BI | Dashboard & Visualization |
| Git | Version Control |
| GitHub | Project Repository |

---

# 📂 Project Structure

```text
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
├── docs/
│   ├── DATA_DICTIONARY.md
│   ├── ETL_PROCESS.md
│   ├── DATA_WAREHOUSE.md
│   ├── SQL_ANALYSIS.md
│   ├── POWERBI_DASHBOARD.md
│   ├── AUTOMATION.md
│   ├── PROJECT_ARCHITECTURE.md
│   └── BUSINESS_INSIGHTS.md
│
├── images/
│
├── README.md
├── requirements.txt
└── .gitignore
```

---

# 📈 Project Workflow

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
SQL Business Analysis
       │
       ▼
Power BI Dashboard
```

---

# 📊 Data Warehouse

The project uses a **Star Schema**.

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

### Primary Key

The `fact_sales` table uses a **composite primary key**:

```
(order_number, order_line_item)
```

---

# 🤖 ETL Features

- Data Cleaning
- Datatype Conversion
- Feature Engineering
- Revenue Calculation
- Profit Calculation
- Profit Margin Calculation
- Automated Sales File Processing
- Logging
- Data Validation

---

# 📊 SQL Analysis

The project includes **60+ SQL queries** covering:

- Revenue Analysis
- Customer Analysis
- Product Analysis
- Territory Analysis
- Returns Analysis
- Time-Series Analysis

---

# 📉 Power BI Dashboard

The dashboard contains five interactive report pages:

- Executive Dashboard
- Sales Analysis
- Customer Analysis
- Product & Geographic Analysis
- Returns Analysis

---

# 📷 Dashboard Preview



## Executive Dashboard

![Executive Dashboard](./dashboard-images/executive-dashboard.png)

---

## Sales Dashboard

![Sales Dashboard](Dashboard images/Sales Analysis Dashboard.png)

---

## Customer Dashboard

![Customer Dashboard](Dashboard images/Customer Analysis Dashboard.png)

---

## Product & Geographic Dashboard

![Product & Geographic Dashboard](./Dashboard%20images/Product%20%26%20Geographic%20Analysis%20Dashboard.PNG)

---

## Returns Dashboard

![Returns Dashboard](Dashboard images/Return Analysis Dashboard.png)
```


---

# 📚 Documentation

Detailed project documentation is available in the **docs/** folder.

| Document | Description |
|----------|-------------|
| DATA_DICTIONARY.md | Dataset structure |
| ETL_PROCESS.md | ETL workflow |
| DATA_WAREHOUSE.md | Star schema design |
| SQL_ANALYSIS.md | SQL queries & business questions |
| POWERBI_DASHBOARD.md | Dashboard explanation |
| AUTOMATION.md | Sales automation pipeline |
| PROJECT_ARCHITECTURE.md | End-to-end architecture |
| BUSINESS_INSIGHTS.md | Key analytical findings |

---

# 💼 Skills Demonstrated

- Data Cleaning
- ETL Pipeline Development
- Python Automation
- Pandas
- MySQL
- SQL
- Star Schema Modeling
- Feature Engineering
- Data Warehousing
- Business Intelligence
- Power BI Dashboard Design
- KPI Reporting
- Git & GitHub

---

# 🚀 Future Enhancements

- Automated database loading
- Apache Airflow orchestration
- Incremental data loading
- Docker containerization
- Cloud deployment
- Scheduled Power BI refresh

---

# 📬 Contact

**Divesh Singh**

GitHub: https://github.com/Divesh-singh-26


---


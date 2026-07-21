# 🤖 Sales Data Automation Pipeline

# Overview

The AdventureWorks dataset contains sales data split across multiple yearly CSV files.

Instead of cleaning each file manually, a reusable Python automation pipeline was developed to automatically process all yearly sales files into a single consolidated dataset.

The pipeline applies the same cleaning and transformation logic to every file, ensuring consistency, reducing manual effort, and making the solution scalable for future data.

---

# Objective

The automation pipeline was built to:

- Eliminate repetitive manual processing
- Apply consistent data cleaning rules
- Combine multiple yearly datasets
- Generate a single analytical fact table
- Support future sales files without modifying the code

---

# Input Files

The pipeline automatically detects all yearly sales files stored in:

```
data/raw/
```

Example:

```
AdventureWorks_Sales_2015.csv
AdventureWorks_Sales_2016.csv
AdventureWorks_Sales_2017.csv
```

---

# Output

The processed data is exported as:

```
data/cleaned/fact_sales.csv
```

This consolidated dataset is then used for:

- MySQL Data Warehouse
- SQL Analysis
- Power BI Dashboard

---

# Libraries Used

| Library | Purpose |
|----------|----------|
| pandas | Data manipulation |
| pathlib | Cross-platform file path handling |
| glob | Automatically detect yearly sales files |
| os | File name handling |
| logging | Progress and error tracking |

---

# Pipeline Workflow

```
Locate Sales Files
        │
        ▼
Read CSV File
        │
        ▼
Standardize Column Names
        │
        ▼
Convert Date Columns
        │
        ▼
Feature Engineering
        │
        ▼
Append Clean Data
        │
        ▼
Repeat for Next File
        │
        ▼
Merge All Years
        │
        ▼
Export fact_sales.csv
```

---

# Step 1 — Detect Sales Files

The pipeline searches the raw data folder for all yearly sales files.

```python
sales_files = glob.glob(
    str(raw_sales_path / "AdventureWorks_Sales_*.csv")
)
```

Using a wildcard pattern means that any future yearly sales file following the same naming convention will automatically be included.

---

# Step 2 — Read Each File

Each file is processed inside a loop.

```python
for file in sales_files:
```

This removes the need to manually read each yearly dataset.

---

# Step 3 — Data Cleaning

Each dataset is passed to the reusable cleaning function.

The cleaning function performs:

- Standardized column names
- Date conversion
- Data type validation

Example:

```python
df = clean_sales(df)
```

---

# Step 4 — Feature Engineering

Business metrics are created during processing.

Calculated columns include:

- Revenue
- Profit
- Profit Margin

These metrics simplify downstream analysis in SQL and Power BI.

---

# Step 5 — Merge All Years

After cleaning, each yearly dataset is added to a list.

```python
sales_list.append(df)
```

Finally, all years are merged into a single DataFrame.

```python
fact_sales = pd.concat(
    sales_list,
    ignore_index=True
)
```

---

# Step 6 — Export

The final dataset is exported as:

```python
fact_sales.to_csv(
    cleaned_path / "fact_sales.csv",
    index=False
)
```

---

# Logging

The pipeline includes logging to monitor progress and identify errors.

Example messages:

```
Reading AdventureWorks_Sales_2015.csv

Reading AdventureWorks_Sales_2016.csv

Reading AdventureWorks_Sales_2017.csv

File Loaded Successfully
```

If an error occurs during processing, it is captured and written to the log without stopping the entire pipeline.

---

# Benefits

The automation pipeline provides several advantages:

- Eliminates repetitive manual work
- Ensures consistent transformations
- Reduces the risk of human error
- Easily scales to additional yearly files
- Improves maintainability

---

# Scalability

The pipeline automatically processes any new yearly sales file that follows the naming convention.

Example:

```
AdventureWorks_Sales_2018.csv
AdventureWorks_Sales_2019.csv
AdventureWorks_Sales_2020.csv
```

No code changes are required.

---

# Business Value

Automating repetitive ETL tasks allows analysts to spend less time preparing data and more time generating insights.

The pipeline ensures that all sales data is processed consistently before being loaded into the data warehouse and visualized in Power BI.

---

# Summary

The automated sales pipeline transforms multiple yearly sales datasets into a single analytics-ready fact table.

By combining Python, Pandas, pathlib, glob, and logging, the solution is reusable, scalable, and easy to maintain.

This approach reflects a common ETL pattern used in modern analytics workflows.
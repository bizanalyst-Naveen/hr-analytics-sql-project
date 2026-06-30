# HR Employee Database Analysis using MySQL

An end-to-end HR analytics project built entirely in **MySQL** — covering database design, data loading, and 50 business queries that answer real HR questions around headcount, compensation, attrition, and performance.

## 📂 Project Structure

| File | Description |
|---|---|
| `01_Create_Database.sql` | Database and table schema (Departments, Cities, Education, Employees, Performance) with primary/foreign key constraints |
| `02_Insert_Master_Data.sql` | Reference/master data for Departments, Cities, and Education |
| `Employee_Data.csv` | Employee records (demographics, department, city, education, salary, experience, hire date) |
| `Performance_Data.csv` | Employee performance ratings and attrition status |
| `03_Business_queries.sql` | 50 SQL queries solving real HR business problems |

## 🗂️ Schema Overview

- **Departments** — DepartmentID, DepartmentName
- **Cities** — CityID, CityName
- **Education** — EducationID, Education
- **Employees** — EmployeeID, Name, Gender, DepartmentID, CityID, EducationID, Salary, Experience, HireDate
- **Performance** — PerformanceID, EmployeeID, Rating (1–5), Attrition (Yes/No)

All tables are linked via foreign keys, forming a simple relational HR data model.

## 🔍 What the Queries Cover

The 50 queries in `03_Business_queries.sql` are grouped from basic to advanced:

- **Basic aggregations** — headcount, gender distribution, average/min/max salary
- **Group-by analysis** — salary, experience, and headcount by department/city/education
- **Filtering & subqueries** — above-average earners, tenure-based filters, department-level comparisons
- **Window functions** — `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`, running totals, `LAG()` for salary/hiring trends
- **CTEs** — top earners per department, multi-step HR risk scoring
- **Performance & attrition analysis** — attrition rate by department/city, average ratings, at-risk employee flagging
- **Statistical analysis** — correlation between experience and salary
- **Executive summary** — a single rollup query combining headcount, attrition rate, average performance, compensation, and at-risk employee count for leadership reporting

## 🛠️ Tools Used

- **MySQL** — schema design, data loading, and query development

## 🚀 How to Run

1. Run `01_Create_Database.sql` to create the database and tables.
2. Load `Employee_Data.csv` and `Performance_Data.csv` into the `Employees` and `Performance` tables (via MySQL Workbench's Table Data Import Wizard or `LOAD DATA INFILE`).
3. Run `02_Insert_Master_Data.sql` to populate Departments, Cities, and Education.
4. Run any query from `03_Business_queries.sql` to explore the analysis.

## 📚 SQL Concepts Demonstrated

- Joins (INNER JOIN)
- Aggregate Functions
- GROUP BY and HAVING
- Correlated Subqueries
- Window Functions
  - RANK()
  - DENSE_RANK()
  - ROW_NUMBER()
  - LAG()
- Common Table Expressions (CTEs)
- CASE Statements
- Foreign Key Relationships
- Analytical Queries

## 📈 Sample Business Questions Solved

- Which departments have the highest attrition?
- Which cities have the highest average salary?
- Which employees earn above their department average?
- Which employees are eligible for promotion?
- Which employees are at risk of leaving?
- Which department contributes most to salary expenditure?

## 📊 Key Outcomes

- Designed a relational HR database with 5 interconnected tables.
- Imported and managed employee and performance datasets using MySQL.
- Developed 50 business-focused SQL queries ranging from basic aggregations to advanced analytical queries.
- Generated insights on attrition, compensation, employee performance, and promotion readiness.
- Applied advanced SQL concepts including window functions, CTEs, and correlated subqueries.

## 📌 About

This project was built to practice and showcase core to advanced SQL skills — joins, aggregations, subqueries, window functions, CTEs, and business-driven analytical thinking — using a realistic HR dataset.

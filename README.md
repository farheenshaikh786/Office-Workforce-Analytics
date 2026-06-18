# 📊 FinSight — Consumer Complaints Intelligence Dashboard
### Built with Microsoft Power BI | Data Source: CFPB 2013–2017

An end-to-end **Power BI analytics project** analyzing **11,110 consumer complaints** filed with the Consumer Financial Protection Bureau (CFPB) between 2013–2017.

> 🖥️ **Live Dashboard:** [farheenshaikh786.github.io/finsight-complaints-dashboard](https://farheenshaikh786.github.io/finsight-complaints-dashboard)

---

## 🛠️ Tools & Technologies

| Tool | Usage |
|------|-------|
| **Microsoft Power BI Desktop** | Dashboard design, DAX measures, data modeling |
| **Power Query (M Language)** | Data cleaning & transformation |
| **DAX** | KPI calculations, dynamic filtering |
| **SQL** | Data extraction & exploratory analysis |
| **Excel / CSV** | Raw data source (CFPB dataset) |

---

## 📌 Project Overview

This project was developed as part of my **Data Analytics Portfolio** to demonstrate skills in:
- Data cleaning and transformation using **Power Query**
- Writing **SQL queries** for data exploration and validation
- Building calculated KPIs using **DAX measures**
- Designing interactive, drill-through enabled **Power BI reports**
- Publishing insights via **Power BI Publish to Web**

---

## 📊 Dashboard Pages

### Page 1 — Executive Summary
- Total Complaints KPI card
- Timely Response Rate
- Companies & States covered
- Year-over-year trend line

### Page 2 — Product & Company Analysis
- Complaints by Product (horizontal bar)
- Top 10 Companies by volume
- Response type breakdown (donut chart)

### Page 3 — Geographic View
- Top 10 States by complaint volume
- State-level filtering slicer

---

## 🔍 Key DAX Measures Used

```DAX
Timely Response Rate =
DIVIDE(
    COUNTROWS(FILTER(Complaints, Complaints[Timely response?] = "Yes")),
    COUNTROWS(Complaints)
) * 100

Total Complaints = COUNTROWS(Complaints)

YoY Change =
VAR CurrentYear = CALCULATE([Total Complaints], DATESYTD('Date'[Date]))
VAR PrevYear = CALCULATE([Total Complaints], SAMEPERIODLASTYEAR('Date'[Date]))
RETURN DIVIDE(CurrentYear - PrevYear, PrevYear)
```

---

## 🗄️ SQL Queries Used for Analysis

```sql
-- Total complaints by product
SELECT Product, COUNT(*) AS Total_Complaints
FROM cfpb_complaints
GROUP BY Product
ORDER BY Total_Complaints DESC;

-- Timely response rate
SELECT
    Timely_Response,
    COUNT(*) AS Count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage
FROM cfpb_complaints
GROUP BY Timely_Response;

-- Top 10 companies by complaints
SELECT TOP 10 Company, COUNT(*) AS Complaints
FROM cfpb_complaints
GROUP BY Company
ORDER BY Complaints DESC;

-- Yearly complaint trend
SELECT YEAR(Date_Received) AS Year, COUNT(*) AS Total
FROM cfpb_complaints
GROUP BY YEAR(Date_Received)
ORDER BY Year;

-- Top states by volume
SELECT TOP 10 State, COUNT(*) AS Complaints
FROM cfpb_complaints
GROUP BY State
ORDER BY Complaints DESC;
```

---

## 📈 Key Insights

- 🏠 **Mortgage** is the #1 complained product — 4,001 cases (36% of total)
- 🏦 **Bank of America** leads with 1,162 complaints among all companies
- 📍 **California** is the highest-volume state with 1,658 complaints
- ✅ **98.6%** timely response rate across all companies
- 📅 **2013** recorded peak complaints — 6,045 in a single year

---

## 📁 Dataset

**Source:** Consumer Financial Protection Bureau (CFPB) — publicly available
**Records:** 11,110 complaints | **Period:** 2013–2017
**Fields:** Product, Sub-product, Company, State, Response Type, Timely Response, Submitted via

---

## 📸 Dashboard Preview

![FinSight Dashboard Preview](screenshot.png)
> *Power BI Desktop view — Interactive version available via live link above*

---

## 👩‍💻 About Me

**Farheen Shaikh** — Data Analyst | Power BI · SQL · Excel · Power Query

[![GitHub](https://img.shields.io/badge/GitHub-farheenshaikh786-181717?style=flat&logo=github)](https://github.com/farheenshaikh786)

---

*Designed & developed by Farheen Shaikh · Data: CFPB Open Data Portal*

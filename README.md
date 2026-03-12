# Unicorn Startups Data Analysis

## Project Overview

In this project, I analyzed **global unicorn startups** to understand what factors are associated with highly valued startup companies.

A **unicorn startup** is a privately held company valued at **$1 billion or more**. Over the last decade, these companies have become an important part of the global startup ecosystem.

The goal of this project was to explore patterns in **startup valuation, funding, geography, and investors**, and to identify trends that might explain why some startups achieve unicorn status.

To do this, I built an **end-to-end data analysis pipeline** using Python, SQL, and Power BI.

The project includes:

* Data collection through web scraping
* Data cleaning and preprocessing
* Feature engineering for deeper analysis
* SQL queries for structured analysis
* An interactive Power BI dashboard for visualization

---

# Dataset

The dataset was collected by scraping the **Crunchbase unicorn company list**.

Source:
[https://news.crunchbase.com/unicorn-company-list/](https://news.crunchbase.com/unicorn-company-list/)

The dataset contains information about **1705 unicorn startups** across different countries and industries.

Original columns in the dataset:

* Company
* Post Money Value
* Total Equity Funding
* Lead Investors Include
* Country
* Continent

However, the raw dataset required significant preprocessing before it could be used for analysis.

---

# Data Cleaning

The dataset contained several formatting issues that needed to be addressed.

For example, funding and valuation values were stored as strings such as:

* `$840B`
* `$500M`
* `$10K`

These values were converted into numeric format so they could be used for calculations.

Example conversion:

* `$840B` → `840,000,000,000`
* `$500M` → `500,000,000`
* `$10K` → `10,000`

Column names were also standardized using **snake_case** to improve readability.

In addition, missing values in the **country** and **continent** columns were resolved using mapping techniques.

After cleaning the dataset, the final version was exported as:

`unicorn_companies_cleaned.csv`

---

# Feature Engineering

To extract deeper insights, I created two additional features.

### Funding Efficiency

Funding efficiency measures how effectively a startup converts funding into valuation.

Funding Efficiency = Post Money Value ÷ Total Equity Funding

A higher score indicates that a company achieved a large valuation with relatively less funding.

This metric helps identify **capital-efficient startups**.

---

### Investor Count

The number of investors involved in each company was calculated by counting entries in the **lead_investors** column.

This helps analyze:

* investor participation
* startup popularity among venture capital firms

---

# SQL Analysis

After cleaning the dataset, it was imported into a MySQL database for further analysis.

SQL was used to answer several analytical questions, such as:

* How many unicorn companies exist in the dataset
* Which continents produce the most unicorn startups
* Which countries dominate the unicorn ecosystem
* Which companies have the highest valuations
* Which startups raised the most funding
* Which companies are the most capital-efficient

Window functions were also used to rank companies by valuation and identify the most valuable startup within each continent.

Example query:

```sql
SELECT country, COUNT(*) AS unicorn_count
FROM unicorn_companies
GROUP BY country
ORDER BY unicorn_count DESC;
```

---

# Power BI Dashboard

An interactive dashboard was created using **Power BI** to visualize the insights.

The dashboard includes key metrics such as:

* Total Unicorn Startups: **1705**
* Total Funding Raised: **$1.35 Trillion**
* Average Valuation: **$4.92 Billion**
* Average Funding Efficiency: **20.34**

The dashboard also contains visualizations for:

* Unicorn distribution by continent
* Unicorn distribution by country
* Top companies by valuation
* Funding vs valuation comparison
* Interactive filters for country, continent, and company

These visualizations help explore the startup ecosystem from multiple perspectives.

---

# Key Insights

### United States Dominates the Unicorn Ecosystem

The United States produces the largest number of unicorn startups.

Top countries by unicorn count:

* United States — 878
* China — 286
* India — 85
* United Kingdom — 71

This shows that strong innovation ecosystems and venture capital availability play a major role in startup success.

---

### Funding Patterns Among Unicorn Startups

The **average funding raised** by unicorn startups is approximately **$0.81 billion**, while the **median funding** is around **$0.38 billion**.

This indicates a **right-skewed distribution**, meaning a small number of startups raise extremely large funding rounds that increase the average.

---

### Venture Capital Firms Drive Startup Growth

Large venture capital firms are heavily involved in funding unicorn companies.

Some of the most active investors include:

* SoftBank Vision Fund
* Tiger Global
* Andreessen Horowitz
* Coatue

These firms play an important role in scaling startups globally.

---

### Capital Efficient Unicorn Startups

Some startups achieved billion-dollar valuations with relatively small amounts of funding.

Examples include:

| Company    | Efficiency Score |
| ---------- | ---------------- |
| Prometheus | 13333            |
| Zapier     | 4000             |
| VNG        | 2000             |

These companies demonstrate strong **capital efficiency and scalable business models**.

---

# Tools Used

Python

* Pandas
* NumPy
* Requests
* BeautifulSoup

SQL

* MySQL
* Aggregation queries
* Window functions

Power BI

* Interactive dashboards
* KPI metrics
* Data visualization

---

# Project Workflow

Web Scraping → Data Cleaning → Feature Engineering → SQL Analysis → Power BI Visualization

---

# Conclusion

This project demonstrates how data analysis can be used to explore patterns within the global startup ecosystem.

The analysis shows that unicorn startups tend to emerge in strong innovation hubs, receive backing from major venture capital firms, and often operate in high-growth industries such as AI, fintech, and e-commerce.

While funding plays a significant role in startup growth, some companies achieve unicorn status with relatively limited capital, highlighting the importance of efficient business models and strong product-market fit.
s**
• the **resume project description (very important for interviews)**.

# E-commerce Analytics Case Study (SQL Project)

📊 Project Overview

This project analyzes transactional e-commerce data from a UK-based online retailer. The primary goal was to uncover purchasing patterns, product performance, and customer behavior using advanced SQL analysis. The project draws insights that can drive strategic decisions around product stocking, customer retention, and revenue growth.

The dataset includes detailed invoices with product descriptions, quantities, unit prices, customer IDs, and timestamps across multiple countries.

---

📌 Objectives

-Identify top-performing products using Pareto (80/20) analysis

-Segment tail products with volatile sales patterns

-Track consistency of top sellers over time (monthly trends)

-Analyze pricing stability and product value segments

-Generate customer segmentation reports

-Build detailed product performance analytics

---

🔍 Key Business Questions

Which products contribute to 80% of total revenue?

Are those top products consistent across months?

Which tail products have unstable or spiky revenue?

How stable are product prices over time?

What are the characteristics of loyal or churned customers?

Which products are at risk of churn (inactive for months)?

---

🧠 Key Insights

- 54% of products contribute to 80% of total revenue

- 641 products in the tail segment show high volatility

- Some products appear in top 80% of revenue across 10+ months — true MVPs

- Stable-price products make up the majority of top performers

- 40%+ of customers have a high risk of churn due to inactivity

- High value products (>$1000 revenue) are only ~12% but drive a big portion of revenue

---

🏗️ Project Structure

online-retail-analytics/
├── data/                           # Cleaned dataset (optional)
├── sql/                            # All SQL queries and views
│   ├── pareto_analysis.sql
│   ├── tail_analysis.sql
│   ├── volatility_analysis.sql
│   ├── monthly_ranked_sales.sql
│   ├── customer_summary_report.sql
│   ├── product_performance_report.sql
│   └── root_cause_analysis.sql
├── reports/                        # Output tables 
├── README.md                       # Project overview (this file)
└── LICENSE                         # MIT License for this project

---

📈 Reports & Views

pareto_analysis.sql: Identify top 20% of products generating 80% of sales

tail_analysis.sql: Analyze tail-end products and their volatility

monthly_ranked_sales.sql: Track monthly top-selling products and consistency

root_cause_analysis.sql: Identify factors behind top product performance (price/seasonality)

customer_summary_report.sql: Customer segmentation by activity, spend, and churn

product_performance_report.sql: Deep-dive product metrics including recency, order value, churn risk, and pricing tiers

---

📊 Metrics Glossary

Cumulative Sales %: Running total % of sales when ranked by product

Volatile Products: High standard deviation in monthly sales

Churned Users: Customers with only one transaction period

Product Movement Type: Fast vs. slow based on quantity sold

Return Rate %: % of returned items relative to total sold

---

🔧 Tools & Technologies

SQL (MySQL)

Git & GitHub

Data Modeling (CTEs, views)

---

🙌 Acknowledgment

Dataset: UCI Online Retail Dataset

Cleaned & transformed in SQL by Rahma

Open to commercial and personal use under UCI license

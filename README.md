# 🛒 E-Commerce Product Analytics SQL Project

**Project:** End-to-End SQL Product Analytics on Online Retail Dataset

---

## 📌 Project Overview

This SQL project explores product performance in an e-commerce setting. It includes metrics such as:

- Top vs. tail product sales
- Pareto analysis
- Volatility in pricing
- Consistency in product performance
- Root cause analysis
- Segmentation by stability, returns, and contribution

---

## 🎯 Objectives

Analyze product sales concentration using Pareto analysis

Detect price volatility and stability

Classify product lifecycle patterns

Identify long-tail products and assess their value

Provide insights for merchandising and pricing strategies

---

## 🧠 Key Business Questions

- Who are the top-performing products?
- Are low-selling products worth keeping (long tail analysis)?
- Are the top 20% consistent over time?
- What drives top performer success — price? seasonality?
- Are returns concentrated in specific products?

---

## 📂 Project Structure
│
├── 01_data_cleaning.sql
├── 02_pareto_analysis.sql
├── 03_long_tail_analysis.sql
├── 04_price_volatility_analysis.sql
├── 05_root_cause_analysis.sql
├── README.md
└── .gitignore

---

## ✅ What I Did

Cleaned and prepared raw e-commerce transaction data.

Built modular SQL views for product-level and monthly sales aggregation.

Conducted Pareto analysis to identify top 20% revenue-generating products.

Segmented products into long-tail vs. top sellers.

Analyzed price volatility using Relative Standard Deviation (RSD).

Built a product consistency report to track recurring top performers over time.

Identified performance tiers based on historical sales presence.

Investigated seasonality, SKU stability, and product lifespan trends.

Documented metrics, logic, and insights for reproducibility and transparency.

---

## 📊 Key Insights

Top 55% of products generate ~80% of total revenue — the distribution is skewed, but not a classic 80/20 Pareto.

45% of the catalog contributes very little revenue, forming a long tail of underperforming or niche products.

Only a small fraction of products consistently stay top performers over time, suggesting high product turnover or changing customer preferences.

Price volatility is often linked to inconsistent performance, making it a potential red flag for product stability.

Several one-time bestsellers fail to sustain demand, indicating short lifecycles or seasonal popularity.

Product lifespans vary, with some maintaining sales over many months while others spike and vanish quickly.

Top-performing products typically show stable pricing, early catalog entry, and frequent monthly sales presence.

---

## 🔧 Tech Stack

- **SQL (MySQL)**
- **Git + GitHub**
- Clean, modular SQL queries
- Professional project structuring


---

## 📎 Notes

- Dataset: Online Retail (public UCI dataset)

---

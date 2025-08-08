# 🛍 Product Performance Report

## 📄 Overview
This report analyzes the performance of products sold in the Online Retail dataset, providing insights into sales patterns, pricing tiers, movement speed, return rates, and churn risk.  
It helps identify high-value products, products at risk, and low performers that may be candidates for discontinuation.

---

## 💼 Business Summary
Our analysis of the dataset revealed several important insights:

1. **Revenue Concentration**  
   - A small group of high-value products contributes to a significant share of total sales.  
   - Many slow-moving products have minimal impact on revenue but occupy inventory and logistics space.

2. **Product Movement**  
   - Fast movers are typically mid-priced items with consistent monthly sales.  
   - Slow movers often fall into budget or niche categories with irregular demand.

3. **Return Rates**  
   - High-value products generally have lower return rates, while certain low-value items have disproportionately high return percentages.

4. **Churn Risk**  
   - Products not sold in the last 6+ months are marked **At Risk**, representing potential dead stock.  
   - These items are candidates for clearance or promotional strategies.

5. **Pricing Segmentation**  
   - Premium products maintain steady sales despite higher prices, suggesting brand or quality loyalty.  
   - Budget items are more volatile in demand.

---

## 📊 Metrics Included
- **Total Invoices** – Number of unique invoices containing the product  
- **Total Quantity** – Total units sold  
- **Total Sales** – Revenue generated  
- **Average Unit Price** – Mean selling price per unit  
- **Average Quantity per Order**  
- **Average Order Value** – Average spend per order containing the product  
- **Return Rate (%)** – Proportion of returned units  
- **Last Sale Month & Recency** – When the product was last sold  
- **Life Span** – Months between first and last sale  
- **Product Type** – High Value, Normal, Low Value  
- **Churn Risk Flag** – Active vs. At Risk  
- **Product Movement Type** – Fast, Normal, or Slow movers  
- **Pricing Category** – Premium, Mid Range, or Budget

---

## 📂 Files
- [`product_performance_report.sql`](product_performance_report.sql) – SQL script to generate the report  

---

## ⚡ How to Use
1. Run the SQL script in your MySQL environment.  
2. Export the resulting table as a CSV file.  
3. Use this report to identify top products, evaluate risk, and make informed inventory or marketing decisions.

---

## 🔗 Related Resources
- [Main Project README](../README.md) – Context and other reports from the Online Retail Analytics project.

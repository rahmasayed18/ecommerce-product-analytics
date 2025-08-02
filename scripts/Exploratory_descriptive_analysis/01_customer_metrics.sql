/* =============================================================
   Exploratory Analysis - Customer Metrics
   Metrics: Total customers, invoices, quantity, sales, AOV, etc.
==============================================================*/

-- Country-level customer overview
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    country,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(unit_price), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    AVG(quantity) AS average_quantity
FROM online_retail_transaction.online_retail_cleaned
GROUP BY country
ORDER BY total_sales DESC;

-- Customer-level behavior overview
SELECT
    customer_id,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    MIN(invoice_date) AS first_purchase_date,
    MAX(invoice_date) AS last_purchase_date,
    TIMESTAMPDIFF(MONTH, MIN(invoice_date), MAX(invoice_date)) AS months_of_activity,
    ROUND(
        COUNT(DISTINCT invoice_no) / NULLIF(TIMESTAMPDIFF(MONTH, MIN(invoice_date), MAX(invoice_date)), 0),
        2
    ) AS avg_purchase_frequency_per_month,
    country,
    ROUND(SUM(unit_price), 2) AS total_spent,
    ROUND(AVG(unit_price), 2) AS average_spent_per_invoice,
    ROUND(SUM(unit_price) / COUNT(DISTINCT invoice_no), 2) AS average_order_value
FROM online_retail_transaction.online_retail_cleaned
GROUP BY customer_id, country
ORDER BY total_invoices DESC;

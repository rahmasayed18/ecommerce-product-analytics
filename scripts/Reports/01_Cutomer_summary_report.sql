/* =============================================================
   1. CUSTOMER SUMMARY REPORT
============================================================= */

DROP TABLE IF EXISTS online_retail_transaction.customer_summary_report;
CREATE TABLE online_retail_transaction.customer_summary_report AS
WITH active_months AS 
(
    SELECT
        customer_id,
        COUNT(DISTINCT DATE_FORMAT(invoice_date, '%Y-%m')) AS active_months
    FROM online_retail_transaction.online_retail_cleaned
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    c.country,
    COUNT(DISTINCT c.invoice_no) AS total_invoices,
    SUM(c.quantity) AS total_quantity,
    ROUND(SUM(c.unit_price * c.quantity), 2) AS total_sales,
    ROUND(SUM(c.unit_price * c.quantity) / COUNT(DISTINCT invoice_no), 2) AS average_order_value,
    ROUND(COUNT(DISTINCT c.invoice_no) / NULLIF(m.active_months, 0), 2) AS average_orders_per_month,
    ROUND(AVG(c.quantity), 2) AS average_quantity,
    CASE
        WHEN TIMESTAMPDIFF(DAY, MIN(c.invoice_date), MAX(c.invoice_date)) = 0 THEN 'Churned User'
        ELSE 'Active'
    END AS churn_status,
    DATE_FORMAT(MAX(c.invoice_date), '%Y-%m') AS last_purchase_month,
    TIMESTAMPDIFF(MONTH, MIN(c.invoice_date), MAX(c.invoice_date)) AS life_span_months,
    TIMESTAMPDIFF(MONTH, MAX(c.invoice_date), NOW()) AS recency_months
FROM 
    online_retail_transaction.online_retail_cleaned c
JOIN 
    active_months m USING (customer_id)
GROUP BY customer_id, country, m.active_months
ORDER BY customer_id, total_sales DESC;

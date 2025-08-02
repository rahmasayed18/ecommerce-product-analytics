/* =============================================================
   Exploratory Analysis - RFM Metrics
   Recency, Frequency, Monetary Value
==============================================================*/

SELECT 
    customer_id,
    MAX(invoice_date) AS last_purchase_date,
    MIN(invoice_date) AS first_purchase_date,
    TIMESTAMPDIFF(MONTH, MAX(invoice_date), NOW()) AS recency_months,
    COUNT(DISTINCT invoice_no) AS frequency,
    ROUND(SUM(unit_price * quantity), 2) AS monetary_value
FROM online_retail_transaction.online_retail_cleaned
WHERE invoice_no NOT LIKE 'C%'  -- Exclude cancellations
GROUP BY customer_id
ORDER BY monetary_value DESC;

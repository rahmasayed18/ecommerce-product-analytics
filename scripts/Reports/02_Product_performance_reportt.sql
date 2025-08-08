/* =============================================================
   2. PRODUCT PERFORMANCE REPORT
============================================================= */

DROP TABLE IF EXISTS online_retail_transaction.product_performance_report;
CREATE TABLE online_retail_transaction.product_performance_report AS
SELECT
    stock_code,
    description AS product,
    country,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(unit_price * quantity), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    ROUND(AVG(quantity), 2) AS average_quantity,
    ROUND(SUM(unit_price * quantity) / COUNT(DISTINCT invoice_no), 2) AS average_order_value,
    ROUND(SUM(unit_price * quantity) / COUNT(DISTINCT stock_code), 2) AS average_spent_per_product,
    ROUND(COUNT(DISTINCT invoice_no) / COUNT(DISTINCT stock_code), 2) AS average_orders_per_product,
    DATE_FORMAT(MAX(invoice_date), '%Y-%m') AS last_sale_month,
    TIMESTAMPDIFF(MONTH, MAX(invoice_date), NOW()) AS recency_months,
    TIMESTAMPDIFF(DAY, MAX(invoice_date), NOW()) AS recency_days,
    TIMESTAMPDIFF(MONTH, MIN(invoice_date), MAX(invoice_date)) AS life_span_months,
    ROUND(
        (SUM(CASE WHEN quantity < 0 THEN ABS(quantity) ELSE 0 END) /
         NULLIF(SUM(CASE WHEN quantity > 0 THEN quantity ELSE 0 END), 0)) * 100, 2
    ) AS return_rate_percent,
    CASE
        WHEN ROUND(SUM(unit_price * quantity), 2) >= 1000 THEN 'High Value Product'
        WHEN ROUND(SUM(unit_price * quantity), 2) BETWEEN 500 AND 1000 THEN 'Normal Product'
        ELSE 'Low Value Product'
    END AS product_type,
    CASE
        WHEN TIMESTAMPDIFF(MONTH, MAX(invoice_date), NOW()) > 6 THEN 'At Risk'
        ELSE 'Active'
    END AS churn_risk_flag,
    CASE
        WHEN SUM(quantity) > 1000 THEN 'Fast Movers'
        WHEN SUM(quantity) BETWEEN 500 AND 1000 THEN 'Normal Movers'
        ELSE 'Slow Movers'
    END AS product_movement_type,
    CASE
        WHEN AVG(unit_price) > 100 AND SUM(quantity) > 10 THEN 'Premium Product'
        WHEN AVG(unit_price) BETWEEN 50 AND 100 AND SUM(quantity) BETWEEN 5 AND 10 THEN 'Mid Range Product'
        ELSE 'Budget Product' 
    END AS product_pricing_category
FROM online_retail_transaction.online_retail_cleaned
GROUP BY stock_code, description, country
ORDER BY total_sales DESC;

/* =============================================================
   Exploratory Analysis - Sales Metrics
   Breakdown by country, product, and date
==============================================================*/

-- Sales by country
SELECT 
    country,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(unit_price), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    ROUND(AVG(quantity), 2) AS average_quantity
FROM online_retail_transaction.online_retail_cleaned
GROUP BY country
ORDER BY total_sales DESC;

-- Sales by product
SELECT 
    description AS product,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(unit_price), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    ROUND(AVG(quantity), 2) AS average_quantity
FROM online_retail_transaction.online_retail_cleaned
GROUP BY description
ORDER BY total_sales DESC;

-- Sales by invoice date
SELECT 
    DATE(invoice_date) AS invoice_date,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(unit_price), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    ROUND(AVG(quantity), 2) AS average_quantity
FROM online_retail_transaction.online_retail_cleaned
GROUP BY DATE(invoice_date)
ORDER BY total_sales DESC;

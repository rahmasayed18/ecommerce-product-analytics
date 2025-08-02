/* =============================================================
   Exploratory Analysis - Product Performance
   Most and least sold products
==============================================================*/

-- Top performing products
SELECT 
    stock_code,
    description AS product,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(unit_price), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    ROUND(AVG(quantity), 2) AS average_quantity
FROM online_retail_transaction.online_retail_cleaned
GROUP BY stock_code, description
ORDER BY total_sales DESC;

-- Least performing products
SELECT 
    stock_code,
    description AS product,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(unit_price), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    ROUND(AVG(quantity), 2) AS average_quantity
FROM online_retail_transaction.online_retail_cleaned
GROUP BY stock_code, description
ORDER BY total_sales ASC;

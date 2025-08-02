/* =============================================================
     TIME-BASED SALES TRENDS
     1. Sales by date (seasonality patterns)
============================================================== */

/* =============================================================
     1. Yearly Sales
============================================================== */

SELECT
    YEAR(invoice_date) AS invoice_year,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(unit_price * quantity), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    ROUND(AVG(quantity), 2) AS average_quantity
FROM online_retail_transaction.online_retail_cleaned
GROUP BY YEAR(invoice_date)
ORDER BY invoice_year;

/* =============================================================
     2. Monthly Sales
============================================================== */
SELECT
    MONTH(invoice_date) AS invoice_month,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(unit_price * quantity), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    ROUND(AVG(quantity), 2) AS average_quantity
FROM online_retail_transaction.online_retail_cleaned
GROUP BY MONTH(invoice_date)
ORDER BY invoice_month;

/* =============================================================
     3. Sales by Day of Week
============================================================== */
SELECT
    DAYOFWEEK(invoice_date) AS invoice_day_of_week,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(unit_price * quantity), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    ROUND(AVG(quantity), 2) AS average_quantity
FROM online_retail_transaction.online_retail_cleaned
GROUP BY DAYOFWEEK(invoice_date)
ORDER BY total_sales DESC;

/* =============================================================
     4. Hourly Sales (Make sure 'invoice_hour' is extracted)
============================================================== */
SELECT
    invoice_hour,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(unit_price * quantity), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    ROUND(AVG(quantity), 2) AS average_quantity
FROM online_retail_transaction.online_retail_cleaned
GROUP BY invoice_hour
ORDER BY total_sales DESC;

/* =============================================================
     5. Quarterly Sales
============================================================== */
SELECT
    QUARTER(invoice_date) AS invoice_quarter,
    COUNT(DISTINCT invoice_no) AS total_invoices,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(unit_price * quantity), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    ROUND(AVG(quantity), 2) AS average_quantity
FROM online_retail_transaction.online_retail_cleaned
GROUP BY QUARTER(invoice_date)
ORDER BY total_sales DESC;

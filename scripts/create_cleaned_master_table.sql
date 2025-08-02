/* 
==================================================
    Create Final Cleaned Table: online_retail_cleaned
    Description: Combines and cleans raw data from 
    online_retail_aa, ab, ba, bb
==================================================
*/

DROP TABLE IF EXISTS online_retail__transaction.online_retail_cleaned;

CREATE TABLE online_retail__transaction.online_retail_cleaned AS

-- ============================
-- Cleaned Data from table: AA
-- ============================
SELECT 
    ï»¿InvoiceNo AS invoice_no,
    StockCode AS stock_code,
    LOWER(TRIM(Description)) AS description,
    Quantity AS quantity,
    STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i') AS invoice_date,
    HOUR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_hour,
    DAYOFWEEK(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_day_of_week,
    MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_month,
    YEAR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_year,
    UnitPrice AS unit_price,
    CustomerID AS customer_id,
    CASE
        WHEN LOWER(TRIM(Country)) = 'usa' THEN 'united states'
        WHEN LOWER(TRIM(Country)) = 'rsa' THEN 'south africa'
        ELSE LOWER(TRIM(Country))
    END AS country
FROM online_retail__transaction.online_retail_aa
WHERE Quantity > 0
  AND UnitPrice > 0
  AND CustomerId != 0 
  AND CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(InvoiceDate, ' ', -1), ':', 1) AS UNSIGNED) < 24

UNION ALL

-- ============================
-- Cleaned Data from table: AB
-- ============================
SELECT 
    ï»¿InvoiceNo AS invoice_no,
    StockCode AS stock_code,
    LOWER(TRIM(Description)) AS description,
    Quantity AS quantity,
    STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i') AS invoice_date,
    HOUR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_hour,
    DAYOFWEEK(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_day_of_week,
    MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_month,
    YEAR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_year,
    UnitPrice AS unit_price,
    CustomerID AS customer_id,
    CASE
        WHEN LOWER(TRIM(Country)) = 'usa' THEN 'united states'
        WHEN LOWER(TRIM(Country)) = 'rsa' THEN 'south africa'
        ELSE LOWER(TRIM(Country))
    END AS country
FROM online_retail__transaction.online_retail_ab
WHERE Quantity > 0
  AND UnitPrice > 0
  AND CustomerId != 0 
  AND CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(InvoiceDate, ' ', -1), ':', 1) AS UNSIGNED) < 24

UNION ALL

-- ============================
-- Cleaned Data from table: BA
-- ============================
SELECT 
    ï»¿InvoiceNo AS invoice_no,
    StockCode AS stock_code,
    LOWER(TRIM(Description)) AS description,
    Quantity AS quantity,
    STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i') AS invoice_date,
    HOUR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_hour,
    DAYOFWEEK(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_day_of_week,
    MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_month,
    YEAR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_year,
    UnitPrice AS unit_price,
    CustomerID AS customer_id,
    CASE
        WHEN LOWER(TRIM(Country)) = 'usa' THEN 'united states'
        WHEN LOWER(TRIM(Country)) = 'rsa' THEN 'south africa'
        ELSE LOWER(TRIM(Country))
    END AS country
FROM online_retail__transaction.online_retail_ba
WHERE Quantity > 0
  AND UnitPrice > 0
  AND CustomerId != 0 
  AND CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(InvoiceDate, ' ', -1), ':', 1) AS UNSIGNED) < 24

UNION ALL

-- ============================
-- Cleaned Data from table: BB
-- ============================
SELECT 
    ï»¿InvoiceNo AS invoice_no,
    StockCode AS stock_code,
    LOWER(TRIM(Description)) AS description,
    Quantity AS quantity,
    STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i') AS invoice_date,
    HOUR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_hour,
    DAYOFWEEK(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_day_of_week,
    MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_month,
    YEAR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_year,
    UnitPrice AS unit_price,
    CustomerID AS customer_id,
    CASE
        WHEN LOWER(TRIM(Country)) = 'usa' THEN 'united states'
        WHEN LOWER(TRIM(Country)) = 'rsa' THEN 'south africa'
        ELSE LOWER(TRIM(Country))
    END AS country
FROM online_retail__transaction.online_retail_bb
WHERE Quantity > 0
  AND UnitPrice > 0
  AND CustomerId != 0 
  AND CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(InvoiceDate, ' ', -1), ':', 1) AS UNSIGNED) < 24;

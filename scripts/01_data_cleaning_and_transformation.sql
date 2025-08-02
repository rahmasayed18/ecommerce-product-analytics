/* ============================================================================
   File: 01_cleaning_and_transforming_raw_tables.sql
   Purpose: Cleansing and normalization of all raw input tables from the dataset
============================================================================ */

/* === Clean: online_retail_aa === */
SELECT 
    InvoiceNo AS invoice_no,
    StockCode,
    LOWER(TRIM(Description)) AS Description,
    Quantity,
    InvoiceDate,
    HOUR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_hour,
    DAYOFWEEK(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_day_of_week,
    MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_month,
    YEAR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_year,
    UnitPrice,
    CustomerID,
    LOWER(TRIM(Country)) AS Country
FROM online_retail_transaction.online_retail_aa
WHERE 
    Quantity > 0
    AND UnitPrice > 0
    AND CustomerID != 0 
    AND CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(InvoiceDate, ' ', -1), ':', 1) AS UNSIGNED) < 24;

/* === QA: online_retail_aa Quality Checks === */
-- Null or invalid values check by column
SELECT CustomerID FROM online_retail_transaction.online_retail_aa WHERE CustomerID IS NULL OR CustomerID = 0;
SELECT StockCode FROM online_retail_transaction.online_retail_aa WHERE StockCode IS NULL OR StockCode = '';
SELECT Quantity FROM online_retail_transaction.online_retail_aa WHERE Quantity < 0;
SELECT InvoiceDate FROM online_retail_transaction.online_retail_aa WHERE InvoiceDate = 0 OR InvoiceDate IS NULL;
SELECT UnitPrice FROM online_retail_transaction.online_retail_aa WHERE UnitPrice < 0;
SELECT Country FROM online_retail_transaction.online_retail_aa WHERE Country IS NULL OR Country = '';
SELECT InvoiceNo FROM online_retail_transaction.online_retail_aa WHERE InvoiceNo IS NULL OR InvoiceNo LIKE 'C%';

-- Check valid time extraction
SELECT * FROM online_retail_transaction.online_retail_aa 
WHERE CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(InvoiceDate, ' ', -1), ':', 1) AS UNSIGNED) < 24;
SELECT InvoiceDate FROM online_retail_transaction.online_retail_aa WHERE InvoiceDate IS NOT NULL LIMIT 10;

/* === Clean: online_retail_ab === */
SELECT 
    InvoiceNo AS invoice_no,
    StockCode,
    LOWER(TRIM(Description)) AS Description,
    Quantity,
    InvoiceDate,
    HOUR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_hour,
    DAYOFWEEK(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_day_of_week,
    MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_month,
    YEAR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_year,
    UnitPrice,
    CustomerID,
    LOWER(TRIM(Country)) AS Country
FROM online_retail_transaction.online_retail_ab
WHERE 
    Quantity > 0
    AND UnitPrice > 0
    AND CustomerID != 0 
    AND CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(InvoiceDate, ' ', -1), ':', 1) AS UNSIGNED) < 24;

/* === QA: online_retail_ab Quality Checks === */
SELECT CustomerID FROM online_retail_transaction.online_retail_ab WHERE CustomerID IS NULL OR CustomerID = 0;
SELECT StockCode FROM online_retail_transaction.online_retail_ab WHERE StockCode IS NULL OR StockCode = '';
SELECT Quantity FROM online_retail_transaction.online_retail_ab WHERE Quantity < 0;
SELECT InvoiceDate FROM online_retail_transaction.online_retail_ab WHERE InvoiceDate = 0 OR InvoiceDate IS NULL;
SELECT UnitPrice FROM online_retail_transaction.online_retail_ab WHERE UnitPrice < 0;
SELECT Country FROM online_retail_transaction.online_retail_ab WHERE Country IS NULL OR Country = '';
SELECT InvoiceNo FROM online_retail_transaction.online_retail_ab WHERE InvoiceNo IS NULL OR InvoiceNo LIKE 'C%';

-- Time sanity check
SELECT * FROM online_retail_transaction.online_retail_ab 
WHERE CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(InvoiceDate, ' ', -1), ':', 1) AS UNSIGNED) < 24;
SELECT InvoiceDate FROM online_retail_transaction.online_retail_ab WHERE InvoiceDate IS NOT NULL LIMIT 10;

/* === Clean: online_retail_ba === */
SELECT 
    InvoiceNo AS invoice_no,
    StockCode,
    LOWER(TRIM(Description)) AS Description,
    Quantity,
    InvoiceDate,
    HOUR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_hour,
    DAYOFWEEK(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_day_of_week,
    MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_month,
    YEAR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_year,
    UnitPrice,
    CustomerID,
    CASE
        WHEN LOWER(TRIM(Country)) = 'usa' THEN 'united states'
        WHEN LOWER(TRIM(Country)) = 'rsa' THEN 'south africa'
        ELSE LOWER(TRIM(Country))
    END AS Country
FROM online_retail_transaction.online_retail_ba
WHERE 
    Quantity > 0
    AND UnitPrice > 0
    AND CustomerID != 0 
    AND CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(InvoiceDate, ' ', -1), ':', 1) AS UNSIGNED) < 24;

/* === Clean: online_retail_bb === */
SELECT 
    InvoiceNo AS invoice_no,
    StockCode,
    LOWER(TRIM(Description)) AS Description,
    Quantity,
    InvoiceDate,
    HOUR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_hour,
    DAYOFWEEK(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_day_of_week,
    MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_month,
    YEAR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS invoice_year,
    UnitPrice,
    CustomerID,
    CASE
        WHEN LOWER(TRIM(Country)) = 'usa' THEN 'united states'
        WHEN LOWER(TRIM(Country)) = 'rsa' THEN 'south africa'
        ELSE LOWER(TRIM(Country))
    END AS Country
FROM online_retail_transaction.online_retail_bb
WHERE 
    Quantity > 0
    AND UnitPrice > 0
    AND CustomerID != 0 
    AND CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(InvoiceDate, ' ', -1), ':', 1) AS UNSIGNED) < 24;

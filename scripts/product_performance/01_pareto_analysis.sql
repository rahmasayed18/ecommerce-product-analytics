/*-----------------------------------------
     Product Sales Pareto Analysis
------------------------------------------------*/
DROP VIEW IF EXISTS online_retail__transaction.vw_tail_products;
CREATE VIEW online_retail__transaction.vw_tail_products AS
WITH sales_data AS (
    SELECT
        description AS product,
        SUM(quantity) AS total_quantity,
        ROUND(SUM(unit_price * quantity), 2) AS total_sales
    FROM online_retail__transaction.online_retail_cleaned
    GROUP BY description
),
grand_total AS (
    SELECT SUM(total_sales) AS grand_total_sales FROM sales_data
),
ranked_sales AS (
    SELECT 
        product,
        total_quantity,
        total_sales,
        ROUND(total_sales * 100.0 / (SELECT grand_total_sales FROM grand_total), 2) AS sales_percentage,
        ROUND(SUM(total_sales) OVER (ORDER BY total_sales DESC), 2) AS cumulative_sales,
        ROUND(SUM(total_sales) OVER (ORDER BY total_sales DESC) * 100.0 / 
              (SELECT grand_total_sales FROM grand_total), 2) AS cumulative_percentage
    FROM sales_data
)

SELECT *
FROM ranked_sales
WHERE cumulative_percentage > 80;

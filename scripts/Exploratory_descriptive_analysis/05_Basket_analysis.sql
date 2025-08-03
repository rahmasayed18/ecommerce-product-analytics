/* =============================================================
     Basket & revenue analysis
==============================================================*/
with basket_analysis as /*basket size by product*/
(
select 
    customer_id,
    invoice_no,
    invoice_date,
    round(sum(quantity * unit_price), 2) sales_amount,
    count(distinct stock_code) as total_items,
    round(avg(quantity * unit_price) , 2)avg_price_per_item,
    sum(quantity) as total_quantity
    
from online_retail_transaction.online_retail_cleaned
group by customer_id, invoice_date, invoice_no
order by customer_id
) 
select
    *, 
    avg(sales_amount) avg_sales_per_invoice,
    sum(total_quantity) over (partition by customer_id) as total_quantity_per_customer,
    count(invoice_no)over (partition by customer_id) as total_invoices_per_customer,
    round(sum(total_quantity) over (partition by customer_id) /
    count(invoice_no)over (partition by customer_id), 2) as average_quantity_per_invoice
from basket_analysis
group by customer_id, invoice_date, invoice_no
order by customer_id, invoice_date;

/*median and mode*/

WITH ranked_baskets AS (
  SELECT 
    customer_id,
    invoice_no,
    SUM(quantity * unit_price) AS sales_amount,
    ROW_NUMBER() OVER (ORDER BY SUM(quantity * unit_price)) AS rn,
    COUNT(*) OVER () AS total_rows
  FROM online_retai_transaction.online_retail_cleaned
  GROUP BY customer_id, invoice_no
)
SELECT AVG(sales_amount) AS median_sales
FROM ranked_baskets
WHERE rn IN (FLOOR((total_rows + 1)/2), CEIL((total_rows + 1)/2));

SELECT sales_amount, COUNT(*) as frequency
FROM (
  SELECT customer_id, invoice_no, ROUND(SUM(quantity * unit_price), 2) AS sales_amount
  FROM online_retail_transaction.online_retail_cleaned
  GROUP BY customer_id, invoice_no
) AS basket_sales
GROUP BY sales_amount
ORDER BY frequency DESC
LIMIT 10;

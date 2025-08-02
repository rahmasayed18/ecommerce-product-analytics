/* =============================================================
     Churn & Activity Tier Classification
==============================================================*/

/* 1. Customer Activity by Month */
WITH months_of_activity AS (
    SELECT DISTINCT
        customer_id,
        DATE_FORMAT(invoice_date, '%Y-%m') AS activity_month,
        DENSE_RANK() OVER (
            PARTITION BY customer_id
            ORDER BY invoice_date
        ) AS activity_month_rank
    FROM online_retail_transaction.online_retail_cleaned
),

activity_tiers AS (
    SELECT
        customer_id,
        COUNT(*) AS activity_months
    FROM months_of_activity
    GROUP BY customer_id
)

/* 2. Classify Customers into Activity Tiers */
SELECT
    customer_id,
    CASE
        WHEN activity_months = 0 THEN 'inactive'
        WHEN activity_months BETWEEN 1 AND 2 THEN 'new'
        WHEN activity_months BETWEEN 3 AND 5 THEN 'engaged'
        ELSE 'loyal'
    END AS activity_period
FROM activity_tiers
ORDER BY customer_id;


/* =============================================================
     Churned vs Active Customers
==============================================================*/

SELECT
    customer_id,
    DATE_FORMAT(MIN(invoice_date), '%Y-%m') AS sign_up_date,
    DATE_FORMAT(MAX(invoice_date), '%Y-%m') AS last_purchase_date,
    TIMESTAMPDIFF(DAY, MIN(invoice_date), MAX(invoice_date)) AS days_of_activity,
    CASE
        WHEN TIMESTAMPDIFF(DAY, MIN(invoice_date), MAX(invoice_date)) = 0 THEN 'churned_user'
        ELSE 'active'
    END AS churn_status
FROM online_retail_transaction.online_retail_cleaned
GROUP BY customer_id
ORDER BY sign_up_date;

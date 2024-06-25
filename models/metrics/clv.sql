WITH user_sales AS (
    SELECT
        user_id,
        SUM(sale_price) AS total_spent
    FROM {{ ref('fct_sales') }}
    GROUP BY user_id
)

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    us.total_spent AS customer_lifetime_value
FROM {{ ref('dim_users') }} u
LEFT JOIN user_sales us ON u.user_id = us.user_id

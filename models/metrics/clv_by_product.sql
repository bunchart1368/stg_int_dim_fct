WITH clv AS (
    SELECT *
    FROM {{ ref('clv') }}
)

SELECT
    c.user_id,
    c.customer_lifetime_value,
    s.product_id,
    p.product_name,
    SUM(s.sale_price) AS clv_product
FROM clv c
JOIN {{ ref('dim_orders') }} o ON c.user_id = o.user_id
JOIN {{ ref('fct_sales') }} s ON o.order_id = s.order_id
JOIN {{ ref('dim_products') }} p ON s.product_id = p.product_id
GROUP BY c.user_id, c.customer_lifetime_value, s.product_id, p.product_name

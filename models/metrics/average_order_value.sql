WITH order_values AS (
    SELECT
        o.order_id,
        SUM(s.sale_price) AS order_total
    FROM {{ ref('dim_orders') }} o
    JOIN {{ ref('fct_sales') }} s ON o.order_id = s.order_id
    GROUP BY o.order_id
)

SELECT
    AVG(order_total) AS average_order_value
FROM order_values

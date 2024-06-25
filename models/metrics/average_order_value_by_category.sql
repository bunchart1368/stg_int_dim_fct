WITH order_values AS (
    SELECT
        o.order_id,
        p.product_category,
        SUM(s.sale_price) AS order_total
    FROM {{ ref('dim_orders') }} o
    JOIN {{ ref('fct_sales') }} s ON o.order_id = s.order_id
    JOIN {{ ref('dim_products') }} p ON s.product_id = p.product_id
    GROUP BY o.order_id, p.product_category
)

SELECT
    product_category,
    AVG(order_total) AS average_order_value_by_category
FROM order_values
GROUP BY product_category

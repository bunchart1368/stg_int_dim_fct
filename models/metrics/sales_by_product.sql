SELECT
    p.product_id,
    p.product_name,
    SUM(s.sale_price) AS total_sales
FROM {{ ref('fct_sales') }} s
JOIN {{ ref('dim_products') }} p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name

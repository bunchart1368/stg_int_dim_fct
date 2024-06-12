with sales as (
    select
        os.order_item_id,
        os.order_id,
        os.user_id,
        os.product_id,
        os.inventory_item_id,
        os.order_item_status,
        os.order_item_created_at,
        os.order_item_shipped_at,
        os.order_item_delivered_at,
        os.order_item_returned_at,
        os.sale_price,
        p.product_name,
        p.product_category,
        p.product_brand,
        p.product_retail_price,
        u.first_name,
        u.last_name,
        u.email,
        u.age,
        u.gender,
        u.state,
        u.city,
        u.country,
        u.traffic_source,
        dc.name as distribution_center_name,
        dc.latitude as distribution_center_latitude,
        dc.longitude as distribution_center_longitude
    from
        {{ ref('int_order_sales') }} os
    join
        {{ ref('dim_products') }} p
    on
        os.product_id = p.product_id
    join
        {{ ref('dim_users') }} u
    on
        os.user_id = u.user_id
    join
        {{ ref('stg_distribution_centers') }} dc
    on
        p.distribution_center_id = dc.id
)
select * from sales

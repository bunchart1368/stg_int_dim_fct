with order_sales as (
    select
        oi.id as order_item_id,
        oi.order_id,
        oi.user_id,
        oi.product_id,
        oi.inventory_item_id,
        oi.status as order_item_status,
        oi.created_at as order_item_created_at,
        oi.shipped_at as order_item_shipped_at,
        oi.delivered_at as order_item_delivered_at,
        oi.returned_at as order_item_returned_at,
        oi.sale_price,
        p.name as product_name,
        p.category as product_category,
        p.brand as product_brand,
        p.retail_price as product_retail_price,
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
        {{ ref('stg_order_items') }} oi
    join
        {{ ref('stg_products') }} p
    on
        oi.product_id = p.id
    join
        {{ ref('stg_users') }} u
    on
        oi.user_id = u.id
    join
        {{ ref('stg_distribution_centers') }} dc
    on
        p.distribution_center_id = dc.id
)
select * from order_sales

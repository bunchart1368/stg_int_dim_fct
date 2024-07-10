with product_data as (
    select
        p.product_id,
        p.product_name,
        p.product_category,
        p.product_brand,
        p.product_retail_price,
        p.product_cost,
        p.product_department,
        p.product_sku,
        p.distribution_center_id,
        p.distribution_center_name,
        p.distribution_center_latitude,
        p.distribution_center_longitude,
        count(oi.id) as total_items_sold,
        sum(case when o.order_returned_at is not null then 1 else 0 end) as total_returns,
        max(o.order_created_at) as last_order_date
    from
        {{ ref('int_product_inventory') }} p
    join
        {{ ref('stg_order_items') }} oi
    on
        p.product_id = oi.product_id
    left join
        {{ ref('int_order_sales') }} o
    on
        oi.order_id = o.order_id
    group by
        p.product_id,
        p.product_name,
        p.product_category,
        p.product_brand,
        p.product_retail_price,
        p.product_cost,
        p.product_department,
        p.product_sku,
        p.distribution_center_id,
        p.distribution_center_name,
        p.distribution_center_latitude,
        p.distribution_center_longitude
)
select * from product_data

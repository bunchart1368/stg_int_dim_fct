with product_data as (
    select
        distinct
        pi.product_id,
        pi.product_name,
        pi.product_category,
        pi.product_brand,
        pi.product_retail_price,
        pi.product_cost,
        pi.product_department,
        pi.sku,
        pi.distribution_center_id,
        sum(oi.sale_price) as total_sales,
        count(oi.order_item_id) as total_quantity_sold,
        dc.name as distribution_center_name,
        dc.latitude as distribution_center_latitude,
        dc.longitude as distribution_center_longitude
    from
        {{ ref('int_product_inventory') }} pi
    left join
        {{ ref('int_order_sales') }} oi
    on
        pi.product_id = oi.product_id
    left join
        {{ ref('stg_distribution_centers') }} dc
    on
        pi.distribution_center_id = dc.id
    group by
        pi.product_id,
        pi.product_name,
        pi.product_category,
        pi.product_brand,
        pi.product_retail_price,
        pi.product_cost,
        pi.product_department,
        pi.sku,
        pi.distribution_center_id,
        dc.name,
        dc.latitude,
        dc.longitude
)
select * from product_data;

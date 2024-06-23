with inventory_data as (
    select
        distinct
        i.inventory_item_id,
        i.product_id,
        i.inventory_created_at,
        i.inventory_sold_at,
        i.inventory_cost,
        i.product_name,
        i.product_category,
        i.product_brand,
        i.product_retail_price,
        i.distribution_center_name,
        i.distribution_center_latitude,
        i.distribution_center_longitude
    from
        {{ ref('int_product_inventory') }} i
)
select * from inventory_data

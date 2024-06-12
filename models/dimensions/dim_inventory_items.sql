with inventory_data as (
    select
        distinct
        i.inventory_item_id,
        i.product_id,
        i.inventory_created_at,
        i.inventory_sold_at,
        i.inventory_cost,
        p.product_name,
        p.product_category,
        p.product_brand,
        p.product_retail_price,
        dc.name as distribution_center_name,
        dc.latitude as distribution_center_latitude,
        dc.longitude as distribution_center_longitude
    from
        {{ ref('int_product_inventory') }} i
    left join
        {{ ref('stg_products') }} p
    on
        i.product_id = p.id
    left join
        {{ ref('stg_distribution_centers') }} dc
    on
        p.distribution_center_id = dc.id
)
select * from inventory_data;

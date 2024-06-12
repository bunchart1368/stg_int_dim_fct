with product_inventory as (
    select
        p.id as product_id,
        p.name as product_name,
        p.category as product_category,
        p.brand as product_brand,
        p.retail_price as product_retail_price,
        p.cost as product_cost,
        p.department as product_department,
        p.sku as product_sku,
        p.distribution_center_id,
        i.id as inventory_item_id,
        i.created_at as inventory_created_at,
        i.sold_at as inventory_sold_at,
        i.cost as inventory_cost,
        dc.name as distribution_center_name,
        dc.latitude as distribution_center_latitude,
        dc.longitude as distribution_center_longitude
    from
        {{ ref('stg_products') }} p
    join
        {{ ref('stg_inventory_items') }} i
    on
        p.id = i.product_id
    join
        {{ ref('stg_distribution_centers') }} dc
    on
        p.distribution_center_id = dc.id
)
select * from product_inventory

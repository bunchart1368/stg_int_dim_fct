with raw_data as (
    select
        id,
        cost,
        category,
        name,
        brand,
        retail_price,
        department,
        sku,
        distribution_center_id
    from
        `bigquery-public-data.thelook_ecommerce.products`
)
select * from raw_data

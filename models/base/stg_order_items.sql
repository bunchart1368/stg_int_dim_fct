with raw_data as (
    select
        *
    from
        `bigquery-public-data.thelook_ecommerce.order_items`
)
select * from raw_data

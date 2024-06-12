with raw_data as (
    select
        order_id,
        user_id,
        status,
        gender,
        created_at,
        returned_at,
        shipped_at,
        delivered_at,
        num_of_item
    from
        `bigquery-public-data.thelook_ecommerce.orders`
)
select * from raw_data

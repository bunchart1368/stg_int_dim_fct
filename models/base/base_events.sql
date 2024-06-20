with raw_data as (
    select
        *
    from
        `bigquery-public-data.thelook_ecommerce.events`
)
select * from raw_data

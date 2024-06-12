with raw_data as (
    select
        id,
        name,
        latitude,
        longitude
    from
        `bigquery-public-data.thelook_ecommerce.distribution_centers`
)
select * from raw_data

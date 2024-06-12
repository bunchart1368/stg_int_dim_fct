with raw_data as (
    select
        id,
        first_name,
        last_name,
        email,
        age,
        gender,
        state,
        street_address,
        postal_code,
        city,
        country,
        latitude,
        longitude,
        traffic_source,
        created_at
    from
        `bigquery-public-data.thelook_ecommerce.users`
)
select * from raw_data

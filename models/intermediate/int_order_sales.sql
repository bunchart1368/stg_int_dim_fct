with order_sales as (
    select
        o.order_id,
        o.user_id,
        o.status as order_status,
        o.created_at as order_created_at,
        o.returned_at as order_returned_at,
        o.shipped_at as order_shipped_at,
        o.delivered_at as order_delivered_at,
        o.num_of_item,
        u.first_name,
        u.last_name,
        u.email,
        u.age,
        u.gender,
        u.state,
        u.city,
        u.country,
        u.traffic_source
    from
        {{ ref('stg_orders') }} o
    left join
        {{ ref('stg_users') }} u
    on
        o.user_id = u.id
)
select * from order_sales

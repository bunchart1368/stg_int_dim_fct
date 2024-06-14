with user_orders as (
    select
        u.id as user_id,
        u.first_name,
        u.last_name,
        u.email,
        u.age,
        u.gender,
        u.state,
        u.city,
        u.country,
        u.traffic_source,
        o.order_id,
        o.status as order_status,
        o.created_at as order_created_at,
        o.returned_at as order_returned_at,
        o.shipped_at as order_shipped_at,
        o.delivered_at as order_delivered_at,
        o.num_of_item
    from
        {{ ref('stg_users') }} u
    left join
        {{ ref('stg_orders') }} o
    on
        u.id = o.user_id
)
select * from user_orders

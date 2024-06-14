with order_data as (
    select
        o.order_id,
        o.user_id,
        o.order_status,
        o.order_created_at,
        o.order_returned_at,
        o.order_shipped_at,
        o.order_delivered_at,
        u.num_of_item,
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
        {{ ref('int_order_sales') }} o
    join
        {{ ref('int_user_orders') }} u
    on
        o.user_id = u.user_id
)
select * from order_data

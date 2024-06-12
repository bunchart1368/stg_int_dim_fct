with order_data as (
    select
        distinct
        o.order_id,
        o.user_id,
        o.order_status,
        o.order_created_at,
        o.order_returned_at,
        o.order_shipped_at,
        o.order_delivered_at,
        o.num_of_item,
        sum(oi.sale_price) as total_order_value,
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
        {{ ref('int_user_orders') }} o
    left join
        {{ ref('int_order_sales') }} oi
    on
        o.order_id = oi.order_id
    left join
        {{ ref('stg_users') }} u
    on
        o.user_id = u.id
    group by
        o.order_id,
        o.user_id,
        o.order_status,
        o.order_created_at,
        o.order_returned_at,
        o.order_shipped_at,
        o.order_delivered_at,
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
)
select * from order_data

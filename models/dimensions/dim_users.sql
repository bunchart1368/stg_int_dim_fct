with user_data as (
    select
        distinct
        u.user_id,
        u.first_name,
        u.last_name,
        u.email,
        u.age,
        u.gender,
        u.state,
        u.city,
        u.country,
        u.traffic_source,
        sum(o.num_of_item) as total_items_ordered,
        count(o.order_id) as total_orders,
        max(o.order_created_at) as last_order_date
    from
        {{ ref('int_user_orders') }} u
    left join
        {{ ref('int_user_orders') }} o
    on
        u.user_id = o.user_id
    group by
        u.user_id,
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
select * from user_data

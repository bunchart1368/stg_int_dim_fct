with event_user as (
    select
        e.id as event_id,
        e.user_id,
        e.sequence_number,
        e.session_id,
        e.created_at as event_created_at,
        e.ip_address,
        e.city as event_city,
        e.state as event_state,
        e.postal_code as event_postal_code,
        e.browser,
        e.traffic_source as event_traffic_source,
        e.uri,
        e.event_type,
        u.first_name,
        u.last_name,
        u.order_id,
        u.order_status,
        u.order_created_at,
        u.order_returned_at as order_returned_at,
        u.order_shipped_at as order_shipped_at,
        u.order_delivered_at as order_delivered_at,
        u.num_of_item
    from
        {{ ref('base_events') }} e
    left join
        {{ ref('int_user_orders') }} u
    on
        e.user_id = u.user_id
)
select * from event_user

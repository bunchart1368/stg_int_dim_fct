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
    from
        {{ ref('stg_events') }} e
)
select * from event_user

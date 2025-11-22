-- Nombre grafica: Weekly Performance Overview
/*
with base as (
    -- usuario con su fecha de registro truncada por semana
    select
        u.user_id,
        date_trunc('week', u.created_at) as cohort_week,
        u.created_at::date as signup_date
    from users u
),
acq as (
    -- canal del día en el que se registraron
    select
        a.acquisition_date,
        a.traffic_channel,
        a.new_users
    from user_acquisition_daily a
),
sessions as (
    -- sesiones = views (compartamiento de user)
    select
        user_id,
        count(*) as total_views
    from product_views
    group by 1
),
order_info as (
    -- info de ordenes
    select
        user_id,
        count(*) as orders_made,
        avg(total_amount) as avg_ticket
    from orders
    where status = 'delivered'
    group by 1
)
select
    b.cohort_week,
    a.traffic_channel,
    count(distinct b.user_id) as users_in_cohort,
    count(distinct oi.user_id) as users_with_orders,
    round(
      count(distinct oi.user_id)::numeric 
      / count(distinct b.user_id), 3
    ) as conversion_rate,
    round(avg(s.total_views), 2) as avg_sessions,
    round(avg(oi.avg_ticket), 2) as avg_ticket_final
FROM base b -- primer CTE
left join acq a on b.signup_date = a.acquisition_date
left join sessions s on b.user_id = s.user_id
left join order_info oi on b.user_id = oi.user_id
group by 1,2
order by 1,2;
*/




-- Nombre grafica: % cambio signups & total_ordes
/*
WITH base AS (
    SELECT
        date_trunc('month', o.order_timestamp) AS period,
        COUNT(DISTINCT o.user_id) AS active_users,
        COUNT(*) FILTER (WHERE o.status = 'delivered') AS completed_orders
    FROM orders o
    GROUP BY 1
),
cambio AS (
    SELECT
        period,
        active_users,
        completed_orders,
        LAG(active_users) OVER (ORDER BY period) AS prev_active,
        LAG(completed_orders) OVER (ORDER BY period) AS prev_completed
    FROM base
)
SELECT
    period,
    -- % active users
    ROUND(
        (active_users - prev_active)::numeric / NULLIF(prev_active, 0) * 100,
    2) AS pct_active_users,
    -- % cambio de completed orders
    ROUND(
        (completed_orders - prev_completed)::numeric
        / NULLIF(prev_completed, 0) * 100,2) AS pct_completed_orders
FROM cambio
ORDER BY period;
*/


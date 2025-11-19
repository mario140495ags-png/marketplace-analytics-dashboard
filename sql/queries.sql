-- Aquí irán los queries del dashboard.

-- Ejemplo actual:
-- Total orders per week
/*
SELECT
    DATE_TRUNC('week', created_at) AS week,
    COUNT(*) AS total_orders
FROM orders
GROUP BY 1
ORDER BY 1;
*/

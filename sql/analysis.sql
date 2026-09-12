-- Chennai Water Security & Tanker Allocation
-- MySQL 8+ portfolio analysis; synthetic/illustrative data.

-- 1) Portfolio profile
SELECT COUNT(*) AS row_count,
       COUNT(DISTINCT zone) AS zone_count,
       MIN(date) AS first_period,
       MAX(date) AS last_period
FROM portfolio_data;

-- 2) CTE + aggregation: zone KPIs
WITH zone_kpi AS (
    SELECT zone,
           AVG(storage_pct) AS avg_storage_pct,
           AVG(daily_demand_mld) AS avg_demand_mld,
           AVG(tanker_supply_mld) AS avg_tanker_supply_mld,
           AVG(rainfall_deficit_pct) AS avg_rainfall_deficit_pct
    FROM portfolio_data
    GROUP BY zone
)
SELECT zone,
       ROUND(avg_storage_pct,2) AS avg_storage_pct,
       ROUND(avg_demand_mld,1) AS avg_demand_mld,
       ROUND(avg_tanker_supply_mld,1) AS avg_tanker_supply_mld,
       ROUND(avg_rainfall_deficit_pct,1) AS avg_rainfall_deficit_pct
FROM zone_kpi
ORDER BY avg_storage_pct ASC;

-- 3) Window function: monthly stress trend and prior period movement
WITH monthly AS (
    SELECT DATE_FORMAT(date,'%Y-%m') AS month,
           AVG(storage_pct) AS avg_storage_pct,
           AVG(tanker_supply_mld) AS avg_tanker_supply_mld
    FROM portfolio_data
    GROUP BY DATE_FORMAT(date,'%Y-%m')
)
SELECT month,
       ROUND(avg_storage_pct,2) AS avg_storage_pct,
       ROUND(avg_tanker_supply_mld,1) AS avg_tanker_supply_mld,
       ROUND(avg_storage_pct - LAG(avg_storage_pct) OVER (ORDER BY month),2) AS storage_change_vs_prior_month
FROM monthly
ORDER BY month;

-- 4) Join + window function: rank zones against portfolio benchmark
WITH zone_kpi AS (
    SELECT zone,
           AVG(storage_pct) AS avg_storage_pct,
           AVG(tanker_supply_mld) AS avg_tanker_supply_mld,
           AVG(daily_demand_mld) AS avg_demand_mld
    FROM portfolio_data
    GROUP BY zone
), benchmark AS (
    SELECT AVG(avg_storage_pct) AS portfolio_avg_storage
    FROM zone_kpi
)
SELECT z.zone,
       ROUND(z.avg_storage_pct,2) AS avg_storage_pct,
       ROUND(b.portfolio_avg_storage,2) AS portfolio_avg_storage,
       ROUND(b.portfolio_avg_storage - z.avg_storage_pct,2) AS storage_gap,
       DENSE_RANK() OVER (ORDER BY z.avg_storage_pct ASC) AS storage_priority_rank
FROM zone_kpi z
CROSS JOIN benchmark b
ORDER BY storage_priority_rank;

-- 5) Exception queue: tanker dependency relative to demand
WITH zone_day AS (
    SELECT *,
           100.0 * tanker_supply_mld / NULLIF(daily_demand_mld,0) AS tanker_dependency_pct
    FROM portfolio_data
)
SELECT date, zone,
       ROUND(storage_pct,2) AS storage_pct,
       ROUND(tanker_dependency_pct,2) AS tanker_dependency_pct,
       ROUND(rainfall_deficit_pct,1) AS rainfall_deficit_pct
FROM zone_day
WHERE storage_pct < 50 OR tanker_dependency_pct > 10
ORDER BY storage_pct ASC, tanker_dependency_pct DESC;

-- 6) Data-quality control
SELECT COUNT(*) AS invalid_rows
FROM portfolio_data
WHERE date IS NULL OR zone IS NULL OR storage_pct IS NULL
   OR daily_demand_mld IS NULL OR tanker_supply_mld IS NULL
   OR rainfall_deficit_pct IS NULL;

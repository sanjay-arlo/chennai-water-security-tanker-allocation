-- Chennai Water Security & Tanker Allocation
-- MySQL 8+ portfolio analysis

CREATE TABLE portfolio_data (
  date DATE,
  zone VARCHAR(100),
  storage_pct DECIMAL(6,2),
  daily_demand_mld DECIMAL(10,2),
  tanker_supply_mld DECIMAL(10,2),
  rainfall_deficit_pct DECIMAL(6,2),
  daily_drawdown_pct DECIMAL(8,4)
);

-- 1. Portfolio profile
SELECT COUNT(*) AS row_count,
       COUNT(DISTINCT zone) AS zone_count,
       MIN(date) AS first_period,
       MAX(date) AS last_period
FROM portfolio_data;

-- 2. Zone prioritisation
SELECT zone,
       ROUND(AVG(storage_pct),2) AS avg_storage_pct,
       ROUND(AVG(daily_demand_mld),1) AS avg_demand_mld,
       ROUND(AVG(tanker_supply_mld),1) AS avg_tanker_supply_mld,
       ROUND(AVG(rainfall_deficit_pct),1) AS avg_rainfall_deficit_pct
FROM portfolio_data
GROUP BY zone
ORDER BY avg_storage_pct ASC;

-- 3. Monthly trend
SELECT date,
       ROUND(AVG(storage_pct),2) AS avg_storage_pct,
       ROUND(AVG(tanker_supply_mld),1) AS avg_tanker_supply_mld
FROM portfolio_data
GROUP BY date
ORDER BY date;

-- 4. High tanker-dependency observations
SELECT date, zone, storage_pct, daily_demand_mld, tanker_supply_mld
FROM portfolio_data
WHERE tanker_supply_mld > 10
ORDER BY tanker_supply_mld DESC;

-- 5. Data-quality control
SELECT COUNT(*) AS null_required_fields
FROM portfolio_data
WHERE date IS NULL OR zone IS NULL OR storage_pct IS NULL
   OR daily_demand_mld IS NULL OR tanker_supply_mld IS NULL
   OR rainfall_deficit_pct IS NULL;

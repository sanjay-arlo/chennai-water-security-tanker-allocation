# Industry BA Delivery Pack — Chennai Water Security & Tanker Allocation

## Executive decision
Prioritise scarce water-security capacity across Chennai zones using storage stress, tanker dependency, demand pressure and rainfall signals.

## Stakeholders
Water operations, tanker-dispatch teams, municipal planning, reservoir monitoring, finance/programme owners.

## Requirements
- Provide zone/date filtering and executive KPIs.
- Rank zones by transparent risk/prioritisation logic.
- Separate observed data, derived KPIs and scenario assumptions.
- Export the filtered analytical slice for operational review.
- Preserve synthetic-data labelling and source lineage.

## KPI dictionary
Storage %, average demand, tanker supply, tanker dependency, rainfall deficit, days-to-threshold and priority score.

## Analytical model
`dim_date` + `dim_zone` + `dim_source` → `fact_water_zone_day` → KPI layer → dashboard.

## Scenario model
Test tanker uplift, demand reduction and recharge investment assumptions; compare exposure and priority ranking before committing spend.

## Acceptance criteria
KPIs reconcile to the CSV source, filters affect all visuals, empty/invalid rows are handled, exports match the selected scope, and no external reference figure is mixed into synthetic operational data.

## Production controls
Refresh SLA, master-zone mapping, telemetry lineage, anomaly checks, approved thresholds, audit history and role-based access.

## Portfolio note
Synthetic data is used for demonstration. Production use requires governed operational sources and domain-owner approval.

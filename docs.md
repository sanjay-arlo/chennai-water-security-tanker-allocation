# Data Dictionary

| Field | Type | Meaning |
|---|---|---|
| `date` | date | Portfolio observation month |
| `zone` | text | Chennai supply zone |
| `storage_pct` | numeric | Portfolio storage indicator in percent |
| `daily_demand_mld` | numeric | Estimated daily demand in million litres per day |
| `tanker_supply_mld` | numeric | Portfolio tanker-supply indicator in MLD |
| `rainfall_deficit_pct` | numeric | Portfolio rainfall-deficit indicator in percent |
| `daily_drawdown_pct` | numeric | Portfolio daily drawdown indicator as a fraction |

## Grain

One row represents one zone-month observation.

## Data classification

All values in this file are synthetic portfolio values. The separate `data/source_snapshot.csv` contains contextual external-reference metadata.

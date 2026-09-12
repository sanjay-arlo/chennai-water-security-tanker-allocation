# Excel Analysis Guide

## Build sequence
1. Import `sample_reservoir_zone_data_chennai.csv` into an Excel Table.
2. Validate row count, blanks and duplicate zone-month keys.
3. Build PivotTables by zone and month.
4. Calculate average storage, demand, tanker supply and rainfall deficit.
5. Add a scenario section for tanker allocation assumptions.
6. Reconcile Excel totals against the SQL outputs and dashboard.

## Suggested dashboard sheet

- KPI cards
- Storage by zone bar chart
- Monthly storage trend line
- Priority-zone table
- Zone slicer

## Control checks

- Required-column presence
- Row count
- Null count
- Duplicate key count
- KPI reconciliation
- Synthetic-data warning clearly visible

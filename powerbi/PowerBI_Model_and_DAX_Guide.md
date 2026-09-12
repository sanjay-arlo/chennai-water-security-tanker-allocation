# Power BI Model & DAX Specification

## Model

Use a simple star-style model:

- Fact: `sample_reservoir_zone_data_chennai`
- Date dimension: Calendar table related to `date`
- Optional Zone dimension for governed geography and sorting

## Core measures

```DAX
Rows = COUNTROWS(FactWater)

Avg Storage % = AVERAGE(FactWater[storage_pct])

Avg Demand MLD = AVERAGE(FactWater[daily_demand_mld])

Avg Tanker Supply MLD = AVERAGE(FactWater[tanker_supply_mld])

Avg Rainfall Deficit % = AVERAGE(FactWater[rainfall_deficit_pct])

Priority Zones =
COUNTROWS(
    FILTER(
        VALUES(FactWater[zone]),
        CALCULATE([Avg Storage %]) < 30
    )
)
```

## UX

Executive KPI strip • storage-by-zone ranking • monthly trend • priority table • zone slicer • decision notes.

## Governance

Thresholds such as `<30% storage` are analytical demonstration rules only. Domain owners must approve production thresholds. Synthetic portfolio outputs must remain labelled as synthetic.

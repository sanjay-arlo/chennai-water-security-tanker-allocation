# Chennai Water Security & Tanker Allocation

> Business Analyst / Data Analyst portfolio case study for prioritising tanker supply, conservation and recharge investments across Chennai supply zones under water-stress conditions.

## 🚀 Live Dashboard

**[Open the interactive dashboard](https://sanjay-arlo.github.io/chennai-water-security-tanker-allocation/)**

The dashboard is a client-side portfolio demonstration. It reads the checked-in CSV, calculates KPIs in the browser and supports zone filtering.

## Business question

Where is water-security stress highest, and how should scarce tanker supply, conservation effort and recharge investment be prioritised?

## What the dashboard shows

- Average storage percentage by Chennai zone
- Daily demand and tanker-supply exposure
- Rainfall-deficit signal
- Storage trend across the portfolio period
- Top priority zones based on lower average storage

## 2026 reference snapshot

The repository keeps current external context separate from the synthetic portfolio dataset. The reference snapshot recorded on **11 September 2026** is **5,171 / 11,757 Mcft = 43.98%** Chennai drinking-water reservoir system storage, sourced from **TN-SMART / RIMES**.

This figure is a contextual reference point only. It is not presented as the value of the synthetic dashboard dataset.

## Dataset

`sample_reservoir_zone_data_chennai.csv` contains a synthetic portfolio dataset covering five Chennai supply zones across October 2025 to September 2026.

**Important:** these records are synthetic and are designed for Business Analyst portfolio demonstration, KPI design, dashboarding and decision-support practice. They are not operational telemetry.

## Analysis questions

1. Which zones show the lowest average storage?
2. Where is tanker dependency increasing?
3. How does rainfall deficit relate to supply stress?
4. Which operating units should receive first-line intervention?
5. What data controls would be required before production use?

## Project files

```text
.
├── index.html
├── style.css
├── app.js
├── sample_reservoir_zone_data_chennai.csv
├── data/
│   └── source_snapshot.csv
├── sql/
│   └── analysis.sql
├── excel/
│   └── Excel_Analysis_Guide.md
├── powerbi/
│   └── PowerBI_Model_and_DAX_Guide.md
├── BUSINESS_CASE.md
├── BUSINESS_REQUIREMENTS.md
├── STAKEHOLDER_MAP.md
├── docs.md
├── analysis.ipynb
└── scripts/
    └── validate_data.py
```

## Business Analyst framework

### Stakeholders

- Chennai drinking-water operations teams
- Municipal / regional planning stakeholders
- Tanker-dispatch and field teams
- Water-resource / reservoir monitoring teams
- Finance and programme managers

### Core decision

Move from a citywide headline number to a zone-level prioritisation model that combines exposure, supply dependency and early-warning signals.

### Recommended operating logic

**Priority = high exposure + low storage + high tanker dependency + persistent stress**

Thresholds should be agreed with domain owners before operational deployment.

## Technical stack

HTML • CSS • JavaScript • Chart.js • CSV • Python/Pandas • SQL • Excel • Power BI

## KPI logic

**Average storage %** = mean of `storage_pct` for the selected scope.

**Average demand** = mean of `daily_demand_mld` for the selected scope.

**Average tanker supply** = mean of `tanker_supply_mld` for the selected scope.

**Average rainfall deficit %** = mean of `rainfall_deficit_pct` for the selected scope.

## Data quality controls

- Required-column validation
- Non-empty dataset check
- Date completeness check
- Duplicate / key review
- Dashboard-to-source reconciliation
- Separate labelling of synthetic and external reference data

## Production upgrade path

A production version should replace the synthetic layer with governed reservoir telemetry, verified tanker trips, demand forecasts, rainfall observations, groundwater indicators and a documented master geography. It should also introduce refresh SLAs, data-quality monitoring, role-based access and approved intervention thresholds.

## Limitation

This is a **portfolio case study**, not an operational control system. Decisions should not be made from the synthetic dataset.

## Author

**Sanjay Arlo**  
Business Analyst / Data Analyst Portfolio  
[GitHub](https://github.com/sanjay-arlo)

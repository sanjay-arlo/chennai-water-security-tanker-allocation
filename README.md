# Chennai Water Security & Tanker Allocation

> **Business Analyst / Data Analyst portfolio case study** for prioritising tanker supply, conservation and recharge interventions across Chennai supply zones under water-stress conditions.

## 🚀 Live Dashboard

**[Open the interactive dashboard](https://sanjay-arlo.github.io/chennai-water-security-tanker-allocation/)**

The live site is a client-side portfolio dashboard that reads the checked-in illustrative dataset, applies KPI logic in the browser and supports interactive filtering.

## Executive summary

This case converts a water-supply problem into an analyst-led decision workflow: clean and reconcile zone-level data, quantify supply stress, rank intervention priorities, visualise the operating picture, and translate the findings into an action queue.

## Business problem

**Which Chennai supply zones need the earliest intervention, and how should scarce tanker capacity be prioritised?**

### Key decisions supported

- Which zones show the greatest storage stress?
- Where is tanker dependency highest?
- How does rainfall deficit interact with supply pressure?
- Which zones should receive first-line intervention?
- What additional data would be required before operational deployment?

## Analyst workflow

**Excel → Python / Pandas / NumPy (optional) → SQL / MySQL → Power BI → Decision**

### 1. Excel — first-pass business control

Data cleaning, reconciliation, formulas, pivots, KPI checks, exception analysis and scenario planning. Excel is the first layer for validating the business logic before database analysis.

### 2. Python — optional analytical layer

Use **Pandas + NumPy** when repeatable profiling, exploratory analysis, transformations, anomaly checks or sensitivity testing adds value. Python is intentionally optional rather than forced into the baseline workflow.

### 3. SQL / MySQL — mandatory analytical layer

Use joins, CTEs, aggregations, window functions, trend calculations, ranking, segmentation and exception queues to create reproducible analytical outputs.

### 4. Power BI — mandatory executive layer

Design a dimensional/star-style model, define governed DAX measures, add slicers and drill-through, and structure the executive story around risk, priority, trend and allocation scenarios.

### 5. Decision — mandatory outcome

Convert analysis into a management action queue with **priority, owner, intervention, expected impact, assumptions and escalation trigger**.

## Technical stack

- **Excel** — business calculations, reconciliation, pivots and scenario planning
- **SQL / MySQL** — governed KPI calculations, segmentation, ranking and exception analysis
- **Python / Pandas / NumPy** — optional data preparation, EDA, analytical checks and repeatable transformations
- **HTML / CSS / JavaScript** — interactive live dashboard interface
- **Chart.js** — browser-based visualisation and KPI charting
- **GitHub Pages** — live dashboard hosting
- **Power BI** — compatible dashboard design direction, data-model thinking and DAX specification
- **GitHub** — version control, documentation and portfolio delivery

## Dashboard story

1. **Risk Overview** — current stress signals and headline KPIs
2. **Zone Priorities** — ranked operating units requiring attention
3. **Stress Trend** — storage, demand and tanker-supply movement over time
4. **Allocation Scenario** — illustrative management levers and intervention assumptions
5. **Decision Table** — filtered priority queue for action planning
6. **Data Quality & Governance** — source integrity, grain and portfolio limitations

## KPI framework

- **Average storage %** = mean `storage_pct` for the selected scope
- **Average demand** = mean `daily_demand_mld`
- **Average tanker supply** = mean `tanker_supply_mld`
- **Average rainfall deficit %** = mean `rainfall_deficit_pct`
- **Operational priority** = low storage + high tanker dependency + persistent stress + exposure

## Data quality & governance

- Required-column and blank-field validation
- Date and key completeness checks
- Duplicate review
- KPI reconciliation between source, SQL and dashboard layers
- Explicit separation between synthetic portfolio data and external context
- Scenario assumptions labelled as illustrative

## Business Analyst deliverables

- Business case and problem framing
- Stakeholder-oriented requirements
- KPI dictionary and calculation logic
- Excel analysis workflow
- SQL analysis queries
- Optional Python analytical layer
- Power BI data-model and DAX specification
- Interactive executive dashboard
- Decision and intervention framework
- Production upgrade plan

## Repository structure

```text
.
├── dashboard/                  # reusable dashboard calculation engine
├── docs/                       # GitHub Pages dashboard assets and checked-in data
├── excel/                      # Excel implementation guidance
├── sql/                        # MySQL analysis queries
├── data/                       # source/context and methodology artifacts
├── scripts/                    # validation / data-quality utilities
├── BUSINESS_CASE.md
├── BUSINESS_REQUIREMENTS.md
├── STAKEHOLDER_MAP.md
├── BA_DA_PIPELINE.md
├── INDUSTRY_BA_DELIVERY_PACK.md
└── analysis.ipynb              # optional Python analysis
```

## Production upgrade path

A production implementation would replace illustrative records with governed reservoir telemetry, verified tanker trips, demand forecasts, rainfall observations, groundwater indicators and an approved master geography. It would also require refresh SLAs, lineage, data-quality monitoring, role-based access and domain-approved intervention thresholds.

## Important limitation

This repository is a **portfolio case study using synthetic / illustrative data**. It is not operational Chennai water telemetry and should not be used to make real-world allocation decisions.

## Author

**Sanjay Arlo**  
Business Analyst / Data Analyst Portfolio  
[GitHub](https://github.com/sanjay-arlo)

# BA / DA Delivery Pipeline

## Business question
Which Chennai supply zones need the earliest water-security intervention, and how should scarce tanker capacity be prioritised?

## 01 — Excel — mandatory first pass
Profile and reconcile zone-day data; clean dates and numeric fields; create tanker-dependency and stress flags; use formulas, pivots and exception analysis to identify weak zones and data-quality issues.

## 02 — Python (Pandas + NumPy) — optional
Use Python when scale, repeatability or deeper EDA adds value: automate profiling, test storage/demand relationships, detect unusual stress observations and produce reproducible transformation steps. Do not force Python into the baseline workflow.

## 03 — SQL — mandatory analytical layer
Use joins, CTEs, aggregations and window functions to build governed KPIs, zone rankings, rolling/trend metrics and exception queues. SQL is the reproducible calculation layer.

## 04 — Power BI — mandatory decision interface
Build a dimensional/star-style model, DAX measures, slicers, drill-through and executive storytelling: Risk Overview → Zone Priorities → Stress Trend → Tanker Allocation Scenario.

## 05 — Decision — mandatory outcome
Translate findings into a management action queue with priority, owner, intervention, expected impact, assumptions and escalation trigger.

## Acceptance criteria
KPI totals reconcile across Excel, SQL and Power BI; scenario assumptions are explicit; synthetic data is clearly labelled; decision rules are traceable to defined measures.

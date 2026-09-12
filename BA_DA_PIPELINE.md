# BA / DA Delivery Pipeline

## Business question
Which Chennai supply zones need the earliest water-security intervention, and how should tanker capacity be prioritised?

## 01 — Excel
Profile and reconcile the raw zone-day data. Create cleaned fields for tanker dependency and stress status. Review outliers, missing values and trend patterns. The Excel workbook is the analyst's first-pass control layer.

## 02 — SQL
Build governed KPI queries for storage, demand, tanker dependency, rainfall stress, zone ranking and exception identification. SQL is the reproducible calculation layer.

## 03 — Power BI
Create a star-style analytical model, governed measures, slicers, drill-through pages and an executive story: Risk Overview → Zone Priorities → Stress Trend → Allocation Scenario.

## 04 — Decision
Translate the analysis into an intervention queue: exposure, urgency, recommended action, owner and expected outcome.

## Acceptance criteria
KPI totals reconcile to the cleaned dataset; filters return consistent results; scenarios are labelled illustrative; synthetic data is never presented as operational telemetry.
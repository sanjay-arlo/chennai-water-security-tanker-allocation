# Business Requirements

## Functional requirements
1. Provide executive KPI cards for storage, demand, tanker supply and rainfall deficit.
2. Provide zone-level filtering and reset controls.
3. Provide a ranked storage view and a time trend.
4. Provide decision-support recommendations for priority zones.
5. Keep external reference data visibly separate from synthetic portfolio data.

## Non-functional requirements
- Dashboard must load in a browser without a backend.
- Source data must be version-controlled.
- Calculations must be reproducible.
- KPI definitions must be documented.
- Validation must fail visibly when required columns are missing.

## Acceptance criteria
- Dashboard loads the CSV successfully through GitHub Pages.
- All five zones are available in the filter.
- KPI cards recalculate when the zone changes.
- Charts refresh when the filter changes.
- Recommendation panel reflects the selected scope.

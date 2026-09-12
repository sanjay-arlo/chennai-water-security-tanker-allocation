# Optional Python Layer

Python is **not mandatory** for this case study. The baseline flow remains **Excel → SQL → Power BI → Decision**.

Use Pandas + NumPy when the data grows or when repeatable EDA, anomaly detection, statistical testing or automation provides value.

Suggested use here:
- Pandas for profiling, reproducible cleaning and zone-level exploration.
- NumPy for derived stress metrics and sensitivity calculations.
- Export validated results back into the governed SQL/Power BI flow.

The Python layer must not become a second source of truth; KPI definitions remain governed by the SQL/Power BI logic.

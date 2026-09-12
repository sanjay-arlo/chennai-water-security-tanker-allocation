"""Optional Pandas/NumPy layer for water-security EDA.
Run: python analysis.py --input path/to/data.csv
"""
import argparse
import numpy as np
import pandas as pd

REQUIRED = ["date", "zone", "storage_pct", "daily_demand_mld", "tanker_supply_mld", "rainfall_deficit_pct"]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True, help="CSV input path")
    args = parser.parse_args()
    df = pd.read_csv(args.input)
    missing = [c for c in REQUIRED if c not in df.columns]
    if missing:
        raise ValueError(f"Missing required columns: {missing}")

    numeric = REQUIRED[2:]
    df[numeric] = df[numeric].apply(pd.to_numeric, errors="coerce")
    df["tanker_dependency_pct"] = np.where(
        df["daily_demand_mld"] > 0,
        100 * df["tanker_supply_mld"] / df["daily_demand_mld"],
        np.nan,
    )
    df["stress_flag"] = np.where((df["storage_pct"] < 50) | (df["tanker_dependency_pct"] > 10), 1, 0)

    zone = (
        df.groupby("zone", as_index=False)
        .agg(avg_storage_pct=("storage_pct", "mean"),
             avg_tanker_dependency_pct=("tanker_dependency_pct", "mean"),
             stress_observations=("stress_flag", "sum"))
        .sort_values(["avg_storage_pct", "stress_observations"])
    )
    zone["storage_percentile"] = np.percentile(
        zone["avg_storage_pct"],
        np.linspace(0, 100, len(zone)),
    ) if len(zone) else []
    print("Rows:", len(df))
    print(zone.to_string(index=False))


if __name__ == "__main__":
    main()

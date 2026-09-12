from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
FILE = ROOT / 'sample_reservoir_zone_data_chennai.csv'
EXPECTED_COLUMNS = [
    'date', 'zone', 'storage_pct', 'daily_demand_mld',
    'tanker_supply_mld', 'rainfall_deficit_pct', 'daily_drawdown_pct'
]


def main():
    df = pd.read_csv(FILE)
    missing = [c for c in EXPECTED_COLUMNS if c not in df.columns]
    assert not missing, f'Missing columns: {missing}'
    assert len(df) > 0, 'Dataset is empty'
    assert df[EXPECTED_COLUMNS].notna().all().all(), 'Required fields contain nulls'
    assert df['storage_pct'].between(0, 100).all(), 'storage_pct outside 0-100'
    assert df['rainfall_deficit_pct'].between(0, 100).all(), 'rainfall_deficit_pct outside 0-100'
    assert (df['daily_demand_mld'] >= 0).all(), 'Negative demand detected'
    assert (df['tanker_supply_mld'] >= 0).all(), 'Negative tanker supply detected'
    keys = df[['date', 'zone']].astype(str).agg('|'.join, axis=1)
    assert not keys.duplicated().any(), 'Duplicate zone-month keys detected'
    print(f'PASS: {len(df)} rows, {len(df.columns)} columns, {df.zone.nunique()} zones')


if __name__ == '__main__':
    main()

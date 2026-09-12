const FILE = 'sample_reservoir_zone_data_chennai.csv';
let rows = [];
let storageChart = null;
let trendChart = null;
const $ = (s) => document.querySelector(s);
const number = (v) => Number(v) || 0;
const mean = (arr, field) => arr.length ? arr.reduce((s, r) => s + number(r[field]), 0) / arr.length : 0;
const groupBy = (arr, field) => {
  const map = new Map();
  arr.forEach((r) => {
    if (!map.has(r[field])) map.set(r[field], []);
    map.get(r[field]).push(r);
  });
  return map;
};

function parseCsv(text) {
  const lines = text.trim().split(/\r?\n/);
  const headers = lines.shift().split(',');
  return lines.filter(Boolean).map((line) => {
    const values = line.split(',');
    return Object.fromEntries(headers.map((h, i) => [h, Number.isNaN(Number(values[i])) || values[i] === '' ? values[i] : Number(values[i])]));
  });
}

function renderCharts(filtered) {
  const byZone = groupBy(filtered, 'zone');
  const zones = [...byZone.keys()];
  const storage = zones.map((z) => mean(byZone.get(z), 'storage_pct'));
  const dates = [...new Set(filtered.map((r) => r.date))].sort();
  const trend = dates.map((d) => mean(filtered.filter((r) => r.date === d), 'storage_pct'));

  storageChart?.destroy();
  trendChart?.destroy();
  storageChart = new Chart($('#storageChart'), {
    type: 'bar',
    data: { labels: zones, datasets: [{ label: 'Storage %', data: storage }] },
    options: { responsive: true, maintainAspectRatio: false, plugins: { legend: { display: false } }, scales: { y: { beginAtZero: true, max: 100 } } }
  });
  trendChart = new Chart($('#trendChart'), {
    type: 'line',
    data: { labels: dates, datasets: [{ label: 'Storage %', data: trend, tension: 0.25, fill: false }] },
    options: { responsive: true, maintainAspectRatio: false, scales: { y: { beginAtZero: true, max: 100 } } }
  });
}

function render() {
  const selected = $('#filter').value;
  const filtered = rows.filter((r) => !selected || r.zone === selected);
  $('#k0').textContent = `${mean(filtered, 'storage_pct').toFixed(1)}%`;
  $('#k1').textContent = `${mean(filtered, 'daily_demand_mld').toFixed(0)} MLD`;
  $('#k2').textContent = `${mean(filtered, 'tanker_supply_mld').toFixed(1)} MLD`;
  $('#k3').textContent = `${mean(filtered, 'rainfall_deficit_pct').toFixed(1)}%`;
  $('#status').textContent = `${filtered.length} records • ${new Set(filtered.map((r) => r.zone)).size} zones`;

  renderCharts(filtered);
  const byZone = groupBy(filtered, 'zone');
  const priority = [...byZone.entries()]
    .map(([zone, data]) => ({ zone, storage: mean(data, 'storage_pct'), tanker: mean(data, 'tanker_supply_mld'), deficit: mean(data, 'rainfall_deficit_pct') }))
    .sort((a, b) => a.storage - b.storage)
    .slice(0, 5);
  $('#recs').innerHTML = priority.length
    ? priority.map((p) => `<p><b>${p.zone}</b> — average storage ${p.storage.toFixed(1)}%; tanker supply ${p.tanker.toFixed(1)} MLD; rainfall deficit ${p.deficit.toFixed(1)}%. Prioritise field assessment and targeted conservation/recharge review.</p>`).join('')
    : '<p>No records match the selected filter.</p>';
}

async function load() {
  try {
    const response = await fetch(FILE, { cache: 'no-store' });
    if (!response.ok) throw new Error(`HTTP ${response.status}`);
    rows = parseCsv(await response.text());
    const zones = [...new Set(rows.map((r) => r.zone))].sort();
    $('#filter').innerHTML = '<option value="">All zones</option>' + zones.map((z) => `<option value="${z}">${z}</option>`).join('');
    $('#filter').addEventListener('change', render);
    $('#reset').addEventListener('click', () => { $('#filter').value = ''; render(); });
    render();
  } catch (error) {
    $('#status').textContent = 'Data load failed';
    $('#recs').innerHTML = `<p><b>Dashboard error:</b> ${error.message}. Open through GitHub Pages or another HTTP server so the CSV can be fetched.</p>`;
  }
}

load();

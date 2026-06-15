# Stablecoin Depeg Monitor

Track USDC and USDT price deviations from the $1 peg and on-chain transfer flows during stress events on Ethereum — powered by Dune Analytics.

## Dashboard

**Live Dashboard:** [https://dune.com/harshit_dabra/stablecoin-depeg-monitor](https://dune.com/harshit_dabra/stablecoin-depeg-monitor)

## Overview

This project monitors stablecoin stability by analyzing:

- **Price deviation** from $1 peg for USDC and USDT over 90 days
- **Transfer volume flows** on Ethereum over 30 days (stress event indicator)
- **Depeg events** — hourly instances where price deviated more than 0.1% from peg
- **Summary stats** — worst depeg %, min/max price, and total depeg hours over 90 days

## Queries

| File | Description | Dune Query |
|------|-------------|------------|
| `01_price_vs_peg.sql` | Daily avg price vs $1 peg for USDC & USDT (90d) | [Query 7722736](https://dune.com/queries/7722736) |
| `02_transfer_flows.sql` | Daily USDC/USDT transfer volume on Ethereum (30d) | [Query 7722746](https://dune.com/queries/7722746) |
| `03_depeg_events.sql` | Hourly depeg events >0.1% deviation (90d) | [Query 7722756](https://dune.com/queries/7722756) |
| `04_summary_stats.sql` | Aggregate KPI stats: worst depeg %, min/max price, depeg hours | [Query 7722766](https://dune.com/queries/7722766) |

## Data Sources

All queries use Dune Analytics Spellbook tables:

- `prices.usd` — minute-level token prices across blockchains
- `tokens_ethereum.transfers` — standardized ERC-20 transfer events on Ethereum

## Key Findings (Last 90 Days)

| Metric | USDC | USDT |
|--------|------|------|
| Avg Price | ~$1.000 | ~$0.9997 |
| Worst Depeg | ~0.23% | ~0.32% |
| Min Price | ~$0.9977 | ~$0.9968 |
| Max Price | ~$1.0022 | ~$1.0022 |

## Charts

1. **USDC/USDT Price vs $1 Peg (90d)** — Line chart showing daily average price for both stablecoins
2. **Daily Transfer Volume (30d)** — Stacked bar chart of USDC and USDT transfer volume on Ethereum
3. **Depeg Events Scatter (90d)** — Scatter plot of hourly events where price deviated >0.1%
4. **Worst Depeg % by Stablecoin** — Bar chart comparing worst depeg percentages

## Setup

1. Open any `.sql` file in this repo
2. Paste into [Dune Analytics Query Editor](https://dune.com/queries/new)
3. Run and visualize

No wallet or API key required — all data is public on Dune.

## Author

**Harshit Dabra** — [@harshitdabra](https://github.com/harshitdabra)

# stablecoin-depeg-monitor

Tracks USDC and USDT price movements and on-chain flows during market stress events. Built on Dune Analytics using Ethereum data.

**Dashboard:** https://dune.com/harshit_dabra/stablecoin-depeg-monitor

---

## What this tracks

- How far USDC and USDT drift from $1 on a daily basis over 90 days
- Transfer volume on Ethereum — spikes here usually coincide with panic or uncertainty
- Specific hours where either coin moved more than 0.1% off peg
- 90-day summary: worst depeg, min/max price, and total hours spent off-peg

## Queries

| File | What it does |
|------|-------------|
| `01_price_vs_peg.sql` | Daily avg price for USDC & USDT vs the $1 target |
| `02_transfer_flows.sql` | Daily transfer volume + 7-day rolling average on Ethereum |
| `03_depeg_events.sql` | Filters hourly candles where deviation exceeded 0.1% |
| `04_summary_stats.sql` | Worst depeg %, price range, depeg hours — per coin |

Dune links: [7722736](https://dune.com/queries/7722736) · [7722746](https://dune.com/queries/7722746) · [7722756](https://dune.com/queries/7722756) · [7722766](https://dune.com/queries/7722766)

## Tables used

- `prices.usd` — minute-level prices from Dune's spellbook
- `tokens_ethereum.transfers` — ERC-20 transfer data on Ethereum

## Key numbers (last 90 days)

USDT had a slightly wider worst depeg (~0.32%) vs USDC (~0.23%). Both spent most of the window within 0.1% of $1. Transfer volume showed a clear spike in late May.

## Running locally

Copy any `.sql` file into the Dune query editor at https://dune.com/queries/new and hit run. No setup needed.

# stablecoin-depeg-monitor

Tracks how far USDC and USDT drift from their dollar peg, and what's happening with on-chain transfer flows during periods of market stress. Built on Dune Analytics using Ethereum data.

Dashboard: https://dune.com/harshit_dabra/stablecoin-depeg-monitor

## What it tracks

Daily average price of both coins against the $1 target over a 90 day window, transfer volume on Ethereum (spikes here usually line up with panic or uncertainty), the specific hours where either coin moved more than 0.1% off peg, and a 90 day summary of the worst depeg, price range, and total hours spent off peg.

## Queries

`01_price_vs_peg.sql` compares daily average price against the target. `02_transfer_flows.sql` tracks daily transfer volume with a 7 day rolling average. `03_depeg_events.sql` filters hourly candles where the deviation crossed 0.1%. `04_summary_stats.sql` rolls all of that up into worst depeg percentage, price range and total depeg hours per coin.

Pulls from `prices.usd` and `tokens_ethereum.transfers` in Dune's spellbook.

Over the last 90 days, USDT had a slightly wider worst depeg (around 0.32%) compared to USDC (around 0.23%), though both spent most of the window within 0.1% of a dollar. Transfer volume spiked noticeably in late May.

To run any of it, just paste the SQL into a new query at dune.com/queries/new and hit run, no setup needed.

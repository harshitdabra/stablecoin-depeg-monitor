-- Query 2: USDC/USDT Transfer Flows - Ethereum (30d)
-- Source: tokens_ethereum.transfers (Dune Spellbook)
-- Dashboard: https://dune.com/harshit_dabra/stablecoin-depeg-monitor

SELECT
    DATE_TRUNC('day', block_time) AS day,
    symbol AS stablecoin,
    COUNT(*) AS transfer_count,
    SUM(amount_usd) AS volume_usd,
    AVG(SUM(amount_usd)) OVER (
        PARTITION BY symbol
        ORDER BY DATE_TRUNC('day', block_time)
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_7d_avg_volume
FROM tokens_ethereum.transfers
WHERE
    symbol IN ('USDC', 'USDT')
    AND block_time >= NOW() - INTERVAL '30' DAY
    AND amount_usd > 0
GROUP BY 1, 2
ORDER BY 1 DESC, 2

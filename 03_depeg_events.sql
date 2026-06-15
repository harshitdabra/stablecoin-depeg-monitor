SELECT
    DATE_TRUNC('hour', minute) AS hour,
    symbol,
    AVG(price) AS avg_price,
    AVG(price) - 1.0 AS peg_deviation,
    ABS(AVG(price) - 1.0) * 100 AS depeg_pct,
    CASE
        WHEN AVG(price) > 1.001 THEN 'Above Peg'
        WHEN AVG(price) < 0.999 THEN 'Below Peg'
        ELSE 'At Peg'
    END AS depeg_status
FROM prices.usd
WHERE
    blockchain = 'ethereum'
    AND symbol IN ('USDC', 'USDT')
    AND minute >= NOW() - INTERVAL '90' DAY
GROUP BY 1, 2
HAVING ABS(AVG(price) - 1.0) > 0.001
ORDER BY depeg_pct DESC-- Query 3: USDC/USDT Depeg Events (>0.1% deviation, 90d)
-- Source: prices.usd (Dune Spellbook)
-- Dashboard: https://dune.com/harshit_dabra/stablecoin-depeg-monitor

SELECT
    DATE_TRUNC('hour', minute) AS hour,
    symbol,
    AVG(price) AS avg_price,
    AVG(price) - 1.0 AS peg_deviation,
    ABS(AVG(price) - 1.0) * 100 AS depeg_pct,
    CASE
        WHEN AVG(price) > 1.001 THEN 'Above Peg'
        WHEN AVG(price) < 0.999 THEN 'Below Peg'
        ELSE 'At Peg'
    END AS depeg_status
FROM prices.usd
WHERE
    blockchain = 'ethereum'
    AND symbol IN ('USDC', 'USDT')
    AND minute >= NOW() - INTERVAL '90' DAY
GROUP BY 1, 2
HAVING ABS(AVG(price) - 1.0) > 0.001
ORDER BY depeg_pct DESC

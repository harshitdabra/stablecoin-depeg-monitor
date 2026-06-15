SELECT
    symbol,
    MIN(price) AS min_price_90d,
    MAX(price) AS max_price_90d,
    AVG(price) AS avg_price_90d,
    MAX(ABS(price - 1.0)) AS worst_depeg_abs,
    MAX(ABS(price - 1.0)) * 100 AS worst_depeg_pct,
    COUNT(CASE WHEN ABS(price - 1.0) * 100 > 0.1 THEN 1 END) AS depeg_hours
FROM prices.usd
WHERE
    blockchain = 'ethereum'
    AND symbol IN ('USDC', 'USDT')
    AND minute >= NOW() - INTERVAL '90' DAY
GROUP BY 1
ORDER BY 5 DESC

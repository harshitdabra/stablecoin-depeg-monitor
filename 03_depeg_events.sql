SELECT
    DATE_TRUNC('hour', minute) AS hour,
    symbol,
    AVG(price) AS avg_price,
    ABS(AVG(price) - 1.0) * 100 AS depeg_pct,
    CASE
        WHEN ABS(AVG(price) - 1.0) * 100 > 1.0 THEN 'severe'
        WHEN ABS(AVG(price) - 1.0) * 100 > 0.5 THEN 'moderate'
        WHEN ABS(AVG(price) - 1.0) * 100 > 0.1 THEN 'minor'
        ELSE 'stable'
    END AS depeg_severity
FROM prices.usd
WHERE
    blockchain = 'ethereum'
    AND symbol IN ('USDC', 'USDT')
    AND minute >= NOW() - INTERVAL '90' DAY
GROUP BY 1, 2
HAVING ABS(AVG(price) - 1.0) * 100 > 0.1
ORDER BY 4 DESC

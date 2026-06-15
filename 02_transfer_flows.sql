SELECT
    DATE_TRUNC('day', evt_block_time) AS day,
    contract_address,
    SUM(CAST(value AS DOUBLE) / 1e6) AS transfer_volume_usd,
    COUNT(*) AS num_transfers
FROM erc20_ethereum.evt_Transfer
WHERE
    contract_address IN (
        0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48,
        0xdac17f958d2ee523a2206206994597c13d831ec7
    )
    AND evt_block_time >= NOW() - INTERVAL '30' DAY
GROUP BY 1, 2
ORDER BY 1 DESC, 3 DESC

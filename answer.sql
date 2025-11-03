SELECT
 i.investor_id,
 s.sector_name,
 ROUND((i.no_of_shares * 100.0 / 
        SUM(i.no_of_shares) OVER (PARTITION BY i.investor_id)
    ), 2) AS share_percentage
FROM investor_transactions i
JOIN sectors s
ON i.sector_id = s.sector_id
ORDER BY 
    i.investor_id, 
    share_percentage DESC;

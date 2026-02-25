SELECT 
    s.user_id,
    CAST(AVG(CASE WHEN c.[action] = 'confirmed' THEN 1.0 ELSE 0.0 END) AS DECIMAL(3, 2)) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c 
    ON s.user_id = c.user_id
GROUP BY s.user_id
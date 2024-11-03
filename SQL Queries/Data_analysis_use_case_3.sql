USE [S24_EXAM_DWH]
SELECT 
    fo.Payment_type,
    AVG(DATEDIFF(day, ddp.Date, ddd.Date)) AS avg_completion_time_days
FROM 
    FactOrders fo
JOIN 
    DimDate ddp ON fo.Order_purchase_date = ddp.DateKey
JOIN 
    DimDate ddd ON fo.Order_delivered_customer_date = ddd.DateKey
WHERE 
    fo.Order_status = 'Delivered'
GROUP BY 
    fo.Payment_type
ORDER BY 
    avg_completion_time_days;

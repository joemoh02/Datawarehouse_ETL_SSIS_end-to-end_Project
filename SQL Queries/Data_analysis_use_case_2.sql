USE [S24_EXAM_DWH]

SELECT 
    delays.product_category_name_english,
    AVG(delivery_delay_days) AS avg_delay_days,
	ROUND(STDEV(delays.delivery_delay_days),2) AS stddev_delay_days
FROM 
    (SELECT 
    fo.Order_id,
    fo.Order_item_id,
    DATEDIFF(day, da.Date, dd.Date) AS delivery_delay_days,
    dp.product_category_name_english,
    dc.geolocation_key AS customer_location,
    fo.payment_type,
    dp.product_weight_g
FROM 
    FactOrders fo
JOIN 
    DimDate da ON fo.order_approved_at = da.DateKey
JOIN 
    DimDate dd ON fo.order_delivered_customer_date = dd.DateKey
JOIN 
    DimProducts dp ON fo.product_key = dp.product_key
JOIN 
    DimCustomers dc ON fo.customer_key = dc.customer_key
WHERE 
    DATEDIFF(day, da.Date, dd.Date) > 0) AS delays
GROUP BY 
    delays.product_category_name_english
ORDER BY 
    avg_delay_days DESC;

GO

USE [S24_EXAM_DWH]

SELECT 
    delays.customer_location,
    AVG(delivery_delay_days) AS avg_delay_days,
	ROUND(STDEV(delays.delivery_delay_days),2) AS stddev_delay_days
FROM 
    (SELECT 
    fo.Order_id,
    fo.Order_item_id,
    DATEDIFF(day, da.Date, dd.Date) AS delivery_delay_days,
    dp.product_category_name_english,
    dc.geolocation_key AS customer_location,
    fo.payment_type,
    dp.product_weight_g
FROM 
    FactOrders fo
JOIN 
    DimDate da ON fo.order_approved_at = da.DateKey
JOIN 
    DimDate dd ON fo.order_delivered_customer_date = dd.DateKey
JOIN 
    DimProducts dp ON fo.product_key = dp.product_key
JOIN 
    DimCustomers dc ON fo.customer_key = dc.customer_key
WHERE 
    DATEDIFF(day, da.Date, dd.Date) > 0) AS delays
GROUP BY 
    delays.customer_location
ORDER BY 
    avg_delay_days DESC;
GO


USE [S24_EXAM_DWH]

SELECT 
    delays.product_weight_g,
    AVG(delivery_delay_days) AS avg_delay_days,
	ROUND(STDEV(delays.delivery_delay_days),2) AS stddev_delay_days
FROM 
    (SELECT 
    fo.Order_id,
    fo.Order_item_id,
    DATEDIFF(day, da.Date, dd.Date) AS delivery_delay_days,
    dp.product_category_name_english,
    dc.geolocation_key AS customer_location,
    fo.payment_type,
    dp.product_weight_g
FROM 
    FactOrders fo
JOIN 
    DimDate da ON fo.order_approved_at = da.DateKey
JOIN 
    DimDate dd ON fo.order_delivered_customer_date = dd.DateKey
JOIN 
    DimProducts dp ON fo.product_key = dp.product_key
JOIN 
    DimCustomers dc ON fo.customer_key = dc.customer_key
WHERE 
    DATEDIFF(day, da.Date, dd.Date) > 0) AS delays
GROUP BY 
    delays.product_weight_g
ORDER BY 
    product_weight_g DESC;
GO



USE [S24_EXAM_DWH]

SELECT 
    delays.payment_type,
    AVG(delivery_delay_days) AS avg_delay_days,
	ROUND(STDEV(delays.delivery_delay_days),2) AS stddev_delay_days
FROM 
    (SELECT 
    fo.Order_id,
    fo.Order_item_id,
    DATEDIFF(day, da.Date, dd.Date) AS delivery_delay_days,
    dp.product_category_name_english,
    dc.geolocation_key AS customer_location,
    fo.payment_type,
    dp.product_weight_g
FROM 
    FactOrders fo
JOIN 
    DimDate da ON fo.order_approved_at = da.DateKey
JOIN 
    DimDate dd ON fo.order_delivered_customer_date = dd.DateKey
JOIN 
    DimProducts dp ON fo.product_key = dp.product_key
JOIN 
    DimCustomers dc ON fo.customer_key = dc.customer_key
WHERE 
    DATEDIFF(day, da.Date, dd.Date) > 0) AS delays
GROUP BY 
    delays.payment_type
ORDER BY 
    avg_delay_days DESC;
GO

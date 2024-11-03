USE [S24_EXAM_DWH]

SELECT 
    dp.product_category_name_english,
    AVG(dr.review_score) AS avg_review_score
FROM 
    FactOrders fo
JOIN 
    DimProducts dp ON fo.product_key = dp.product_key
JOIN 
    DimReviews dr ON fo.review_key = dr.review_key
GROUP BY 
    dp.product_category_name_english
ORDER BY 
    avg_review_score DESC; 



	USE [S24_EXAM_DWH];

WITH RankedCategories AS (
    SELECT 
        dp.product_category_name_english,
        AVG(dr.review_score) AS avg_review_score,
        ROW_NUMBER() OVER (ORDER BY AVG(dr.review_score) DESC) AS rn_desc,
        ROW_NUMBER() OVER (ORDER BY AVG(dr.review_score) ASC) AS rn_asc
    FROM 
        FactOrders fo
    JOIN 
        DimProducts dp ON fo.product_key = dp.product_key
    JOIN 
        DimReviews dr ON fo.review_key = dr.review_key
    GROUP BY 
        dp.product_category_name_english
)

SELECT 
    product_category_name_english,
    avg_review_score
FROM 
    RankedCategories
WHERE 
    rn_desc = 1 OR rn_asc = 1;

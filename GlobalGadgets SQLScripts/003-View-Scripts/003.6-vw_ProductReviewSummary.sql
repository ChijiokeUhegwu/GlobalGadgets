USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| VIEW: vw_ProductReviewSummary |===============--
----------------------------------------------------------------
-- Brief description: To get an overview of the Product ratings

CREATE VIEW dbo.vw_ProductReviewSummary AS
SELECT 
    p.product_id,
    p.product_name,
    cat.category_name,
    s.supplier_name,
    COUNT(r.review_id) AS total_reviews,
    AVG(r.rating * 1.0) AS average_rating
FROM dbo.Products AS p
JOIN dbo.Categories AS cat
    ON p.category_id = cat.category_id
JOIN dbo.Suppliers AS s
    ON p.supplier_id = s.supplier_id
LEFT JOIN dbo.Reviews AS r
    ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name, cat.category_name, s.supplier_name;
GO

-- Test the view
SELECT TOP 20 * FROM dbo.vw_ProductReviewSummary;
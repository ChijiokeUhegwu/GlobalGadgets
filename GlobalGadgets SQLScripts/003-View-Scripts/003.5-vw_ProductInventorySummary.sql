USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| VIEW: vw_ProductInventorySummary |===============--
----------------------------------------------------------------
-- Brief description: To get an overview of the product stock and supplier info

CREATE VIEW dbo.vw_ProductInventorySummary AS
SELECT 
    p.product_id,
    p.product_name,
    cat.category_name,
    s.supplier_name,
    i.stock_level,
    i.last_updated
FROM dbo.Products AS p
JOIN dbo.Categories AS cat
    ON p.category_id = cat.category_id
JOIN dbo.Suppliers AS s
    ON p.supplier_id = s.supplier_id
JOIN dbo.Inventory AS i
    ON p.product_id = i.product_id;
GO

-- Test the view
SELECT TOP 20 * FROM dbo.vw_ProductInventorySummary
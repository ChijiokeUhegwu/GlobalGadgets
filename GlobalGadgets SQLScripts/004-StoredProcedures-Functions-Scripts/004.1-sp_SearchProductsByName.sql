USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| SP: Search Products by Name |===============--
----------------------------------------------------------------
-- Brief description: This stored procedure searches for any product name that
-- matches a keyword, joins with orders, and sorts results by latest order date.

CREATE PROCEDURE dbo.sp_SearchProductsByName
    @SearchTerm NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT
        p.product_id,
        p.product_name,
        cat.category_name,
        s.supplier_name,
        o.order_id,
        o.order_date,
        o.status AS order_status
    FROM dbo.Products AS p
    JOIN dbo.Categories AS cat
        ON p.category_id = cat.category_id
    JOIN dbo.Suppliers AS s
        ON p.supplier_id = s.supplier_id
    LEFT JOIN dbo.OrderDetails AS od
        ON p.product_id = od.product_id
    LEFT JOIN dbo.Orders AS o
        ON od.order_id = o.order_id
    WHERE p.product_name LIKE '%' + @SearchTerm + '%'
    ORDER BY o.order_date DESC;
END;
GO

-- Test the procedure
EXEC dbo.sp_SearchProductsByName @SearchTerm = 'Sma';


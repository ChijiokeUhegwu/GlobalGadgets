USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| SP: Today's Orders by Customer |===============--
----------------------------------------------------------------
-- Brief description: This stored procedure returns all products and suppliers 
-- for a given customer who placed an order today.
CREATE PROCEDURE dbo.sp_GetTodaysOrdersByCustomer
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        o.order_id,
        o.order_date,
        p.product_name,
        s.supplier_name,
        cat.category_name,
        od.quantity,
        od.unit_price
    FROM dbo.Orders AS o
    JOIN dbo.OrderDetails AS od
        ON o.order_id = od.order_id
    JOIN dbo.Products AS p
        ON od.product_id = p.product_id
    JOIN dbo.Suppliers AS s
        ON p.supplier_id = s.supplier_id
    JOIN dbo.Categories AS cat
        ON p.category_id = cat.category_id
    WHERE 
        o.customer_id = @CustomerID
        AND CAST(o.order_date AS DATE) = CAST(GETDATE() AS DATE)
    ORDER BY p.product_name;
END;
GO

-- Test the procedure 
-- This may return an empty table since no orders were made "today"
EXEC dbo.sp_GetTodaysOrdersByCustomer @CustomerID = 1000;

-- Insert new records into the table with today's date
-- Make sure the IDs you reference in the tables actually exist.
INSERT INTO dbo.Orders (customer_id, shippingmethod_id, order_date, status, total_cost)
VALUES (1000, 1, GETDATE(), 'Processing', 450.00);

-- Add an OrderDetail line for that new order
INSERT INTO dbo.OrderDetails (order_id, product_id, quantity, unit_price)
VALUES (SCOPE_IDENTITY(), 3000, 1, 225.00);





USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| SP: Delete Delivered Orders |===============--
----------------------------------------------------------------
-- Brief description: This stored procedure safely deletes orders (and cascades related OrderDetails, Payments, Refunds, etc.)
-- Only removes fully delivered orders.

CREATE OR ALTER PROCEDURE dbo.sp_DeleteDeliveredOrders
AS
BEGIN
    SET NOCOUNT ON;

    -- First, delete Reviews linked to delivered orders
    DELETE r
    FROM dbo.Reviews AS r
    INNER JOIN dbo.OrderDetails AS od ON r.orderdetail_id = od.orderdetail_id
    INNER JOIN dbo.Orders AS o ON od.order_id = o.order_id
    WHERE o.status = 'Delivered';

    -- Next, delete OrderDetails linked to delivered orders
    DELETE od
    FROM dbo.OrderDetails AS od
    INNER JOIN dbo.Orders AS o ON od.order_id = o.order_id
    WHERE o.status = 'Delivered';

    -- Finally, delete the Orders themselves
    DELETE FROM dbo.Orders
    WHERE status = 'Delivered';
END;
GO

-- T0 test the procedure
-- 1. Before you run the delete procedure, check which orders currently have the status 'Delivered'
SELECT o.order_id, o.status, c.full_name, o.order_date
FROM dbo.Orders AS o
JOIN dbo.Customers AS c ON o.customer_id = c.customer_id
WHERE o.status = 'Delivered';

--2. Run the stored procedure
EXEC dbo.sp_DeleteDeliveredOrders;

-- 3. You can queries below to confirm that the procedure worked
-- Orders with 'Delivered' status should now be gone
SELECT * FROM dbo.Orders WHERE status = 'Delivered';

-- Check if related OrderDetails were deleted
SELECT * FROM dbo.OrderDetails 
WHERE order_id NOT IN (SELECT order_id FROM dbo.Orders);

-- Check if related Reviews were deleted
SELECT * FROM dbo.Reviews 
WHERE orderdetail_id NOT IN (SELECT orderdetail_id FROM dbo.OrderDetails);


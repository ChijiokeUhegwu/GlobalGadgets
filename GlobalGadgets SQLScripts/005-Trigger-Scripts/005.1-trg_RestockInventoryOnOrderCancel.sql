USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| Trigger: Restock Inventory on Order Cancel |===============--
----------------------------------------------------------------
-- Purpose:
-- Whenever an order status changes to 'Cancelled', this trigger
-- automatically increases the stock level in the Inventory table
-- for each product in that order.
----------------------------------------------------------------

CREATE TRIGGER dbo.trg_RestockInventoryOnOrderCancel
ON dbo.Orders
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Only proceed if the order's status was changed to 'Cancelled'
    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        JOIN deleted AS d
            ON i.order_id = d.order_id
        WHERE i.status = 'Cancelled' AND d.status <> 'Cancelled'
    )
    BEGIN
        -- Update inventory stock levels
        UPDATE inv
        SET inv.stock_level = inv.stock_level + od.quantity,
            inv.last_updated = GETDATE()
        FROM dbo.Inventory AS inv
        JOIN dbo.OrderDetails AS od
            ON inv.product_id = od.product_id
        JOIN inserted AS i
            ON od.order_id = i.order_id
        JOIN deleted AS d
            ON i.order_id = d.order_id
        WHERE i.status = 'Cancelled' AND d.status <> 'Cancelled';
    END
END;
GO

----------------------------------------------------------------
--===============| Test the Trigger |===============--
----------------------------------------------------------------

-- 1. Check an existing order (not cancelled)
SELECT order_id, status FROM dbo.Orders WHERE status <> 'Cancelled';

-- Select the supposed order_id that is "processing"
SELECT * FROM dbo.OrderDetails WHERE order_id = 4001;

-- Check current inventory for the product(s)
SELECT * FROM dbo.Inventory WHERE product_id IN (
    SELECT product_id FROM dbo.OrderDetails WHERE order_id = 4001
);

-- 2. Cancel the order (this should fire the trigger)
UPDATE dbo.Orders
SET status = 'Cancelled'
WHERE order_id = 4001;

-- 3. Verify that inventory has increased
SELECT * FROM dbo.Inventory WHERE product_id IN (
    SELECT product_id FROM dbo.OrderDetails WHERE order_id = 4001
);


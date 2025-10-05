USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| Trigger: Update Inventory On Order Placement |===============--
----------------------------------------------------------------
-- Purpose:
-- Decrease stock automatically when a new order is placed.
----------------------------------------------------------------


CREATE TRIGGER dbo.trg_UpdateInventoryOnOrderPlacement
ON dbo.OrderDetails
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE inv
    SET inv.stock_level = inv.stock_level - ins.quantity,
        inv.last_updated = GETDATE()
    FROM dbo.Inventory AS inv
    JOIN inserted AS ins
        ON inv.product_id = ins.product_id;

    -- Optional: Prevent negative stock
    IF EXISTS (SELECT 1 FROM dbo.Inventory WHERE stock_level < 0)
    BEGIN
        RAISERROR ('Insufficient stock for one or more products.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

----------------------------------------------------------------
--===============| Test the Trigger |===============--
----------------------------------------------------------------
-- N/B: Ensure that you highlight the entire test script and execute at once
-- 1. Check current stock for the product you’ll test
SELECT product_id, stock_level 
FROM dbo.Inventory 
WHERE product_id = 3001;

-- 2. Insert a new order first (ensure the customer & shipping method exist)
INSERT INTO dbo.Orders (customer_id, shippingmethod_id, order_date, status, total_cost)
VALUES (1001, 11, GETDATE(), 'Processing', 100.00);

-- 3. Get the new Order ID
DECLARE @NewOrderID INT = SCOPE_IDENTITY();

-- 4. Insert an OrderDetail (this should trigger the inventory update)
INSERT INTO dbo.OrderDetails (order_id, product_id, quantity, unit_price)
VALUES (@NewOrderID, 3001, 2, 50.00);

-- Check if stock decreased by 2
SELECT product_id, stock_level 
FROM dbo.Inventory 
WHERE product_id = 3001;

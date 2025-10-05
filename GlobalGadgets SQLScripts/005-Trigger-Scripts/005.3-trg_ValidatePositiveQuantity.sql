USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| Trigger: Validate Positive Quantity |===============--
----------------------------------------------------------------
-- Purpose:
-- Ensure no order is inserted with a non-positive quantity.
----------------------------------------------------------------

CREATE TRIGGER dbo.trg_ValidatePositiveQuantity
ON dbo.OrderDetails
FOR INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM inserted WHERE quantity <= 0)
    BEGIN
        RAISERROR ('Order quantity must be greater than zero.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

----------------------------------------------------------------
--===============| Test the Trigger |===============--
----------------------------------------------------------------
-- The trigger is expected to raise error due to check constraints
-- hence no record will be inserted.

-- Try inserting an invalid order detail (quantity = 0)
DECLARE @OrderID INT = (SELECT TOP 1 order_id FROM dbo.Orders);

INSERT INTO dbo.OrderDetails (order_id, product_id, quantity, unit_price)
VALUES (@OrderID, 3001, 0, 100.00);

USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| FN: Get Total Orders by Customer |===============--
----------------------------------------------------------------
-- Brief description: This function helps you get the total orders by customer

CREATE FUNCTION dbo.fn_GetCustomerOrderCount(@CustomerID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(*) FROM dbo.Orders WHERE customer_id = @CustomerID;
    RETURN @Count;
END;
GO

-- Test the function
SELECT dbo.fn_GetCustomerOrderCount(1001) AS TotalOrders;


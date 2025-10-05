USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| FN: Calculate Customer Age |===============--
----------------------------------------------------------------
-- Brief description: This function helps to calculate the age of the customers

CREATE FUNCTION dbo.fn_GetCustomerAge(@CustomerID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;
    SELECT @Age = DATEDIFF(YEAR, date_of_birth, GETDATE())
    FROM dbo.Customers WHERE customer_id = @CustomerID;
    RETURN @Age;
END;
GO

-- Test the function
SELECT dbo.fn_GetCustomerAge(1001) AS CustomerAge;
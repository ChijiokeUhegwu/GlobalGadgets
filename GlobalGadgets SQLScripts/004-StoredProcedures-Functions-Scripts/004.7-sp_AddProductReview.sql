USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| SP: Insert New Review |===============--
----------------------------------------------------------------
-- Brief description: This stored procedure (sp_AddProductReview) allows a customer to submit a review for a 
-- specific product they purchased.It inserts a new record into the Reviews table 
-- by linking the Customer, Product, and OrderDetail records, while also capturing the rating and review text.

CREATE PROCEDURE dbo.sp_AddProductReview
    @CustomerID INT,
    @ProductID INT,
    @OrderDetailID INT,
    @Rating INT,
    @ReviewText NVARCHAR(500)
AS
BEGIN
    INSERT INTO dbo.Reviews (customer_id, product_id, orderdetail_id, rating, review_text)
    VALUES (@CustomerID, @ProductID, @OrderDetailID, @Rating, @ReviewText);
END;
GO

-- To test the procedure
-- 1. See which reviews currently exist:
SELECT * FROM dbo.Reviews;

-- 2. Pick existing values from your tables
SELECT TOP 1 customer_id, full_name FROM dbo.Customers; -- Get a valid customer
SELECT TOP 1 product_id, product_name FROM dbo.Products; -- Get a valid product
SELECT TOP 1 orderdetail_id, order_id, product_id FROM dbo.OrderDetails; -- Get a valid order detail

-- 3. Run the test insert using real values present in the tables
EXEC dbo.sp_AddProductReview
    @CustomerID = 1000,
    @ProductID = 3002,
    @OrderDetailID = 5000,
    @Rating = 5,
    @ReviewText = N'Excellent quality and fast delivery!';

-- 4. Verify the insert
SELECT TOP 5 * FROM dbo.Reviews ORDER BY review_id DESC;



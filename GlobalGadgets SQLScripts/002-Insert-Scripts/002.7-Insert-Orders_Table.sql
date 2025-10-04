USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| Populate Orders Table |===============--
----------------------------------------------------------------

INSERT INTO [dbo].[Orders] 
    ([customer_id], [shippingmethod_id], [paymentmethod_id], [order_date], [status], [total_cost])
VALUES
-- Customer orders using different shipping and payment methods
(1000, 1, 1, '2024-11-05', 'Pending',     249.99),
(1001, 2, 2, '2024-11-06', 'Processing',  129.50),
(1002, 3, 3, '2024-11-06', 'Delivered',   578.20),
(1003, 4, 4, '2024-11-07', 'Cancelled',   89.99),
(1004, 5, 5, '2024-11-08', 'Pending',     312.49),
(1005, 6, 6, '2024-11-09', 'Shipped',     1420.00),
(1006, 7, 7, '2024-11-10', 'Delivered',   759.10),
(1007, 8, 8, '2024-11-10', 'Processing',  245.00),
(1008, 9, 9, '2024-11-11', 'Pending',     112.75),
(1009, 10, 10, '2024-11-12', 'Delivered',   329.99),
(1010, 11, 11, '2024-11-12', 'Shipped',     654.40),
(1011, 12, 12, '2024-11-13', 'Processing',  1199.95);
GO

SELECT * FROM Orders;
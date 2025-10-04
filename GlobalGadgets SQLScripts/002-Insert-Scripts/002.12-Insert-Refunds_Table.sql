USE [GlobalGadgetsDB];
GO

-- Insert values into the Refunds Table
INSERT INTO [dbo].[Refunds] (
    [payment_id],
    [order_id],
    [refund_method_id],
    [initiated_by_customer_id],
    [refund_amount],
    [currency],
    [refund_reason],
    [notes],
    [refund_status],
    [processed_by],
    [refund_confirmation_time],
    [transaction_ref]
)
VALUES
(7000, 4000, 1, 1000, 29.99, 'USD', N'Damaged product', N'Customer provided photo evidence', 'Approved', 300, GETDATE(), 'TXN-RF-1001'),
(7001, 4001, 2, 1001, 59.49, 'USD', N'Late delivery', N'Package arrived 10 days late', 'Completed', 301, GETDATE(), 'TXN-RF-1002'),
(7002, 4002, 3, 1002, 15.75, 'USD', N'Product mismatch', N'Incorrect color shipped', 'Pending', NULL, NULL, 'TXN-RF-1003'),
(7003, 4003, 4, 1003, 120.00, 'USD', N'Order cancellation', N'Customer cancelled before shipment', 'Completed', 302, GETDATE(), 'TXN-RF-1004'),
(7004, 4004, 5, 1004, 45.20, 'USD', N'Defective item', N'Customer returned faulty speaker', 'Approved', 303, GETDATE(), 'TXN-RF-1005'),
(7005, 4005, 6, 1005, 75.00, 'USD', N'Duplicate charge', N'System charged twice for one order', 'Completed', 304, GETDATE(), 'TXN-RF-1006'),
(7006, 4006, 7, 1006, 22.99, 'USD', N'Product not delivered', N'Courier marked as delivered, but customer never received', 'Rejected', 305, NULL, 'TXN-RF-1007'),
(7007, 4007, 8, 1007, 39.50, 'USD', N'Warranty return', N'Returned under warranty policy', 'Approved', 306, GETDATE(), 'TXN-RF-1008'),
(7008, 4008, 9, 1008, 18.25, 'USD', N'Item missing', N'One accessory missing in package', 'Completed', 307, GETDATE(), 'TXN-RF-1009'),
(7009, 4009, 10, 1009, 60.00, 'USD', N'Payment error', N'Overcharged amount refunded', 'Completed', 308, GETDATE(), 'TXN-RF-1010'),
(7010, 4010, 11, 1010, 32.80, 'USD', N'Unsatisfactory quality', N'Customer not happy with product finish', 'Pending', NULL, NULL, 'TXN-RF-1011'),
(7011, 4011, 12, 1011, 85.99, 'USD', N'Service cancellation', N'Subscription cancelled before start', 'Approved', 309, GETDATE(), 'TXN-RF-1012');
GO

SELECT * FROM Refunds;


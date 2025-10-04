USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| Insert Sample Data into Payments |===============--
----------------------------------------------------------------

INSERT INTO [dbo].[Payments]
    ([order_id], [payment_method_id], [paid_by], [amount], [currency], 
     [payment_date], [payment_confirmation_time], [payment_status], [transaction_ref])
VALUES
(4000, 1, 1000, 349.99, 'USD', GETDATE(), DATEADD(MINUTE, 5, GETDATE()), 'Completed', 'TXN-20251004-001'),
(4001, 2, 1001, 799.00, 'USD', GETDATE(), DATEADD(MINUTE, 3, GETDATE()), 'Completed', 'TXN-20251004-002'),
(4002, 3, 1002, 1299.50, 'USD', GETDATE(), DATEADD(MINUTE, 6, GETDATE()), 'Pending', 'TXN-20251004-003'),
(4003, 4, 1003, 215.75, 'USD', GETDATE(), NULL, 'Failed', 'TXN-20251004-004'),
(4004, 5, 1004, 59.99, 'USD', GETDATE(), DATEADD(MINUTE, 4, GETDATE()), 'Completed', 'TXN-20251004-005'),
(4005, 6, 1005, 120.00, 'USD', GETDATE(), DATEADD(MINUTE, 10, GETDATE()), 'Completed', 'TXN-20251004-006'),
(4006, 7, 1006, 980.25, 'USD', GETDATE(), DATEADD(MINUTE, 8, GETDATE()), 'Completed', 'TXN-20251004-007'),
(4007, 8, 1007, 45.00, 'USD', GETDATE(), NULL, 'Refunded', 'TXN-20251004-008'),
(4008, 9, 1008, 530.49, 'USD', GETDATE(), DATEADD(MINUTE, 6, GETDATE()), 'Completed', 'TXN-20251004-009'),
(4009, 10, 1009, 150.00, 'USD', GETDATE(), NULL, 'Pending', 'TXN-20251004-010'),
(4010, 11, 1010, 320.00, 'USD', GETDATE(), DATEADD(MINUTE, 5, GETDATE()), 'Completed', 'TXN-20251004-011'),
(4011, 12, 1011, 999.99, 'USD', GETDATE(), DATEADD(MINUTE, 9, GETDATE()), 'Completed', 'TXN-20251004-012');
GO

SELECT * FROM Payments;
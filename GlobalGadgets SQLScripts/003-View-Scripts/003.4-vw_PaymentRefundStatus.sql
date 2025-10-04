USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| VIEW: vw_PaymentRefundStatus |===============--
----------------------------------------------------------------
-- Brief description: To get an overview of the payment and refund tracking

CREATE VIEW dbo.vw_PaymentRefundStatus AS
SELECT 
    p.payment_id,
    p.order_id,
    c.full_name AS customer_name,
    pm.method_name AS payment_method,
    p.amount AS paid_amount,
    p.currency,
    p.payment_status,
    r.refund_id,
    r.refund_amount,
    r.refund_status,
    r.refund_reason,
    r.refund_date
FROM dbo.Payments AS p
JOIN dbo.Customers AS c
    ON p.paid_by = c.customer_id
JOIN dbo.PaymentMethods AS pm
    ON p.payment_method_id = pm.paymentmethod_id
LEFT JOIN dbo.Refunds AS r
    ON p.payment_id = r.payment_id;
GO

-- Test the view
SELECT TOP 20 * FROM dbo.vw_PaymentRefundStatus
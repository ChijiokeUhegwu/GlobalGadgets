USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| VIEW: vw_CustomerOrderSummary |===============--
----------------------------------------------------------------
-- Brief description: To get an overview of the order frequency and spending per customer

CREATE VIEW dbo.vw_CustomerOrderSummary AS
SELECT 
    c.customer_id,
    c.full_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.total_cost) AS total_spent,
    AVG(o.total_cost) AS avg_order_value
FROM dbo.Customers AS c
LEFT JOIN dbo.Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name;
GO

-- Test the view
SELECT TOP 20 * FROM dbo.vw_CustomerOrderSummary
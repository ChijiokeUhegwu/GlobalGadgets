USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| VIEW: vw_RetailerOrderOverview |===============--
----------------------------------------------------------------
-- Brief description: To get a full retailer overview (orders, customers, products, suppliers, reviews)

CREATE VIEW dbo.vw_RetailerOrderOverview AS
SELECT 
    o.order_id,
    o.order_date,
    o.total_cost,
    o.status AS order_status,
    
    c.customer_id,
    c.full_name AS customer_name,
    c.email AS customer_email,

    p.product_id,
    p.product_name,
    cat.category_name AS product_category,
    
    s.supplier_name,
    s.contact_email AS supplier_email,

    od.quantity,
    od.unit_price,

    r.rating,
    r.review_text,
    r.review_date

FROM dbo.Orders AS o
JOIN dbo.Customers AS c
    ON o.customer_id = c.customer_id
JOIN dbo.OrderDetails AS od
    ON o.order_id = od.order_id
JOIN dbo.Products AS p
    ON od.product_id = p.product_id
JOIN dbo.Categories AS cat
    ON p.category_id = cat.category_id
JOIN dbo.Suppliers AS s
    ON p.supplier_id = s.supplier_id
LEFT JOIN dbo.Reviews AS r
    ON r.product_id = p.product_id
    AND r.customer_id = c.customer_id
    AND r.orderdetail_id = od.orderdetail_id;
GO

-- Test the view
SELECT TOP 20 * FROM dbo.vw_RetailerOrderOverview;

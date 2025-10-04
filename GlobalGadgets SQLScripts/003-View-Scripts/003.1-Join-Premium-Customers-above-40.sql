-- Test Query 1:List all the Customers who are older than 40 and 
-- have placed an order for a product in the 'Premium' product category. 

SELECT DISTINCT 
    c.customer_id,
    c.full_name,
    c.date_of_birth,
    c.email
FROM dbo.Customers AS c
JOIN dbo.Orders AS o
    ON c.customer_id = o.customer_id
JOIN dbo.OrderDetails AS od
    ON o.order_id = od.order_id
JOIN dbo.Products AS p
    ON od.product_id = p.product_id
JOIN dbo.Categories AS cat
    ON p.category_id = cat.category_id
WHERE 
    c.date_of_birth < '1985-01-01'
    AND cat.category_name = 'Premium';



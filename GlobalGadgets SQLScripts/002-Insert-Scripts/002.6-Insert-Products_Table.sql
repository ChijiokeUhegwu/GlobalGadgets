USE [GlobalGadgetsDB]
GO

----------------------------------------------------------------
--===============| Insert Sample Data into Products |===============--
----------------------------------------------------------------

INSERT INTO [dbo].[Products] (
    [product_name], 
    [category_id], 
    [supplier_id], 
    [unit_price], 
    [stock_quantity], 
    [description], 
    [is_active]
)
VALUES
('Smartphone X200', 1, 2000, 699.99, 150, 'Latest generation smartphone with 6.5-inch OLED display and 128GB storage.', 1),
('Wireless Noise-Cancelling Headphones', 1, 2002, 199.99, 85, 'Bluetooth headphones with 30-hour battery life and adaptive noise control.', 1),
('4K Ultra HD Smart TV 55"', 1, 2005, 899.00, 40, '55-inch 4K television with HDR and voice assistant integration.', 1),
('Men’s Premium Leather Jacket', 2, 2003, 249.99, 60, 'High-quality leather jacket designed for durability and comfort.', 1),
('Women’s Designer Handbag', 2, 2006, 189.50, 75, 'Luxury handbag crafted from eco-friendly materials.', 1),
('Stainless Steel Blender', 3, 2004, 120.00, 50, 'High-power kitchen blender with 5 speed settings.', 1),
('Wireless Gaming Mouse', 1, 2008, 59.99, 200, 'Ergonomic mouse with adjustable DPI and RGB lighting.', 1),
('Smart Home Speaker', 4, 2001, 129.00, 90, 'AI-powered home assistant with premium sound and voice control.', 1),
('LED Desk Lamp with USB Port', 5, 2007, 39.99, 140, 'Energy-efficient lamp with touch controls and built-in charging port.', 1),
('EcoStyle Cotton T-Shirt', 2, 2006, 24.99, 500, 'Soft organic cotton T-shirt available in multiple colors.', 1),
('Portable Power Bank 20000mAh', 1, 2009, 45.00, 300, 'High-capacity power bank supporting fast charging for phones and tablets.', 1),
('Smartwatch Series 5', 1, 2010, 329.99, 120, 'Advanced fitness tracking smartwatch with waterproof design and GPS.', 1);
GO

SELECT * FROM Products;
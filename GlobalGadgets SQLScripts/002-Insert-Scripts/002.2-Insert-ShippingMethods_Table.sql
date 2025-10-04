USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| Insert Sample Data into ShippingMethods |===============--
----------------------------------------------------------------

INSERT INTO [dbo].[ShippingMethods] ([method_name], [estimated_days])
VALUES
('Standard Shipping', 5),            -- Default, affordable option
('Express Shipping', 2),             -- Faster, higher cost
('Overnight Delivery', 1),           -- Same/next-day
('International Economy', 10),       -- Budget overseas shipping
('International Express', 4),        -- Fast international
('In-Store Pickup', NULL),           -- Pickup, no delivery days
('Curbside Pickup', NULL),           -- For local customers
('Drone Delivery', 1),               -- Innovative, fast delivery
('Eco Delivery', 7),                 -- Environmentally friendly logistics
('Weekend Delivery', 3),             -- Saturday/Sunday delivery
('Freight Shipping', 14),            -- Bulky/large item shipping
('Same-Day Delivery', 1);            -- Delivered within the same day
GO

SELECT * FROM ShippingMethods;



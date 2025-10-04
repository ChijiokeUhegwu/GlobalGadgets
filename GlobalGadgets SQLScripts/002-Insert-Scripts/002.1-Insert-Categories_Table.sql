USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| Insert Sample Data into Categories |===============--
----------------------------------------------------------------

INSERT INTO [dbo].[Categories] ([category_name])
VALUES
('Electronics'),       -- Smartphones, laptops, tablets, etc.
('Accessories'),       -- Cables, chargers, cases, screen protectors
('Home Appliances'),   -- Kitchen gadgets, air fryers, vacuum cleaners
('Gaming'),            -- Consoles, controllers, VR headsets
('Audio & Music'),     -- Speakers, headphones, microphones
('Wearables'),         -- Smartwatches, fitness trackers
('Office Equipment'),  -- Printers, scanners, projectors
('Smart Home'),        -- Smart bulbs, thermostats, cameras
('Premium'),           -- High-end exclusive gadgets
('Outdoor & Sports'),  -- Drones, cameras, action gear
('Health & Wellness'), -- Massagers, air purifiers, posture monitors
('Refurbished');       -- Used but certified products
GO

SELECT * FROM Categories;
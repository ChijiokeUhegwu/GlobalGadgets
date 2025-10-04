USE [GlobalGadgetsDB];
GO

USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| Populate Reviews Table |===============--
----------------------------------------------------------------

INSERT INTO [dbo].[Reviews] 
    ([customer_id], [product_id], [orderdetail_id], [rating], [review_text], [review_date], [last_updated])
VALUES
(1000, 3000, 5000, 5, N'Excellent smartwatch with great battery life. Highly recommended!', '2025-09-20', '2025-09-22'),
(1001, 3001, 5001, 4, N'Good sound quality but slightly bulky design.', '2025-09-21', '2025-09-23'),
(1002, 3002, 5002, 5, N'Very comfortable headphones, noise cancellation works well.', '2025-09-22', '2025-09-23'),
(1003, 3003, 5003, 3, N'Stable laptop stand but could be sturdier.', '2025-09-23', '2025-09-25'),
(1004, 3004, 5004, 4, N'Ergonomic mouse, smooth performance during gaming.', '2025-09-24', '2025-09-26'),
(1005, 3005, 5005, 5, N'Crystal-clear display. Great for coding and design.', '2025-09-25', '2025-09-27'),
(1006, 3006, 5006, 4, N'Excellent mechanical keyboard with satisfying key feedback.', '2025-09-26', '2025-09-27'),
(1007, 3007, 5007, 5, N'Affordable and durable phone case. Fits perfectly.', '2025-09-27', '2025-09-28'),
(1008, 3008, 5008, 3, N'Power bank works fine, but charging takes a bit long.', '2025-09-28', '2025-09-30'),
(1009, 3009, 5009, 4, N'Tracker is accurate and syncs easily with phone app.', '2025-09-29', '2025-09-30'),
(1010, 3010, 5010, 5, N'Super-fast USB-C cable, charges my phone quickly.', '2025-09-30', '2025-10-01'),
(1011, 3011, 5011, 2, N'Camera quality is below expectations. Needs software update.', '2025-10-01', '2025-10-02');
GO

SELECT * FROM Reviews;
USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| Insert Sample Data into PaymentMethods |===============--
----------------------------------------------------------------

INSERT INTO [dbo].[PaymentMethods] ([method_name])
VALUES
('Credit Card'),           -- Visa, MasterCard, Amex
('Debit Card'),            -- Linked directly to bank accounts
('PayPal'),                -- Secure online wallet
('Bank Transfer'),         -- Direct transfer to merchant account
('Cash on Delivery'),      -- Pay when item arrives
('Mobile Wallet'),         -- e.g., Apple Pay, Google Pay
('Gift Card'),             -- Store-issued prepaid card
('Cryptocurrency'),        -- Bitcoin, Ethereum, etc.
('Buy Now, Pay Later'),    -- Klarna, Afterpay, etc.
('Check Payment'),         -- Paper check option
('Store Credit'),          -- Refund or loyalty balance
('International Wire');    -- Cross-border payments
GO

SELECT * FROM PaymentMethods;
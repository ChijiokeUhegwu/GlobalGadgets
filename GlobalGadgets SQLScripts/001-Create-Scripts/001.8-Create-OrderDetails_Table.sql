USE [GlobalGadgetsDB];
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

----------------------------------------------------------------
--===============| Create OrderDetails Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[OrderDetails] (

    [orderdetail_id]  INT IDENTITY(5000,1) NOT NULL,    -- Unique per item line
    [order_id]        INT                  NOT NULL,     -- References Orders
    [product_id]      INT                  NOT NULL,     -- References Products
    [quantity]        INT                  NOT NULL,     -- Units purchased
    [unit_price]      DECIMAL(10,2)        NOT NULL,     -- Price per unit at order time

    --===============| Primary Key |===============--
    CONSTRAINT [PK_OrderDetails_OrderDetailID] 
        PRIMARY KEY CLUSTERED ([orderdetail_id] ASC),

    --===============| Foreign Keys |===============--
    CONSTRAINT [FK_OrderDetails_Orders] 
        FOREIGN KEY ([order_id])
        REFERENCES [dbo].[Orders] ([order_id])
        ON DELETE CASCADE,

    CONSTRAINT [FK_OrderDetails_Products] 
        FOREIGN KEY ([product_id])
        REFERENCES [dbo].[Products] ([product_id])
        ON DELETE CASCADE
);
GO

----------------------------------------------------------------
--===============| Add Constraints |===============--
----------------------------------------------------------------

-- 1️. CHECK: Quantity must be positive
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [CK_OrderDetails_Quantity_Positive]
CHECK ([quantity] > 0);
GO

-- 2️. UNIQUE: No duplicate product entries per order
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [UQ_OrderDetails_Order_Product] 
UNIQUE ([order_id], [product_id]);
GO

----------------------------------------------------------------
--===============| Add Performance Index |===============--
----------------------------------------------------------------
CREATE NONCLUSTERED INDEX [IX_OrderDetails_Order_Product] 
ON [dbo].[OrderDetails] ([order_id], [product_id]);
GO

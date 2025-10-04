USE [GlobalGadgetsDB];
GO

-- Object:  Table [dbo].[Reviews]   
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
--===============| Create Reviews Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[Reviews] (

    [review_id]       INT IDENTITY(6000,1) NOT NULL,
    [customer_id]     INT                  NOT NULL,   -- Who made the review
    [product_id]      INT                  NOT NULL,   -- What product was reviewed
    [orderdetail_id]  INT                  NULL,       -- Optional: link to a purchased item
    [rating]          INT                  NOT NULL CHECK ([rating] BETWEEN 1 AND 5),
    [review_text]     NVARCHAR(500)        NULL,
    [review_date]     DATETIME             DEFAULT GETDATE(),
    [last_updated]    DATETIME             NULL,

    --===============| Primary Key |===============--
    CONSTRAINT [PK_Reviews_ReviewID] 
        PRIMARY KEY CLUSTERED ([review_id] ASC),

    --===============| Foreign Keys |===============--
    CONSTRAINT [FK_Reviews_Customers]
        FOREIGN KEY ([customer_id])
        REFERENCES [dbo].[Customers] ([customer_id])
        ON DELETE CASCADE,

    CONSTRAINT [FK_Reviews_Products]
        FOREIGN KEY ([product_id])
        REFERENCES [dbo].[Products] ([product_id])
        ON DELETE CASCADE,

    CONSTRAINT [FK_Reviews_OrderDetails]
        FOREIGN KEY ([orderdetail_id])
        REFERENCES [dbo].[OrderDetails] ([orderdetail_id])
        ON DELETE NO ACTION
);
GO

----------------------------------------------------------------
--===============| Add Optional Constraints |===============--
----------------------------------------------------------------

-- Ensure a customer can only review a given product once per order
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [UQ_Reviews_Customer_Product_Order]
UNIQUE ([customer_id], [product_id], [orderdetail_id]);
GO

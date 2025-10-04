USE [GlobalGadgetsDB]
GO

-- Object:  Table [dbo].[Products]   
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
--===============| Create Products Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[Products] (

    [product_id]       INT IDENTITY(3000,1) NOT NULL,      -- Unique product ID
    [product_name]     NVARCHAR(150)        NOT NULL,      -- Product name
    [category_id]      INT                  NOT NULL,      -- FK to Categories table
    [supplier_id]      INT                  NOT NULL,      -- FK to Suppliers table
    [unit_price]       DECIMAL(10,2)        NOT NULL,      -- Product price
    [stock_quantity]   INT                  NOT NULL,      -- Current inventory level
    [created_at]       DATETIME             DEFAULT GETDATE(),  -- Creation timestamp
    [description]      NVARCHAR(500)        NULL,          -- Optional product details
    [is_active]        BIT                  DEFAULT 1,     -- Product availability flag

    --===============| Primary Key |===============--
    CONSTRAINT [PK_Products_ProductID] PRIMARY KEY CLUSTERED ([product_id] ASC),

    --===============| Foreign Keys |===============--
    CONSTRAINT [FK_Products_Categories]
        FOREIGN KEY ([category_id])
        REFERENCES [dbo].[Categories] ([category_id])
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT [FK_Products_Suppliers]
        FOREIGN KEY ([supplier_id])
        REFERENCES [dbo].[Suppliers] ([supplier_id])
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO

----------------------------------------------------------------
--===============| Add Constraints |===============--
----------------------------------------------------------------

-- 1️. CHECK: Product price must be positive
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [CK_Products_UnitPrice_Positive]
CHECK ([unit_price] > 0);
GO

-- 2️. CHECK: Stock quantity cannot be negative
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [CK_Products_StockQuantity_NonNegative]
CHECK ([stock_quantity] >= 0);
GO

-- 3️. UNIQUE: Prevent duplicate product names per supplier
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [UQ_Products_Name_Per_Supplier]
UNIQUE ([product_name], [supplier_id]);
GO


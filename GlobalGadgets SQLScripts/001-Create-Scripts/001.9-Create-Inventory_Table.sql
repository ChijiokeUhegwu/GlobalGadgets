USE [GlobalGadgetsDB]
GO

-- Object:  Table [dbo].[Inventory]   
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
--===============| Create Inventory Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[Inventory] (

    [inventory_id]    INT IDENTITY(6000,1) NOT NULL,
    [product_id]      INT                  NOT NULL,
    [stock_level]     INT                  NOT NULL,
    [last_updated]    DATETIME             DEFAULT GETDATE(),

    -- PK
    CONSTRAINT [PK_Inventory_InventoryID] PRIMARY KEY CLUSTERED ([inventory_id] ASC),

    -- FK
    CONSTRAINT [FK_Inventory_Products] FOREIGN KEY ([product_id])
        REFERENCES [dbo].[Products] ([product_id])
        ON DELETE CASCADE
);
GO

----------------------------------------------------------------
--===============| Add Constraints |===============--
----------------------------------------------------------------

-- 1️. CHECK: Stock level must be non-negative
ALTER TABLE [dbo].[Inventory]
ADD CONSTRAINT [CK_Inventory_Stock_NonNegative]
CHECK ([stock_level] >= 0);
GO

-- 2️. UNIQUE: Only one inventory record per product
ALTER TABLE [dbo].[Inventory]
ADD CONSTRAINT [UQ_Inventory_Product] UNIQUE ([product_id]);
GO

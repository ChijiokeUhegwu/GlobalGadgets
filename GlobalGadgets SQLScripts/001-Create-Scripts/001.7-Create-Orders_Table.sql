USE [GlobalGadgetsDB]
GO

-- Object:  Table [dbo].[Orders]   
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
--===============| Create Orders Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[Orders] (

    [order_id]          INT IDENTITY(4000,1) NOT NULL,   -- Auto-incrementing order ID
    [customer_id]       INT                  NOT NULL,    -- References Customers
    [shippingmethod_id] INT                  NOT NULL,    -- References ShippingMethods
    [order_date]        DATETIME             DEFAULT GETDATE(),
    [paymentmethod_id]  INT                  NULL,
    [status]            NVARCHAR(20)         DEFAULT 'Pending',
    [total_cost]        DECIMAL(10,2)        NULL,

    --===============| Primary Key |===============--
    CONSTRAINT [PK_Orders_OrderID] 
        PRIMARY KEY CLUSTERED ([order_id] ASC),

    --===============| Foreign Keys |===============--
    CONSTRAINT [FK_Orders_Customers] 
        FOREIGN KEY ([customer_id])
        REFERENCES [dbo].[Customers] ([customer_id])
        ON DELETE CASCADE,

    CONSTRAINT [FK_Orders_ShippingMethods]
        FOREIGN KEY ([shippingmethod_id])
        REFERENCES [dbo].[ShippingMethods] ([shippingmethod_id])
        ON UPDATE CASCADE,
        
    CONSTRAINT [FK_Orders_PaymentMethods]
        FOREIGN KEY ([paymentmethod_id])
        REFERENCES [dbo].[PaymentMethods] ([paymentmethod_id])

);
GO

----------------------------------------------------------------
--===============| Add Constraints |===============--
----------------------------------------------------------------

-- 1️. CHECK: Order status must be one of allowed values
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [CK_Orders_Status_Valid]
CHECK ([status] IN ('Pending','Processing','Shipped','Delivered','Cancelled'));
GO

USE [GlobalGadgetsDB]
GO

-- Object:  Table [dbo].[Orders]   
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
--===============| Create Orders Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[Orders] (

    [order_id]          INT IDENTITY(4000,1) NOT NULL,   -- Auto-incrementing order ID
    [customer_id]       INT                  NOT NULL,    -- References Customers
    [shippingmethod_id] INT                  NOT NULL,    -- References ShippingMethods
    [order_date]        DATETIME             DEFAULT GETDATE(),
    [paymentmethod_id]  INT                  NULL,
    [status]            NVARCHAR(20)         DEFAULT 'Pending',
    [total_cost]        DECIMAL(10,2)        NULL,

    --===============| Primary Key |===============--
    CONSTRAINT [PK_Orders_OrderID] 
        PRIMARY KEY CLUSTERED ([order_id] ASC),

    --===============| Foreign Keys |===============--
    CONSTRAINT [FK_Orders_Customers] 
        FOREIGN KEY ([customer_id])
        REFERENCES [dbo].[Customers] ([customer_id])
        ON DELETE CASCADE,

    CONSTRAINT [FK_Orders_ShippingMethods]
        FOREIGN KEY ([shippingmethod_id])
        REFERENCES [dbo].[ShippingMethods] ([shippingmethod_id])
        ON UPDATE CASCADE,
        
    CONSTRAINT [FK_Orders_PaymentMethods]
        FOREIGN KEY ([paymentmethod_id])
        REFERENCES [dbo].[PaymentMethods] ([paymentmethod_id])

);
GO

----------------------------------------------------------------
--===============| Add Constraints |===============--
----------------------------------------------------------------

-- 1️. CHECK: Order status must be one of allowed values
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [CK_Orders_Status_Valid]
CHECK ([status] IN ('Pending','Processing','Shipped','Delivered','Cancelled'));
GO

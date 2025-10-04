USE [GlobalGadgetsDB]
GO

-- Object:  Table [dbo].[Suppliers]   
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
--===============| Create Suppliers Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[Suppliers] (

    [supplier_id]      INT IDENTITY(2000,1) NOT NULL,
    [supplier_name]    NVARCHAR(100)        NOT NULL,
    [contact_name]     NVARCHAR(100)        NULL,
    [contact_email]    NVARCHAR(100)        NULL,
    [phone_number]     NVARCHAR(20)         NULL,
    [address]          NVARCHAR(255)        NOT NULL,
    [created_at]       DATETIME             DEFAULT GETDATE(),

    -- PK
    CONSTRAINT [PK_Suppliers_SupplierID] PRIMARY KEY CLUSTERED ([supplier_id] ASC)
);
GO

----------------------------------------------------------------
--===============| Add Constraints |===============--
----------------------------------------------------------------

-- 1️. CHECK: Supplier name must not be empty
ALTER TABLE [dbo].[Suppliers]
ADD CONSTRAINT [CK_Suppliers_Name_NotEmpty]
CHECK (LEN(LTRIM(RTRIM(supplier_name))) > 0);
GO

-- 2️. UNIQUE: Supplier name must be unique
ALTER TABLE [dbo].[Suppliers]
ADD CONSTRAINT [UQ_Suppliers_Name] UNIQUE ([supplier_name]);
GO

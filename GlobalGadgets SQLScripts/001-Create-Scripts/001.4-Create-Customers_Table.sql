USE [GlobalGadgetsDB];
GO

-- Object:  Table [dbo].[Customers]   
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
--===============| Create Customers Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[Customers] (

    [customer_id]               INT IDENTITY(1000,1) NOT NULL,   -- Unique identifier for each customer
    [full_name]                 NVARCHAR(100)        NOT NULL,    -- Customer full name
    [billing_address]           NVARCHAR(255)        NOT NULL,    -- Required for billing/shipping
    [date_of_birth]             DATE                 NOT NULL,    -- Useful for age-based analytics
    [paymentmethod_id]          INT                  NULL,        -- FK: Payment method ID from PaymentMethods table
    [username]                  NVARCHAR(50)         NOT NULL,    -- For customer login
    [password_hash]             NVARCHAR(255)        NOT NULL,    -- Hashed password
    [email]                     NVARCHAR(100)        NULL,        -- Optional
    [telephone]                 NVARCHAR(20)         NULL,        -- Optional
    [account_status]            NVARCHAR(20)         DEFAULT 'Active',  -- Account status
    [deactivation_date]         DATE                 NULL,        -- Record date when account is closed
    [created_at]                DATETIME             DEFAULT GETDATE(), -- Timestamp for record creation

    --===============| Primary Key |===============--
    CONSTRAINT [PK_Customers_CustomerID]
        PRIMARY KEY CLUSTERED ([customer_id] ASC),

    --===============| Foreign Key |===============--
    CONSTRAINT [FK_Customers_PaymentMethods]
        FOREIGN KEY ([paymentmethod_id])
        REFERENCES [dbo].[PaymentMethods] ([paymentmethod_id])
        ON UPDATE CASCADE
        ON DELETE SET NULL
);
GO

----------------------------------------------------------------
--===============| Add Constraints |===============--
----------------------------------------------------------------

-- 1️. CHECK: Account status must be either 'Active' or 'Deactivated'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [CK_Customers_AccountStatus_ValidValues]
CHECK ([account_status] IN ('Active', 'Deactivated'));
GO

-- 2️. UNIQUE: Ensure each username is unique
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [UQ_Customers_Username]
UNIQUE ([username]);
GO

----------------------------------------------------------------
--===============| Create Index on Email |===============--
----------------------------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Customers_Email]
ON [dbo].[Customers] ([email]);
GO


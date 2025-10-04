USE [GlobalGadgetsDB];
GO

-- Object:  Table [dbo].[Payments]   
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
--===============| Create Payments Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[Payments] (
    [payment_id]              INT IDENTITY(7000,1) NOT NULL,
    [order_id]                INT                  NOT NULL,
    [payment_method_id]       INT                  NOT NULL,
    [paid_by]                 INT                  NOT NULL,       -- FK to Customers
    [amount]                  DECIMAL(10,2)        NOT NULL,
    [currency]                CHAR(3)              DEFAULT 'USD',  -- e.g., USD, NGN, EUR
    [payment_date]            DATETIME             DEFAULT GETDATE(),
    [payment_confirmation_time] DATETIME           NULL,           -- Time of successful confirmation
    [payment_status]          VARCHAR(50)          DEFAULT 'Pending',  -- Pending, Completed, Failed, Refunded
    [transaction_ref]         VARCHAR(100)         NULL,           -- Gateway/receipt reference

    -- PK
    CONSTRAINT [PK_Payments_PaymentID] PRIMARY KEY CLUSTERED ([payment_id] ASC),

    -- FKs
    CONSTRAINT [FK_Payments_Orders] FOREIGN KEY ([order_id])
        REFERENCES [dbo].[Orders] ([order_id])
        ON DELETE CASCADE,

    CONSTRAINT [FK_Payments_PaymentMethods] FOREIGN KEY ([payment_method_id])
        REFERENCES [dbo].[PaymentMethods] ([paymentmethod_id])
        ON DELETE NO ACTION,

    CONSTRAINT [FK_Payments_Customers] FOREIGN KEY ([paid_by])
        REFERENCES [dbo].[Customers] ([customer_id])
        ON DELETE NO ACTION,

    -- CHECK: amount must be positive
    CONSTRAINT [CK_Payments_Amount_Positive] CHECK ([amount] > 0),

    -- CHECK: currency must be 3 letters (ISO 4217)
    CONSTRAINT [CK_Payments_Currency_Format] CHECK (LEN([currency]) = 3)
);
GO

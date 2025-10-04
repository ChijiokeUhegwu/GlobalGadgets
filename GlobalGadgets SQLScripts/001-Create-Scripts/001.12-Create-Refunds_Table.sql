USE [GlobalGadgetsDB];
GO

-- Object:  Table [dbo].[Refunds]   
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
--===============| Create Refunds Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[Refunds] (
    [refund_id]                 INT IDENTITY(8000,1) NOT NULL,
    [payment_id]                INT                  NOT NULL,       -- FK to Payments
    [order_id]                  INT                  NOT NULL,       -- FK to Orders
    [refund_method_id]          INT                  NULL,           -- FK to PaymentMethods
    [initiated_by_customer_id]  INT                  NULL,           -- FK to Customers
    [refund_amount]             DECIMAL(10,2)        NOT NULL,
    [currency]                  CHAR(3)              DEFAULT 'USD',
    [refund_reason]             NVARCHAR(255)        NULL,
    [notes]                     NVARCHAR(500)        NULL,
    [refund_date]               DATETIME             DEFAULT GETDATE(),
    [refund_status]             VARCHAR(50)          DEFAULT 'Pending',   -- Pending, Approved, Completed, Rejected
    [processed_by]              INT                  NULL,           -- staff/admin user ID
    [refund_confirmation_time]  DATETIME             NULL,           -- When refund confirmed
    [transaction_ref]           VARCHAR(100)         NULL,           -- Gateway/internal reference

    --===============| Primary Key |===============--
    CONSTRAINT [PK_Refunds_RefundID] 
        PRIMARY KEY CLUSTERED ([refund_id] ASC),

    --===============| Foreign Keys |===============--
    CONSTRAINT [FK_Refunds_Payments] 
        FOREIGN KEY ([payment_id])
        REFERENCES [dbo].[Payments] ([payment_id])
        ON DELETE CASCADE,

    CONSTRAINT [FK_Refunds_Orders] 
        FOREIGN KEY ([order_id])
        REFERENCES [dbo].[Orders] ([order_id])
        ON UPDATE NO ACTION,

    CONSTRAINT [FK_Refunds_PaymentMethods] 
        FOREIGN KEY ([refund_method_id])
        REFERENCES [dbo].[PaymentMethods] ([paymentmethod_id])
        ON UPDATE CASCADE,

    CONSTRAINT [FK_Refunds_Customers] 
        FOREIGN KEY ([initiated_by_customer_id])
        REFERENCES [dbo].[Customers] ([customer_id])
        ON DELETE NO ACTION,

    --===============| Check Constraints |===============--
    CONSTRAINT [CK_Refunds_Amount_Positive] 
        CHECK ([refund_amount] > 0),

    CONSTRAINT [CK_Refunds_Currency_Format] 
        CHECK (LEN([currency]) = 3),

    CONSTRAINT [CK_Refunds_Status_Valid] 
        CHECK ([refund_status] IN ('Pending', 'Approved', 'Completed', 'Rejected'))
);
GO

USE [GlobalGadgetsDB]
GO

-- Object:  Table [dbo].[PaymentMethods]   
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
--===============| Create PaymentMethods Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[PaymentMethods] (

    [paymentmethod_id]  INT IDENTITY(1,1)  NOT NULL,       -- Unique payment method ID
    [method_name]       NVARCHAR(50)       NOT NULL,       -- e.g., Credit Card, PayPal, Bank Transfer

    --===============| Primary Key |===============--
    CONSTRAINT [PK_PaymentMethods_PaymentMethodID] 
        PRIMARY KEY CLUSTERED ([paymentmethod_id] ASC)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
              IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
              ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
) ON [PRIMARY];
GO


----------------------------------------------------------------
--===============| Add Constraints |===============--
----------------------------------------------------------------

-- 1️. CHECK: Method name must not be empty or spaces only
ALTER TABLE [dbo].[PaymentMethods]
ADD CONSTRAINT [CK_PaymentMethods_MethodName_NotEmpty]
CHECK (LEN(LTRIM(RTRIM([method_name]))) > 0);
GO

-- 2️. UNIQUE: Each payment method must be unique
ALTER TABLE [dbo].[PaymentMethods]
ADD CONSTRAINT [UQ_PaymentMethods_MethodName] UNIQUE ([method_name]);
GO


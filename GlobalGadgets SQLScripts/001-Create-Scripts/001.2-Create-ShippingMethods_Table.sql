USE [GlobalGadgetsDB]
GO

-- Object:  Table [dbo].[ShippingMethods]  
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
--===============| Create ShippingMethods Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[ShippingMethods] (

    [shippingmethod_id]  INT IDENTITY(1,1)  NOT NULL,       -- Unique shipping method ID
    [method_name]        NVARCHAR(50)       NOT NULL,       -- e.g., Standard, Express, Overnight
    [estimated_days]     INT                NULL,           -- Expected delivery time in days

    --===============| Primary Key |===============--
    CONSTRAINT [PK_ShippingMethods_ShippingMethodID] 
        PRIMARY KEY CLUSTERED ([shippingmethod_id] ASC)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
              IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
              ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
) ON [PRIMARY];
GO


----------------------------------------------------------------
--===============| Add Constraints |===============--
----------------------------------------------------------------

-- 1️. CHECK: Method name must not be empty or just spaces
ALTER TABLE [dbo].[ShippingMethods]
ADD CONSTRAINT [CK_ShippingMethods_MethodName_NotEmpty]
CHECK (LEN(LTRIM(RTRIM([method_name]))) > 0);
GO

-- 2️. CHECK: EstimatedDays must be positive if provided
ALTER TABLE [dbo].[ShippingMethods]
ADD CONSTRAINT [CK_ShippingMethods_EstimatedDays_Positive]
CHECK ([estimated_days] IS NULL OR [estimated_days] > 0);
GO

-- 3️. UNIQUE: Prevent duplicate method names
ALTER TABLE [dbo].[ShippingMethods]
ADD CONSTRAINT [UQ_ShippingMethods_MethodName] UNIQUE ([method_name]);
GO


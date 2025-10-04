USE [GlobalGadgetsDB];
GO

-- Object:  Table [dbo].[Categories]   
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
--===============| Create Categories Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[Categories] (

    [category_id]     INT IDENTITY(1,1)     NOT NULL,        -- Unique ID for each category
    [category_name]   NVARCHAR(50)          NOT NULL,        -- e.g., Electronics, Premium, Clothing

    --===============| Primary Key |===============--
    CONSTRAINT [PK_Categories_CategoryID] 
        PRIMARY KEY CLUSTERED ([category_id] ASC)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
              IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
              ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
) ON [PRIMARY];
GO


----------------------------------------------------------------
--===============| Add Constraints |===============--
----------------------------------------------------------------

-- 1. CHECK: Category name must not be empty or spaces only
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [CK_Categories_CategoryName_NotEmpty]
CHECK (LEN(LTRIM(RTRIM([category_name]))) > 0);
GO

-- 2. UNIQUE: Each category name must be unique
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [UQ_Categories_CategoryName] UNIQUE ([category_name]);
GO


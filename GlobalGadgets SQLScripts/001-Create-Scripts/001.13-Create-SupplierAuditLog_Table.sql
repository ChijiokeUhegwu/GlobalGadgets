USE [GlobalGadgetsDB];
GO

IF OBJECT_ID('dbo.SupplierAuditLog', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.SupplierAuditLog;
    PRINT 'Existing SupplierAuditLog table dropped successfully.';
END;
GO

----------------------------------------------------------------
--===============| Create Supplier Audit Log Table |===============--
----------------------------------------------------------------

CREATE TABLE [dbo].[SupplierAuditLog] (

    [audit_id]            INT IDENTITY(1,1) NOT NULL,
    [supplier_id]         INT               NOT NULL,
    [old_supplier_name]   NVARCHAR(100)     NULL,
    [new_supplier_name]   NVARCHAR(100)     NULL,
    [old_contact_name]    NVARCHAR(100)     NULL,
    [new_contact_name]    NVARCHAR(100)     NULL,
    [old_contact_email]   NVARCHAR(100)     NULL,
    [new_contact_email]   NVARCHAR(100)     NULL,
    [old_phone_number]    NVARCHAR(20)      NULL,
    [new_phone_number]    NVARCHAR(20)      NULL,
    [old_address]         NVARCHAR(255)     NULL,
    [new_address]         NVARCHAR(255)     NULL,
    [modified_by]         NVARCHAR(100)     DEFAULT SYSTEM_USER,
    [modified_on]         DATETIME          DEFAULT GETDATE(),

    -- PK
    CONSTRAINT [PK_SupplierAuditLog_AuditID] PRIMARY KEY CLUSTERED ([audit_id] ASC),

    -- FK
    CONSTRAINT [FK_SupplierAuditLog_SupplierID] 
        FOREIGN KEY ([supplier_id]) REFERENCES [dbo].[Suppliers]([supplier_id])
);
GO

SELECT * FROM SupplierAuditLog;


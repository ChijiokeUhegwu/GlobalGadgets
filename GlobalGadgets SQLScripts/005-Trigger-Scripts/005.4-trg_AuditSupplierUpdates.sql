USE [GlobalGadgetsDB];
GO

-- Delete existing trigger if present
IF OBJECT_ID('dbo.trg_AuditSupplierUpdates', 'TR') IS NOT NULL
BEGIN
    DROP TRIGGER dbo.trg_AuditSupplierUpdates;
    PRINT 'Existing trigger trg_AuditSupplierUpdates dropped successfully.';
END;
GO

----------------------------------------------------------------
--===============| Create Trigger for Supplier Updates |===============--
----------------------------------------------------------------
-- Purpose: 
-- To Keep an audit log of supplier information updates (e.g., address, phone, email).

CREATE TRIGGER [dbo].[trg_AuditSupplierUpdates]
ON [dbo].[Suppliers]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[SupplierAuditLog] (
        [supplier_id],
        [old_supplier_name], [new_supplier_name],
        [old_contact_name], [new_contact_name],
        [old_contact_email], [new_contact_email],
        [old_phone_number], [new_phone_number],
        [old_address], [new_address]
    )
    SELECT
        d.[supplier_id],
        d.[supplier_name], i.[supplier_name],
        d.[contact_name],  i.[contact_name],
        d.[contact_email], i.[contact_email],
        d.[phone_number],  i.[phone_number],
        d.[address],       i.[address]
    FROM deleted AS d
    INNER JOIN inserted AS i
        ON d.[supplier_id] = i.[supplier_id]
    WHERE 
        ISNULL(d.[supplier_name], '') <> ISNULL(i.[supplier_name], '') OR
        ISNULL(d.[contact_name], '')  <> ISNULL(i.[contact_name], '')  OR
        ISNULL(d.[contact_email], '') <> ISNULL(i.[contact_email], '') OR
        ISNULL(d.[phone_number], '')  <> ISNULL(i.[phone_number], '')  OR
        ISNULL(d.[address], '')       <> ISNULL(i.[address], '');
END;
GO

----------------------------------------------------------------
--===============| Test Script |===============--
----------------------------------------------------------------

-- 1️. Insert a sample supplier
INSERT INTO [dbo].[Suppliers] (
    [supplier_name], [contact_name], [contact_email], [phone_number], [address]
)
VALUES
('FreshGro Distributors', 'Jane Doe', 'jane@freshgro.com', '09012345678', '12 Market Street, Abuja');
GO

-- 2️. Verify the inserted supplier
SELECT * FROM [dbo].[Suppliers];
GO

-- 3️. Update supplier details (trigger fires automatically)
UPDATE [dbo].[Suppliers]
SET [contact_email] = 'contact@freshgro.com',
    [address] = '45 Central Avenue, Abuja'
WHERE [supplier_name] = 'FreshGro Distributors';
GO

-- 4️. Check audit log entries
SELECT * FROM [dbo].[SupplierAuditLog];
GO

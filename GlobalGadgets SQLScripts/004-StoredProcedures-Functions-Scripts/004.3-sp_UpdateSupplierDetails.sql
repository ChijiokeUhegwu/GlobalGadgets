USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| SP: Update Supplier Details |===============--
----------------------------------------------------------------
-- Brief description: This stored procedure updates a supplier’s info dynamically based on parameters.
-- Only updates the provided fields — the rest remain unchanged.

CREATE PROCEDURE dbo.sp_UpdateSupplierDetails
    @SupplierID INT,
    @SupplierName NVARCHAR(100) = NULL,
    @ContactName NVARCHAR(100) = NULL,
    @ContactEmail NVARCHAR(100) = NULL,
    @PhoneNumber NVARCHAR(20) = NULL,
    @Address NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.Suppliers
    SET
        supplier_name = COALESCE(@SupplierName, supplier_name),
        contact_name = COALESCE(@ContactName, contact_name),
        contact_email = COALESCE(@ContactEmail, contact_email),
        phone_number = COALESCE(@PhoneNumber, phone_number),
        address = COALESCE(@Address, address)
    WHERE supplier_id = @SupplierID;
END;
GO

-- Test the procedure
EXEC dbo.sp_UpdateSupplierDetails 
    @SupplierID = 2001,
    @ContactEmail = 'newcontact@gmail.com',
    @PhoneNumber = '+1-800-555-9012';

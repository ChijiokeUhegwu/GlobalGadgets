/* ===== 0. Create database and use it ===== */
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'GlobalGadgetsDB')
BEGIN
    ALTER DATABASE GlobalGadgetsDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE GlobalGadgetsDB;
END

CREATE DATABASE GlobalGadgetsDB;
GO
USE GlobalGadgetsDB;
GO
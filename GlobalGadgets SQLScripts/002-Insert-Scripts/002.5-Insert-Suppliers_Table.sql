USE [GlobalGadgetsDB]
GO

----------------------------------------------------------------
--===============| Insert Sample Data into Suppliers |===============--
----------------------------------------------------------------

INSERT INTO [dbo].[Suppliers] (
    [supplier_name], 
    [contact_name], 
    [contact_email], 
    [phone_number], 
    [address]
)
VALUES
('TechSource Ltd.', 'Andrew White', 'andrew.white@techsource.com', '+44 20 7946 1122', '45 Baker Street, London, UK'),
('GadgetPro Distributors', 'Maria Gonzalez', 'maria.g@gadgetpro.mx', '+52 55 1234 5678', '90 Reforma Avenue, Mexico City, Mexico'),
('NextGen Electronics', 'Samuel Kim', 'samuel.kim@nextgen.kr', '+82 10 3456 7890', '120 Itaewon Road, Seoul, South Korea'),
('EliteWear Co.', 'Toyin Ajayi', 'toyin.ajayi@elitewear.ng', '+234 803 223 4455', '12 Marina Road, Lagos, Nigeria'),
('HomeEssentials Supply', 'Rachel Owens', 'rachel.owens@homeessentials.com', '+1 212 555 9100', '88 Fifth Avenue, New York, USA'),
('BrightFuture Tech', 'Ahmed Khan', 'ahmed.khan@brightfuture.ae', '+971 50 123 4567', 'Downtown Tower, Dubai, UAE'),
('EcoStyle Apparel', 'Laura Cheng', 'laura.cheng@ecostyle.cn', '+86 21 5566 7788', '55 Nanjing Road, Shanghai, China'),
('PowerMax Industries', 'Jacob Mensah', 'jacob.m@powermax.com.gh', '+233 24 888 1111', '14 Kwame Nkrumah Avenue, Accra, Ghana'),
('Zenith Gadgets', 'Carlos Fernandez', 'c.fernandez@zenithgadgets.es', '+34 91 334 5566', 'Av. de la Castellana 120, Madrid, Spain'),
('AeroTech Global', 'Hannah Scott', 'hannah.scott@aerotech.ca', '+1 416 778 9922', '223 King Street West, Toronto, Canada'),
('PrimeFoods Appliances', 'Jean Dupont', 'jean.dupont@primefoods.fr', '+33 1 4477 8899', 'Rue de Rivoli 33, Paris, France'),
('UrbanX Suppliers', 'Michael Obi', 'michael.obi@urbanx.ng', '+234 805 667 7788', 'Plot 22, GRA Phase II, Port Harcourt, Nigeria');
GO

SELECT * FROM Suppliers;
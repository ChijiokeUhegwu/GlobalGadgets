USE [GlobalGadgetsDB];
GO

----------------------------------------------------------------
--===============| Insert Sample Data into Customers |===============--
----------------------------------------------------------------

INSERT INTO [dbo].[Customers] (
    [full_name], 
    [billing_address], 
    [date_of_birth], 
    [paymentmethod_id], 
    [username], 
    [password_hash], 
    [email], 
    [telephone], 
    [account_status], 
    [deactivation_date]
)
VALUES
('John Doe', '123 Main Street, Lagos, Nigeria', '1980-05-14', 1, 'johndoe80', 'hashed_pw_001', 'john.doe@email.com', '+2348012345678', 'Active', NULL),
('Mary Johnson', '45 Queen Avenue, Abuja, Nigeria', '1992-07-22', 2, 'maryj22', 'hashed_pw_002', 'mary.j@email.com', '+2348023456789', 'Active', NULL),
('David Smith', '78 Broad Street, London, UK', '1978-01-30', 3, 'davidsmith78', 'hashed_pw_003', 'david.smith@email.co.uk', '+447911223344', 'Active', NULL),
('Fatima Bello', '22 Unity Road, Kaduna, Nigeria', '1988-11-02', 4, 'f_bello', 'hashed_pw_004', 'fatima.b@email.com', '+2348034567890', 'Active', NULL),
('William Brown', '90 King Street, Toronto, Canada', '1975-06-19', 5, 'willbrown75', 'hashed_pw_005', 'will.brown@email.ca', '+14165559876', 'Active', NULL),
('Aisha Khan', '12 Park Avenue, Dubai, UAE', '1995-03-12', 6, 'aishak95', 'hashed_pw_006', 'aisha.khan@email.ae', '+971501234567', 'Active', NULL),
('Michael Green', '56 Elm Street, New York, USA', '1983-12-05', 7, 'mgreen83', 'hashed_pw_007', 'm.green@email.com', '+12015551234', 'Active', NULL),
('Ngozi Okafor', '17 Aba Road, Port Harcourt, Nigeria', '1990-09-15', 8, 'ngozi_okafor', 'hashed_pw_008', 'ngozi.okafor@email.com', '+2348091234567', 'Active', NULL),
('Lucas Pereira', '120 Paulista Ave, São Paulo, Brazil', '1986-10-09', 9, 'lucasp86', 'hashed_pw_009', 'lucas.p@email.com', '+551199998877', 'Active', NULL),
('Emily Davis', '88 Ocean Drive, Sydney, Australia', '1984-02-18', 10, 'emilyd84', 'hashed_pw_010', 'emily.davis@email.au', '+61412345678', 'Deactivated', '2023-12-10'),
('Chen Wei', '65 Longhua Road, Shanghai, China', '1993-04-23', 11, 'chenwei93', 'hashed_pw_011', 'chen.wei@email.cn', '+8613812345678', 'Active', NULL),
('Oluwaseun Adeyemi', '9 Ikorodu Road, Lagos, Nigeria', '1989-08-20', 12, 'seun_adeyemi', 'hashed_pw_012', 'seun.adeyemi@email.com', '+2348076543210', 'Active', NULL);
GO

SELECT * FROM Customers;
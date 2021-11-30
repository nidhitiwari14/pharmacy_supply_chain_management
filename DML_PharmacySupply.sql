--Insert Into Tables
--Insert Into Customer Table
Go
Use PharmacySupply

Go
Create or Alter Procedure InsertInCustomer
@Name nvarchar(15)
, @address Varchar(20), @city Varchar(10), @state Varchar(10), @zipCode Varchar (6),
@custType Varchar(10), @SSNNum varchar(10) 
AS 
BEGIN
Insert Into Customer ([Name], [Address], City, [State],
 ZipCode, CustType, SSNNumber)
Values (@Name, @address, @city, @state, @zipCode, @custType
, Convert(varbinary, @SSNNum)) 
END;
GO

Execute InsertInCustomer 'Little Med', '23 Tremont Street', 'Boston', 'MA', '02214', 'Pharmacy', '123-80-2323'; 
Execute InsertInCustomer 'Rode Medicals', '120 Longwood Lane', 'Boston', 'MA', '02212', 'Pharmacy', '123-84-2124';
Execute InsertInCustomer 'Northeast Hospital', '120 Main Street', 'Boston', 'MA', '02214', 'Hospital', '123-89-3226';
Execute InsertInCustomer 'Boston Hospital', '101 Jana Street', 'Boston', 'MA', '02115', 'Hospital', '132-80-3250';
Execute InsertInCustomer 'Leela Hospital', '12 Main Street', 'Boston', 'MA', '03312', 'Hospital', '142-86-3098';
Execute InsertInCustomer 'Sana Pharma', '112 Tali Street', 'Boston', 'MA', '03156', 'Pharmacy', '112-88-1209';
Execute InsertInCustomer 'Rhode Pharma', '11 Drive Street', 'Cumberland', 'RI', '13145', 'Pharmacy', '102-11-3209';
Execute InsertInCustomer 'Ranys Medicals', '21 Drive Road', 'Cumberland', 'RI', '32980', 'Pharmacy', '132-30-3021';
Execute InsertInCustomer 'Golden Hospital', '10 Trixie Land', 'Houston', 'TX', '12309', 'Pharmacy', '102-10-1234';
Execute InsertInCustomer 'Donna Meds', '32 Ester Street', 'New York', 'New York', '23098', 'Pharmacy', '132-30-3021';

Go
Create or Alter Procedure InsertInVendor
@Name nvarchar(15), @address Varchar(20), @city Varchar(10), @state Varchar(10), @zipCode Varchar (6) AS
BEGIN
Insert Into Vendor ([Name], [Address], City, [State], ZipCode)
Values (@Name, @address, @city, @state, @zipCode) 
END;
GO

Execute InsertInVendor 'Eversana', '120 Bolly Lane', 'Boston', 'MA', '02118'; 
Execute InsertInVendor 'Yourway', '125 Charlie Street', 'Boston', 'MA', '02116';
Execute InsertInVendor 'Banasra', '112 Purple Heart', 'Boston', 'MA', '03117';
Execute InsertInVendor 'Vankor', '100 Wincent Street', 'Boston', 'MA', '13707';
Execute InsertInVendor 'Pikashu', '99 Back Bay', 'Boston', 'MA', '27307';
Execute InsertInVendor 'Parsans', '10 Somerville', 'Boston', 'MA', '27113';
Execute InsertInVendor 'Tikana', '1205 Boylston', 'Boston', 'MA', '02215';
Execute InsertInVendor 'Viscoser', '1226 Windsor Lane', 'Boston', 'MA', '02215';
Execute InsertInVendor 'Angeuila', '1239 Jaenka Street', 'Boston', 'MA', '02215';
Execute InsertInVendor 'Geneka', '1340 Genelia Street', 'Boston', 'MA', '03319';

Go
Create or Alter Procedure InsertInManufacturer @Name varchar(20)
, @address Varchar(20), @city Varchar(10), @state Varchar(10), @zipCode Varchar (6) 
AS 
BEGIN
Insert Into Manufacturer ([Name], [Address], City, [State], ZipCode)
Values (@Name, @address, @city, @state, @zipCode)
END;
Go
 
Execute InsertInManufacturer 'Northeast Belle Unit', '115 Belle Isle Main Street', 'Boston', 'MA', '32806';
Execute InsertInManufacturer 'Arnold Unit', '115 Arnold', 'Boston', 'MA', '33405';
Execute InsertInManufacturer 'South Boston Unit', '110 South', 'Boston', 'MA', '33154';
Execute InsertInManufacturer 'Paul Carson Unit', '91 Carson', 'Boston', 'MA', '22145';
Execute InsertInManufacturer 'Back Bay Fens', '23 Back Bay', 'Boston', 'MA', '02219';
Execute InsertInManufacturer 'Winthrop Unit', '1305 Winthrop', 'Boston', 'MA', '22156';
Execute InsertInManufacturer 'Chelsea Unit', '1470 Chelsea', 'Boston', 'MA', '02158';
Execute InsertInManufacturer 'Everett Unit', '1216 Everett', 'Boston', 'MA', '03187';
Execute InsertInManufacturer 'Watertown', '167 Watertown', 'Boston', 'MA', '02189';
Execute InsertInManufacturer 'Wegmans', '117 Wegmans', 'Boston', 'MA', '21879';

Go
Create or Alter Procedure InsertInLogistic @TransportMedium Varchar (10) ,@MaxCapacity int AS
BEGIN
Insert Into Logistic (TransportMedium, MaxCapacity)
Values (@TransportMedium, @MaxCapacity) 
END;
GO

Execute InsertInLogistic 'Truck', 28000;
Execute InsertInLogistic 'Truck', 25000;
Execute InsertInLogistic 'Travel Trailer', 2000;
Execute InsertInLogistic 'Tata Ace', 1500;
Execute InsertInLogistic 'CMV', 2300;
Execute InsertInLogistic 'Truck', 5000;
Execute InsertInLogistic 'Panel Van', 4500;
Execute InsertInLogistic 'Double Cabin Van', 5500;
Execute InsertInLogistic 'Tipper Van Small', 1600;
Execute InsertInLogistic 'Pick Up Truck', 1800;

Go
Create or Alter Procedure InsertInDrug
@DrugName Varchar(10), @IsFDAApproved Bit, @Price float, @ExpiryDate Date, @DEALicenseNumber Varchar(10)
AS 
BEGIN
Insert Into Drug (DrugName, IsFDAApproved, Price, ExpiryDate, DEALicenseNumber)
Values (@DrugName, @IsFDAApproved, @Price, @ExpiryDate, @DEALicenseNumber) 
END;
GO

Execute InsertInDrug 'Dolo', 1, 11.0, '01/20/2023', '1098234675';
Execute InsertInDrug 'Amlodipine', 1, 6.0, '02/01/2023', '1029384756';
Execute InsertInDrug 'Lisinopril', 0, 4.0, '05/10/2024', '1030810557';
Execute InsertInDrug 'Gabapentin', 0, 3.0, '05/10/2024', '1000890127';
Execute InsertInDrug 'Saridon', 0, 2.0, '06/11/2024', '1206890199';
Execute InsertInDrug 'Metformin', 1, 10.0, '05/12/2022', '1316890129';
Execute InsertInDrug 'Lipitor', 1, 9.0, '10/11/2023', '1016998124';
Execute InsertInDrug 'Levothyroxine', 1, 8.0, '10/11/2023', '1416998189';
Execute InsertInDrug 'Vicodin', 1, 4.0, '10/11/2024', '1616996170';
Execute InsertInDrug 'Ibrufen', 0, 1.0, '10/11/2025', '1916998160';

Go
Create or Alter Procedure InsertInRawMaterial @Name Varchar(20), @Price float
AS 
BEGIN
Insert Into RawMaterial ([Name], Price)
Values (@Name, @Price) 
END;
GO

Execute InsertInRawMaterial 'Ethylene Glycol', 1.0;
Execute InsertInRawMaterial 'Caustic Soda', 2.0;
Execute InsertInRawMaterial 'Hydrochloric Acid', 2.0;
Execute InsertInRawMaterial 'Chemax PEG-20000', 2.0;
Execute InsertInRawMaterial 'Chemax PEG-400', 2.0;
Execute InsertInRawMaterial 'Chemax PEG-200', 2.0;
Execute InsertInRawMaterial 'Chemax PEG-600', 2.0;
Execute InsertInRawMaterial 'Polikol 1500', 2.0;
Execute InsertInRawMaterial 'Polikol 1000PF', 2.0;
Execute InsertInRawMaterial 'Polikol 1500Flakes', 2.0;

Go
Create or Alter Procedure InsertInStorageFacility @Location Varchar(20), @StorageType Varchar(15)
AS 
BEGIN
Insert Into StorageFacility ([Location], StorageType)
Values (@Location, @StorageType); 
END;
GO

Execute InsertInStorageFacility '129 Tremont Street', 'Cold Storage'; 
Execute InsertInStorageFacility '31 Back Bay', 'Room Storage';
Execute InsertInStorageFacility '11 Back Bay', 'Room Storage';
Execute InsertInStorageFacility '130 Tremont Street', 'Cold Storage';
Execute InsertInStorageFacility '112 Tremont Street', 'Cold Storage';
Execute InsertInStorageFacility '113 Purple Heart', 'Cold Storage';
Execute InsertInStorageFacility '115 Wisconsin Street', 'Cold Storage';
Execute InsertInStorageFacility '32 Back Bay', 'Room Storage';
Execute InsertInStorageFacility '12 Back Bay', 'Room Storage';
Execute InsertInStorageFacility '117 Wegmans', 'Room Storage';

Go
Create or Alter Procedure InsertInDistributor
@Name Varchar(20), @Contact Varchar(10), @Address Varchar(30)
AS 
BEGIN
Insert Into Distributor ([Name], Contact, [Address])
Values (@Name, @Contact, @Address); 
END;
Go

Execute InsertInDistributor 'McKesson Distributor', '1890765234', '121 Tremont Street Boston';
Execute InsertInDistributor 'Henly Distributor', '1028345670', '132 Tremont Street Boston';
Execute InsertInDistributor 'Maize Distributor', '1234098765', '112 Wisconcin Street Boston';
Execute InsertInDistributor 'Journey Distributor', '1345670980', '102 Purple Heart Boston';
Execute InsertInDistributor 'Mahima Distributor', '1098234567', '162 Wimport Boston';
Execute InsertInDistributor 'Renexa Distributor', '1023363233', '116 Ba k Bay Boston';
Execute InsertInDistributor 'Sonishta Distributor', '1032948860', '150 Windsor Boston';
Execute InsertInDistributor 'Roxiene Distributor', '1199883340', '109 Roxienne Boston';
Execute InsertInDistributor 'Genesa Distributor', '1199883340', '178 Carson Boston';
Execute InsertInDistributor 'Ricksha Distributor', '1199883340', '145 Chelsea Boston';

Go
Create or Alter Procedure InsertInHospital @CustomerID int, @DoctorContact int
AS 
BEGIN
Insert Into Hospital (CustomerID, DoctorContact)
Values (@CustomerID, @DoctorContact); 
END;
GO

Execute InsertInHospital '3', '1098723456';
Execute InsertInHospital '4', '1123445509';
Execute InsertInHospital '5', '1223344550';

Go
Create or Alter Procedure InsertInPharmacy @CustomerID int
AS 
BEGIN
Insert Into Pharmacy (CustomerID)
Values (@CustomerID); 
END;
GO

Execute InsertInPharmacy '1'; 
Execute InsertInPharmacy '2';
Execute InsertInPharmacy '6';
Execute InsertInPharmacy '7'; 
Execute InsertInPharmacy '8'; 
Execute InsertInPharmacy '9'; 
Execute InsertInPharmacy '10';

Go  
Create or Alter Procedure InsertInColdStorage @StorageID int, @Temperature Varchar(5)
AS 
BEGIN
Insert Into ColdStorage (StorageID, Temperature)
Values (@StorageID, @Temperature); 
END;
GO

Execute InsertInColdStorage '1', '49F';
Execute InsertInColdStorage '4', '59F';
Execute InsertInColdStorage '5', '52F';
Execute InsertInColdStorage '6', '50F';
Execute InsertInColdStorage '7', '59F';

Go 
Create or Alter Procedure InsertInRoomStorage @StorageID int
AS 
BEGIN
Insert Into RoomStorage (StorageID)
Values (@StorageID); 
END;
Go

Execute InsertInRoomStorage '2';
Execute InsertInRoomStorage '3';
Execute InsertInRoomStorage '8';
Execute InsertInRoomStorage '9';
Execute InsertInRoomStorage '10';

Go
Create or Alter Procedure InsertInSupplies
@VendorID int, @ManufacturerID int, @RawMaterialID int, @LogisticID int, @SupplyDate Date, @Quantity int
AS 
BEGIN
Insert Into Supplies (VendorID, ManufacturerID, RawMaterialID, LogisticID, SupplyDate , Quantity)
Values (@VendorID, @ManufacturerID, @RawMaterialID, @LogisticID, @SupplyDate, @Quantity);
END;
GO

Execute InsertInSupplies 10, 1, 20, 1, '12/1/2021', 10000;
Execute InsertInSupplies 11, 2, 20, 2, '10/2/2021', 15000;
Execute InsertInSupplies 11, 2, 21, 2, '11/10/2021', 15000;
Execute InsertInSupplies 12, 3, 22, 3, '12/10/2021', 20000;
Execute InsertInSupplies 13, 4, 23, 4, '11/10/2021', 15000;
Execute InsertInSupplies 14, 3, 24, 5, '12/10/2021', 21000;
Execute InsertInSupplies 15, 5, 25, 6, '09/30/2021', 14000;
Execute InsertInSupplies 16, 6, 26, 7, '11/22/2021', 2000;
Execute InsertInSupplies 17, 7, 27, 8, '12/19/2021', 9000;
Execute InsertInSupplies 18, 8, 28, 9, '09/25/2021', 28000;


Go
Create or Alter Procedure InsertDrugBatches @DrugID int, @StorageID int, @ManufacturerID int
, @DateManufactured Date, @ExpiryDate Date, @RequireColdStorage VARCHAR(5)
AS 
BEGIN
Insert Into DrugBatches (DrugID, StorageID, ManufacturerID, DateManufactured , ExpiryDate, RequireColdStorage)
Values (@DrugID, @StorageID, @ManufacturerID, @DateManufactured, @ExpiryDate, @RequireColdStorage); 
END;
Go

Execute InsertDrugBatches 1, 1, 1, '10/1/2021', '10/1/2025', 'Yes';
Execute InsertDrugBatches 2, 4, 2, '11/2/2021', '12/12/2025', 'Yes';
Execute InsertDrugBatches 3, 3, 3, '10/11/2021', '10/11/2025', 'No';
Execute InsertDrugBatches 4, 2, 4, '09/1/2021', '09/1/2024', 'No';
Execute InsertDrugBatches 5, 5, 5, '08/1/2020', '01/1/2022', 'Yes';
Execute InsertDrugBatches 6, 6, 1, '10/1/2021', '10/1/2025', 'Yes';
Execute InsertDrugBatches 7, 6, 6, '10/1/2021', '10/1/2022', 'Yes';
Execute InsertDrugBatches 8, 7, 7, '11/11/2021', '11/1/2022', 'Yes';
Execute InsertDrugBatches 9, 8, 8, '11/1/2020', '10/1/2023', 'No';
Execute InsertDrugBatches 10, 9, 9, '08/1/2021', '10/1/2024', 'No';

Go
Create or Alter Procedure InsertDistributesCollection @BatchID int, @DistributorID int, @LogisticID int, @CustomerID int, @DistributeDate Date, @OrderPrice FLOAT
AS 
BEGIN
Insert Into DistributesCollection (BatchID, DistributorID, LogisticID, CustomerID
, DistributeDate, OrderPrice)
Values (@BatchID, @DistributorID, @LogisticID, @CustomerID, @DistributeDate, @OrderPrice
); 
END;
GO

Execute InsertDistributesCollection 200, 1, 1, 1, '10/10/2021', 10000;
Execute InsertDistributesCollection 201, 1, 1, 1, '11/11/2021', 10000;
Execute InsertDistributesCollection 202, 2, 2, 2, '11/12/2021', 12000;
Execute InsertDistributesCollection 203, 3, 2, 3, '11/15/2021', 13000;
Execute InsertDistributesCollection 204, 4, 3, 3, '11/19/2021', 15000;
Execute InsertDistributesCollection 205, 5, 4, 4, '11/20/2021', 20000;
Execute InsertDistributesCollection 206, 6, 5, 5, '11/20/2021', 21000;
Execute InsertDistributesCollection 207, 7, 6, 6, '10/21/2021', 25000;
Execute InsertDistributesCollection 208, 8, 7, 7, '10/30/2021', 28000;
Execute InsertDistributesCollection 209, 9, 8, 9, '11/30/2021', 30000;
Execute InsertDistributesCollection 200, 1, 2, 9, '10/15/2021', 30000;
Execute InsertDistributesCollection 200, 1, 2, 9, '10/16/2021', 28000;
Execute InsertDistributesCollection 200, 1, 1, 2, '10/15/2021', 25000;
Execute InsertDistributesCollection 200, 1, 1, 3, '10/16/2021', 23000;
Execute InsertDistributesCollection 200, 1, 1, 4, '10/18/2021', 22000;
Execute InsertDistributesCollection 206, 6, 5, 6, '11/24/2021', 15000;
Execute InsertDistributesCollection 206, 6, 5, 7, '11/22/2021', 23000;
Execute InsertDistributesCollection 206, 6, 5, 8, '11/25/2021', 20000;
Execute InsertDistributesCollection 207, 7, 6, 9, '10/28/2021', 19000;
Execute InsertDistributesCollection 207, 7, 6, 5, '10/29/2021', 26000;
Execute InsertDistributesCollection 207, 7, 6, 10, '10/28/2021', 22000;

--Procedure Execution
--Execute GetAllDrugBatchesNeedColdStorage
Declare @xmlOutput XML;
Execute GetAllDrugBatchesNeedColdStorage '09/01/2026', @xmlOutput output;

--Execute GetDistributorforMaxRevenue
Declare @DistributorName Varchar(20);
Execute GetDistributorforMaxRevenue '12/11/2021', @DistributorName output; 
Select @DistributorName as [Max Revenue Distributor];

--Execute GetMaximumQuantityVendor
Declare @VendorName Varchar(20);
Execute GetMaximumQuantityVendor 'Ethylene Glycol', @VendorName output; Select @VendorName as [Max Quantity Supplied by];

--Execute GetOrderDetails
Execute GetOrderDetails 200;

--Execute Trigger
Update Drug set IsFDAApproved=0 where DrugID = 1;


 
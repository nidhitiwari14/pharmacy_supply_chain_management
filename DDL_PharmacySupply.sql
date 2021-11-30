Create Database PharmacySupply;

Go
Use PharmacySupply

Go
Create Table Customer(CustomerID int not null identity(1,1), [Name] nvarchar (15), SSNNumber varbinary(400), [Address] Varchar(20), City Varchar(10), [State] Varchar (10), ZipCode Varchar (6), CustType Varchar(10) CHECK (CustType IN ('Hospital', 'Pharmacy'))
Constraint Customer_PK primary key(CustomerID));

Create Table Vendor(VendorID int not null identity(10,1), [Name] nvarchar(10), [Address] Varchar(20), City Varchar(10), [State] Varchar (10),
 ZipCode Varchar (6)
Constraint Vendor_PK primary key(VendorID));

Create Table Manufacturer(ManufacturerID int not null identity(1,1), [Name] nvarchar(20), [Address] Varchar(20), City Varchar(10), [State] Varchar (10),
ZipCode Varchar (6)
Constraint Manufacturer_PK primary key(ManufacturerID));

Create Table Logistic(LogisticID int not null identity(1,1), TransportMedium Varchar (10), MaxCapacity int
Constraint Logistic_PK primary key(LogisticID));
Create Table Drug(DrugID int not null identity(1,1), DrugName Varchar(10),
 IsFDAApproved Bit,
Price float, ExpiryDate Date, DEALicenseNumber Varchar(10) Constraint Drug_PK primary key(DrugID));

Create Table RawMaterial(RawMaterialID int not null identity(20,1), [Name] Varchar(20), Price Float
Constraint RawMaterial_PK primary key(RawMaterialID));

Create Table StorageFacility(StorageID int not null identity(1,1), [Location] Varchar(20), StorageType Varchar(15) CHECK (StorageType IN ('Cold Storage', 'Room Storage'))
 Constraint Storage_PK primary key(StorageID));

Create Table Distributor(DistributorID int not null identity(1,1), [Name] Varchar(20)
, Contact Varchar(10), [Address] Varchar(30) Constraint Distributor_PK primary key(DistributorID));

Create Table Hospital(CustomerID int not null, DoctorContact int
Constraint Hospital_PK primary key(CustomerID), Constraint Hospital_FK1 FOREIGN Key (CustomerID) REFERENCES Customer (CustomerID));

Create Table Pharmacy(CustomerID int not null Constraint Pharmacy_PK primary key(CustomerID)
, Constraint Pharmacy_FK1 FOREIGN Key (CustomerID) REFERENCES Customer (CustomerID));

Create Table ColdStorage(StorageID int not null, Temperature Varchar(5)
Constraint ColdStorage_PK primary key(StorageID), Constraint ColdStorage_FK1 FOREIGN Key (StorageID) REFERENCES StorageFacility (StorageID));

Create Table RoomStorage(StorageID int not null Constraint RoomStorage_PK primary key(StorageID)
, Constraint RoomStorage_FK1 FOREIGN Key (StorageID) REFERENCES StorageFacility (StorageID));

Create Table Supplies(SupplyID int not null identity(100,1), VendorID int, ManufacturerID int, RawMaterialID int, LogisticID int,
 SupplyDate Date, Quantity int
Constraint Supply_PK primary key(SupplyID), Constraint Supply_FK1 FOREIGN Key (VendorID) REFERENCES Vendor (VendorID),
Constraint Supply_FK2 FOREIGN Key (ManufacturerID) REFERENCES Manufacturer (ManufacturerID), Constraint Supply_FK3 FOREIGN Key (RawMaterialID) REFERENCES RawMaterial (RawMaterialID), Constraint Supply_FK4 FOREIGN Key (LogisticID) REFERENCES Logistic (LogisticID)
 );

Create Table DrugBatches(BatchID int not null identity(200,1),
DrugID int, StorageID int, ManufacturerID int, DateManufactured Date, ExpiryDate Date Constraint DrugBatches_PK primary key(BatchID),
Constraint DrugBatches_FK1 FOREIGN Key (DrugID) REFERENCES Drug (DrugID),
Constraint DrugBatches_FK2 FOREIGN Key (StorageID) 
REFERENCES StorageFacility (StorageID),
Constraint DrugBatches_FK3 FOREIGN Key (ManufacturerID) REFERENCES Manufacturer (ManufacturerID)
);

Alter table DrugBatches add RequireColdStorage Varchar(5) CHECK (RequireColdStorage IN ('Yes', 'No'));

Create Table DistributesCollection(
CollectorID int not null identity(100,1), BatchID int not null,
 DistributorID int, LogisticID int, CustomerID int,
DistributeDate Date, OrderPrice Float
Constraint DistributesCollection_PK primary key(CollectorID), Constraint DistributesCollection_FK1 FOREIGN Key (BatchID) REFERENCES DrugBatches (BatchID),
Constraint DistributesCollection_FK2 FOREIGN Key (DistributorID) REFERENCES Distributor (DistributorID),
Constraint DistributesCollection_FK3 FOREIGN Key (LogisticID) REFERENCES Logistic (LogisticID),
Constraint DistributesCollection_FK4 FOREIGN Key (CustomerID) REFERENCES Customer (CustomerID),
);

--Data Encryption
--Create a master key for the database.
Go
create MASTER KEY
ENCRYPTION BY PASSWORD = 'pharmacySupply123';
Go
-- verify that master key exists
-- SELECT name KeyName, symmetric_key_id KeyID, key_length KeyLength,
--  algorithm_desc KeyAlgorithm FROM sys.symmetric_keys;
--Create a self signed certificate and name it CustSSNNum
Go
CREATE CERTIFICATE CustSSNNum
 WITH SUBJECT = 'Customer Sample SSN Number';
 Go

--Create a symmetric key with AES 256 algorithm using the certificate
-- as encryption/decryption method
CREATE SYMMETRIC KEY CustSSN_SM
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE CustSSNNum;
OPEN SYMMETRIC KEY CustSSN_SM DECRYPTION BY CERTIFICATE CustSSNNum;

Go
--Procedure Provide all drugs that need cold storage and expiry date input date given and return xml;
Create or Alter Procedure GetAllDrugBatchesNeedColdStorage @expDate Date ,@xmlOutput XML Output
AS
BEGIN
Select db.BatchID, db.DrugID, db.ExpiryDate
from DrugBatches db where db.RequireColdStorage = 'Yes' and db.ExpiryDate <= @expDate FOR XML RAW ('DrugBatch');
END;
Go

Go
--Procedure Provide Distributor Name who is giving the company maximum Revenue and --input distributed date is less than the given date in input
Create or Alter Procedure GetDistributorforMaxRevenue @distributeDate Date, @DistributorName Varchar(20) OUTPUT
AS
BEGIN
Declare @max_revenue FLOAT;
Select @max_revenue = Max(dc.OrderPrice) from DistributesCollection dc; Select Top 1 @DistributorName = d.name
 From DistributesCollection dc JOIN Distributor d ON dc.DistributorID = d.DistributorID WHERE dc.DistributeDate < @distributeDate and dc.OrderPrice = @max_revenue;
 END;
Go

Go
--Procedure to determine which vendor supplies input Raw Material --- in Maximum Quantity
Create or Alter Procedure GetMaximumQuantityVendor @rawMaterialName Varchar(20),
@VendorName Varchar(20) OUTPUT AS
BEGIN

Select Top 1 @VendorName = v.Name
from Vendor v JOIN Supplies s ON s.VendorID = v.VendorID JOIN RawMaterial r ON r.RawMaterialID = s.RawMaterialID
where s.Quantity = (Select Top 1 Max(Quantity) from Supplies GROUP by Quantity);

END;
Go

--Fuction to get Time period between Date Batch was manufactured i.e 
--DateManufatured from DrugBatches to Date when Drug Distributed i.e Distribute 
--Date in DistributesCollection and the use Procedure to show it in Select statement
Go
Create OR Alter Function GetDatesBatchManufaturedToDistributed(@batchID int) RETURNS int
AS
BEGIN
Declare @totalDays int;
Select @totalDays = DATEDIFF(DAY, db.DateManufactured, dc.DistributeDate) from DrugBatches db JOIN DistributesCollection dc
ON db.BatchID = dc.BatchID where dc.BatchID = @batchID;
RETURN @totalDays;
END;
Go

--Procedure to get CustomerName, Number of days from Date Manufactured to Date Sold and Price at which
--sold
Go
Create or Alter Procedure GetOrderDetails @batchID int
AS
BEGIN
Select dc.BatchID, dbo.GetDatesBatchManufaturedToDistributed(@batchID) as [Total Days In Warehouse], c.name as CustomerName, dc.OrderPrice
from DistributesCollection dc JOIN Customer c ON c.CustomerID = dc.CustomerID where dc.BatchID = @batchID;
END;
Go
--Views
--Create View to View the Orders Details from Distrubtes Collection
--Where Drug Order Price is greater than Average Order Price of all drugs
Go
CREATE VIEW Distributor_Order_Details_View 
AS

SELECT dc.BatchID, dc.DistributorID, dc.OrderPrice 
FROM DistributesCollection dc
Where dc.OrderPrice > (SELECT AVG(OrderPrice) FROM DistributesCollection);
Go

--Create View for Logistic Team to view Vendor Details, Manufacturer Details,
-- Supply Date to View which vendor supplied What Raw Materials and Quantity to the 
--manufacturing plant 
Go
CREATE OR Alter VIEW Supply_Order_View AS
SELECT l.LogisticID, l.TransportMedium, v.Name as VendorName, m.Name as ManufacturerName
,r.Name as RawMaterial, s.Quantity, s.SupplyDate
From Supplies s JOIN Vendor v ON s.VendorID = v.VendorID JOIN Manufacturer m
 ON m.ManufacturerID = s.ManufacturerID JOIN RawMaterial r 
 ON r.RawMaterialID = s.RawMaterialID JOIN Logistic l ON l.LogisticID = s.LogisticID;
Go
--TRIGGER
--Create a trigger When IsFDAApproved Column in Drug Table gets Updated that logs
--DrugID, DrugName, PreviousFDAStatus, DateWhenStatusChanged(Current Date), CurrentFDAStatus
CREATE TABLE [DrugFDAApprovalChangeHistory]( [DrugFDAApprovalChangeHistoryID] int not null primary key identity(1,1),
[DrugID] [int] NOT NULL,
[DrugName] VARCHAR(20), [Old_FDAApproval_Status] Bit, [New_FDAApproval_Status] Bit NULL,
 ChangeDate datetime null );

Go
CREATE TRIGGER DrugFDAStatusChange ON dbo.Drug
FOR UPDATE
AS
BEGIN
IF UPDATE(IsFDAApproved)
begin
 INSERT INTO [DrugFDAApprovalChangeHistory] ( [DrugID],
[DrugName],
[Old_FDAApproval_Status], [New_FDAApproval_Status],
 ChangeDate)
SELECT d.DrugID, d.DrugName, d.IsFDAApproved, i.IsFDAApproved, GETDATE() FROM DELETED d 
Join INSERTED i on d.DrugID = i.DrugID
end;
END;



CREATE TABLE Hospital(
	HospitalID VARCHAR(10),
	HospitalName VARCHAR(50),
	PhoneNumber VARCHAR(20) UNIQUE,
	HospitalAddress VARCHAR(80),
	PRIMARY KEY (HospitalID));

CREATE TABLE Patient(
	PatientID VARCHAR(10),
    HospitalID VARCHAR(10),
	BloodType VARCHAR(5),
	Name VARCHAR(50),
	PatientDisease VARCHAR(100),
	Sex CHAR(1),
	DateOfBirth DATE,
	DateOfRequest DATE,
	DateOfReceival DATE,
	PRIMARY KEY (PatientID),
	FOREIGN KEY (HospitalID) REFERENCES Hospital    
    ON DELETE SET NULL     
    ON UPDATE CASCADE);

CREATE TABLE Employee(
	EmployeeID VARCHAR(10),
    BloodBankID VARCHAR(10) NULL,
	Email VARCHAR(255) UNIQUE,
    Name VARCHAR(50),
	PhoneNumber VARCHAR(20) UNIQUE,
	PRIMARY KEY (EmployeeID));

CREATE TABLE Nurse(
	EmployeeID VARCHAR(10),
	NurseRenewalID VARCHAR(10),
	DateOfNurseRegistration DATE,
	PRIMARY KEY (EmployeeID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee   
    ON DELETE CASCADE   
    ON UPDATE CASCADE);

CREATE TABLE BloodBankManager(
	EmployeeID VARCHAR(10),
	OfficeNo VARCHAR(10),
	PRIMARY KEY (EmployeeID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee   
    ON DELETE CASCADE   
    ON UPDATE CASCADE);

CREATE TABLE WorksDuringShift(
	EmployeeID VARCHAR(10),
	ShiftDate DATE,
	StartTime TIME,
	EndTime TIME,
	PRIMARY KEY (EmployeeID, ShiftDate, StartTime, EndTime),
	FOREIGN KEY (EmployeeID) REFERENCES Employee   
    ON DELETE SET NULL   
    ON UPDATE CASCADE);

CREATE TABLE Donor( 
	DonorID VARCHAR(10),
    EmployeeID VARCHAR(10),
	Sex CHAR(1),
	WeightKG INT,
	Name VARCHAR(50),
	DateOfBirth DATE,
	BloodType VARCHAR(5),
    PRIMARY KEY (DonorID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee 	
    ON DELETE NO ACTION     
    ON UPDATE CASCADE);

CREATE TABLE BloodBankStation(
	BloodBankID VARCHAR(10),
	PhoneNumber VARCHAR(20) UNIQUE,
    EmployeeID VARCHAR(10),
	BloodBankAddress VARCHAR(80),
	PRIMARY KEY (BloodBankID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee   
    ON DELETE SET NULL     
    ON UPDATE CASCADE);

ALTER TABLE Employee
ADD FOREIGN KEY (BloodBankID) REFERENCES BloodBankStation 
    ON DELETE SET NULL   
    ON UPDATE CASCADE;

CREATE TABLE Equipment(
	EquipmentID VARCHAR(10),
 	Quantity INT,
 	Cost MONEY,
	EquipmentName VARCHAR(30),
	BloodBankID VARCHAR(10),
	PRIMARY KEY (EquipmentID),
	FOREIGN KEY (BloodBankID) REFERENCES BloodBankStation   
    ON DELETE SET NULL    
    ON UPDATE CASCADE);

CREATE TABLE Blood(
	BloodID VARCHAR(10),
	BloodType VARCHAR(5),
    BloodBankID VARCHAR(10),
    DonorID VARCHAR(10),
	DonatedDate DATE,
	InitialQuantity VARCHAR(6),
	AvailableQuantity VARCHAR(6),
	PRIMARY KEY (BloodID),
	FOREIGN KEY (BloodBankID) REFERENCES BloodBankStation   
    ON DELETE SET NULL    
    ON UPDATE CASCADE,
	FOREIGN KEY (DonorID) REFERENCES Donor   
    ON DELETE SET NULL    
    ON UPDATE CASCADE);

CREATE TABLE BloodOrder(
	OrderID VARCHAR(10),
	BloodType VARCHAR(5),
	Quantity VARCHAR(5),
	OrderDate DATE,
	OrderStatus VARCHAR(20),
	BloodBankID VARCHAR(10),
	HospitalID VARCHAR(10),
	PRIMARY KEY (OrderID),
	FOREIGN KEY (BloodBankID) REFERENCES BloodBankStation   
	ON DELETE SET NULL    
	ON UPDATE CASCADE,
	FOREIGN KEY (HospitalID) REFERENCES Hospital    
	ON DELETE SET NULL    
	ON UPDATE CASCADE);

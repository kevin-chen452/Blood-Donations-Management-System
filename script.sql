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
    ON DELETE CASCADE    
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
	InitialQuantity FLOAT,
	AvailableQuantity FLOAT,
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
	Quantity FLOAT,
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

INSERT INTO Hospital(HospitalID, HospitalName, PhoneNumber, HospitalAddress)
VALUES  ('H000000001', 'Happy Hospital', '778-999-9999', '999 Happy Street'),
        ('H000000002', 'Heroic Hospital', '778-999-8888', '888 Heroic Street'),
        ('H000000003', 'Hearty Hospital', '778-999-7777', '777 Heary Street'),
        ('H000000004', 'Huge Hospital', '778-999-6665', '655 Huge Street'),
        ('H000000005', 'Capable Clinic', '778-999-5555', '555 Capable Avenue'),
        ('H000000006', 'Incapable Clinic', '778-999-4444', '556 Incapable Avenue'),
        ('H000000007', 'Clinic and Picnic', '778-999-1111', '557 Andes Avenue'),
        ('H000000008', 'Love Hospital', '778-999-5693', '1967 Love Avenue'),
        ('H000000009', 'DokiDoki Clinic', '778-999-1783', '1378 Poem Avenue'),
        ('H000000010', 'Literature Clinic', '604-135-1728', '2017 Poem Road');

INSERT INTO Patient(PatientID, BloodType, Name, PatientDisease, Sex, DateOfBirth, DateOfRequest, DateOfReceival, HospitalID)
VALUES  ('P000000001', 'A', 'Carina Kendal', 'N/A', 'F', '1999-10-10', '2021-02-03', '2020-02-05', 'H000000001'),
        ('P000000002', 'O', 'Jordan Tuff', 'Diabetes Type 2', 'M', '2002-10-10', '2021-03-03', '2021-03-06', 'H000000001'),
        ('P000000003', 'B', 'Carry Lee', 'Coronory Heart Disease', 'M', '2001-10-10', '2021-03-03', '2021-03-04', 'H000000001'),
        ('P000000004', 'OP', 'Samara Kim', 'N/A', 'F', '2004-10-10', '2021-02-02', '2021-02-05', 'H000000002'),
        ('P000000005', 'AB', 'Waldo Emmet', 'N/A', 'M', '2005-10-10', '2021-03-03', '2021-03-10', 'H000000003'),
        ('P000000006', 'A', 'Peter Demeanor', 'Coronavirus', 'M', '1975-12-11', '2021-03-31', '2021-04-01', 'H000000003'),
        ('P000000007', 'A', 'Lily Hilly', 'Depression', 'F', '2006-03-02', '2020-11-03', '2020-11-04', 'H000000008'),
        ('P000000008', 'O', 'Jade Laid', 'Low Self-Esteem', 'F', '2005-10-20', '2021-03-15', '2021-03-16', 'H000000007'),
        ('P000000009', 'B', 'Fanny Happy', 'Impostor Syndrome', 'F', '2001-10-10', '2021-03-26', '2021-03-27', 'H000000006'),
        ('P000000010', 'AB', 'Zach Hack', 'Burnout', 'M', '2001-10-01', '2021-01-01', '2021-01-05', 'H000000010');

INSERT INTO Employee(EmployeeID, Email, Name, PhoneNumber)
VALUES  ('N000000001', 'apple123@gmail.com', 'Fred Bloggs', '604-123-4567'),
        ('N000000002', 'potato123@hotmail.com', 'John Smith', '604-234-4567'),
        ('N000000003', 'potatofarmer@gmail.com', 'Bennett Head', '604-345-4567'),
        ('N000000004', 'imreallycool@gmail.com', 'Chadwick Francis', '604-456-4567'),
        ('N000000005', 'cpsc304@gmail.com', 'Imogene Spears', '604-567-4567'),
        ('BBM0000001', 'tomato123@gmail.com', 'Greg Blogs', '778-123-4567'),
        ('BBM0000002', 'computerscience@hotmail.com', 'Roland Hudson', '778-234-4567'),
        ('BBM0000003', 'datascience@gmail.com', 'Jim Gregs', '778-345-4567'),
        ('BBM0000004', 'imamanager@hotmail.com', 'Phil Bay', '778-456-4567'),
        ('BBM0000005', 'bloodmanagerdude@hotmail.com', 'Bob Jimothy', '778-567-4567');

INSERT INTO Nurse(EmployeeID, NurseRenewalID, DateOfNurseRegistration) 
VALUES  ('N000000001', 'BCCNM00001', '2021-02-27'),
        ('N000000002', 'BCCNM00002', '2021-02-27'),
        ('N000000003', 'BCCNM00003', '2021-02-27'),
        ('N000000004', 'BCCNM00004', '2021-02-27'),
        ('N000000005', 'BCCNM00005', '2021-02-27');

INSERT INTO BloodBankManager(EmployeeID, OfficeNo)
VALUES  ('BBM0000001', 'D101'),
        ('BBM0000002', 'D200'),
        ('BBM0000003', '105'),
        ('BBM0000004', '407'),
        ('BBM0000005', '300');

INSERT INTO Donor(DonorID, Sex, WeightKG, Name, DateOfBirth, BloodType, EmployeeID)
VALUES  ('DA00000001', 'M', '70', 'John Doe', '2000-01-01', 'A', 'N000000001'), 
        ('DO00000002', 'F', '55', 'Jane Do', '1930-12-12', 'O', 'N000000001'),
        ('DB00000003', 'M', '62', 'Mary Sue', '1980-10-10', 'B', 'N000000001'),
        ('DOP0000004', 'N', '55', 'Gary Stu', '1975-07-08', 'OP', 'N000000001'),
        ('DAB0000005', 'F', '54', 'Joe Bloggs', '2003-03-04', 'AB', 'N000000001'),
        ('DA00000006', 'M', '18', 'John Smoke', '2000-01-10', 'A', 'N000000002'), 
        ('DO00000007', 'M', '20', 'Jane Street', '1999-12-01', 'O', 'N000000002'),
        ('DB00000008', 'M', '28', 'Andy Airport', '1780-03-13', 'B', 'N000000002'),
        ('DOP0000009', 'N', '40', 'Susan Slime', '1975-02-06', 'A', 'N000000002'),
        ('DAB0000010', 'F', '58', 'Mary Merry', '2003-09-22', 'A', 'N000000002'),
        ('DAB0000011', 'M', '72', 'Joe Shmoe', '2003-09-30', 'AB', 'N000000003'),
        ('DAB0000012', 'N', '86', 'Caesar Sal', '2003-10-24', 'OP', 'N000000003'),
        ('DAB0000013', 'N', '92', 'Harry Hairy', '1972-02-21', 'OP', 'N000000003'),
        ('DAB0000014', 'M', '41', 'Peter Pan', '2001-09-12', 'B', 'N000000003'),
        ('DAB0000015', 'F', '100', 'Foo Bar', '2007-10-30', 'O', 'N000000003'),
        ('DAB0000016', 'F', '90', 'Joey Joe', '2007-10-29', 'A', 'N000000003'),
        ('DAB0000017', 'M', '91', 'Mark Fart', '2007-10-28', 'A', 'N000000003'),
        ('DAB0000018', 'M', '68', 'Ben Dai', '2007-10-27', 'AB', 'N000000003'),
        ('DAB0000019', 'M', '78', 'Steve Leave', '2007-10-26', 'OP', 'N000000003'),
        ('DAB0000020', 'F', '82', 'Chloe Aloe', '2007-10-25', 'B', 'N000000003');


INSERT INTO WorksDuringShift(EmployeeID, ShiftDate, StartTime, EndTime)
VALUES  ('N000000001', '2021-02-03', '10:00:00', '18:00:00'),
        ('N000000001', '2021-02-04', '10:00:00', '18:00:00'),
        ('N000000002', '2021-02-05', '10:00:00', '18:00:00'),
        ('N000000002', '2021-02-06', '14:00:00', '18:00:00'),
        ('N000000003', '2021-02-08', '10:00:00', '18:00:00');

INSERT INTO BloodBankStation(BloodBankID, PhoneNumber, BloodBankAddress, EmployeeID)
VALUES  ('BB00000001', '604-000-0001', '321 NotHappy Street', 'BBM0000001'),
        ('BB00000002', '604-000-0322', '432 Sad Street', 'BBM0000002'),
        ('BB00000003', '604-000-0003', '777 Potato Street', 'BBM0000003'),
        ('BB00000004', '604-000-0022', '432 BigSad Street', 'BBM0000004'),
        ('BB00000005', '604-000-0089', '123 Happy Street', 'BBM0000005'),
        ('BB00000006', '604-000-0098', '500 Amazon Road', 'BBM0000001'),
        ('BB00000007', '604-000-0055', '123 Harvard Crescent', 'BBM0000002'),
        ('BB00000008', '604-000-1234', '420 Book Boulevard', 'BBM0000003'),
        ('BB00000009', '604-000-4321', '998 Silicon Road', 'BBM0000003'),
        ('BB00000010', '604-000-1324', '999 Valley Road', 'BBM0000004');

UPDATE Employee
SET BloodBankID = 'BB00000005'
WHERE EmployeeID = 'N000000001';

UPDATE Employee
SET BloodBankID = 'BB00000005'
WHERE EmployeeID = 'N000000002';

UPDATE Employee
SET BloodBankID = 'BB00000005'
WHERE EmployeeID = 'N000000003';

UPDATE Employee
SET BloodBankID = 'BB00000005'
WHERE EmployeeID = 'N000000004';

UPDATE Employee
SET BloodBankID = 'BB00000005'
WHERE EmployeeID = 'N000000005';

UPDATE Employee
SET BloodBankID = 'BB00000005'
WHERE EmployeeID = 'BBM0000001';

UPDATE Employee
SET BloodBankID = 'BB00000001'
WHERE EmployeeID = 'BBM0000002';

UPDATE Employee
SET BloodBankID = 'BB00000002'
WHERE EmployeeID = 'BBM0000003';

UPDATE Employee
SET BloodBankID = 'BB00000003'
WHERE EmployeeID = 'BBM0000004';

UPDATE Employee
SET BloodBankID = 'BB00000004'
WHERE EmployeeID = 'BBM0000005';

INSERT INTO Blood(BloodID, BloodType, DonatedDate, InitialQuantity, AvailableQuantity, BloodBankID, DonorID)
VALUES  ('A000000001', 'A', '2021-02-01', 0.47, 0.47, 'BB00000005', 'DA00000001'),
        ('B000000002', 'B', '2021-02-01', 0.47, 0.3, 'BB00000005', 'DB00000003'),
        ('OP00000003', 'O+', '2021-02-02', 0.47, 0.1, 'BB00000005', 'DOP0000004'),
        ('AB00000004', 'AB', '2021-02-02', 0.47, 0.2, 'BB00000005', 'DAB0000005'),
        ('O000000005', 'O', '2021-02-02,', 0.47, 0.47, 'BB00000005', 'DO00000002'),
        ('O000000006', 'O', '2021-02-03', 0.5, 0.4, 'BB00000001', 'DO00000002'),
        ('O000000007', 'O', '2021-02-04', 0.5, 0.3, 'BB00000002', 'DO00000002'),
        ('O000000008', 'O', '2021-02-05', 0.5, 0.17, 'BB00000003', 'DO00000002'),
        ('O000000009', 'O', '2021-02-06', 0.5, 0.38, 'BB00000004', 'DO00000002'),
        ('O000000010', 'O', '2021-02-07', 0.5, 0.32, 'BB00000005', 'DO00000002'),
        ('O000000011', 'O', '2021-02-08', 0.5, 0.5, 'BB00000006', 'DO00000002'),
        ('O000000012', 'O', '2021-02-09', 0.5, 0.45, 'BB00000007', 'DO00000002'),
        ('O000000013', 'O', '2021-02-10', 0.5, 0.23, 'BB00000008', 'DO00000002'),
        ('O000000014', 'O', '2021-02-11', 0.5, 0.43, 'BB00000009', 'DO00000002'),
        ('O000000015', 'O', '2021-02-12', 0.5, 0.12, 'BB00000010', 'DO00000002'), 
        ('O000000016', 'OP', '2007-02-12', 0.9, 0.79, 'BB00000001', 'DAB0000013'),
        ('O000000017', 'OP', '2008-02-12', 0.9, 0.75, 'BB00000002', 'DAB0000013'),
        ('O000000018', 'OP', '2009-02-12', 0.75, 0.25, 'BB00000003', 'DAB0000013'),
        ('O000000019', 'OP', '2010-02-12', 0.23, 0.46, 'BB00000004', 'DAB0000013'),
        ('O000000020', 'OP', '2011-02-12', 0.46, 0.15, 'BB00000005', 'DAB0000013'),
        ('O000000021', 'OP', '2012-02-12', 0.56, 0.72, 'BB00000006', 'DAB0000013'),
        ('O000000022', 'OP', '2013-02-12', 0.13, 0.12, 'BB00000007', 'DAB0000013'),
        ('O000000023', 'OP', '2014-02-12', 0.45, 0.25, 'BB00000008', 'DAB0000013'),
        ('O000000024', 'OP', '2015-02-12', 0.56, 0.17, 'BB00000009', 'DAB0000013'),
        ('O000000025', 'OP', '2016-02-12', 0.9, 0.45, 'BB00000010', 'DAB0000013'),
        ('O000000026', 'OP', '2017-02-12', 0.9, 0.24, 'BB00000010', 'DAB0000013'),
        ('O000000027', 'OP', '2018-02-12', 0.9, 0.67, 'BB00000010', 'DAB0000013'),
        ('O000000028', 'OP', '2019-02-12', 0.5, 0.19, 'BB00000010', 'DAB0000013'),
        ('O000000029', 'OP', '2020-02-03', 0.3, 0.2, 'BB00000001', 'DAB0000012'),
        ('O000000030', 'OP', '2020-02-04', 0.3, 0.3, 'BB00000002', 'DAB0000012'),
        ('O000000031', 'OP', '2020-02-05', 0.3, 0.17, 'BB00000003', 'DAB0000012'),
        ('O000000032', 'OP', '2020-02-06', 0.3, 0.12, 'BB00000004', 'DAB0000012'),
        ('O000000033', 'OP', '2020-02-07', 0.3, 0.02, 'BB00000005', 'DAB0000012'),
        ('O000000034', 'OP', '2020-02-08', 0.3, 0.03, 'BB00000006', 'DAB0000012'),
        ('O000000035', 'OP', '2020-02-09', 0.3, 0.08, 'BB00000007', 'DAB0000012'),
        ('O000000036', 'OP', '2020-02-10', 0.3, 0.14, 'BB00000008', 'DAB0000012'),
        ('O000000037', 'OP', '2020-02-11', 0.3, 0.17, 'BB00000009', 'DAB0000012'),
        ('O000000038', 'OP', '2020-02-12', 0.3, 0.12, 'BB00000010', 'DAB0000012');

INSERT INTO Equipment(EquipmentID, Quantity, Cost, EquipmentName, BloodBankID)
VALUES  ('E000000001', 32, 1.99, 'Syringe', 'BB00000005'),
        ('E000000002', 99, 0.99, 'Pouches', 'BB00000005'),
        ('E000000003', 53, 0.55, 'Sterilizer', 'BB00000005'),
        ('E000000004', 25, 1.49, 'Gloves', 'BB00000005'),
        ('E000000005', 17, 0.30, 'Bandage', 'BB00000001'),
	('E000000006', 0, 0.85, 'Sticker Sheets - Ponies', 'BB00000002'),
	('E000000007', 0, 0.85, 'Sticker Sheets - Super Heros', 'BB00000004'),
	('E000000008', 0, 59.99, 'Blood Freezer', 'BB00000004');

INSERT INTO BloodOrder(OrderID, BloodType, Quantity, OrderDate, OrderStatus, BloodBankID, HospitalID)
VALUES  ('O000000001', 'A', 12, '2021-03-03', 'In-Process', 'BB00000005', 'H000000001'),
        ('O000000002', 'B', 10, '2021-03-02', 'Complete', 'BB00000005', 'H000000001'),
        ('O000000003', 'AB', 3, '2021-03-01', 'Complete', 'BB00000005', 'H000000002'),
        ('O000000004', 'AB', 2, '2021-02-28', 'Complete', 'BB00000005', 'H000000002'),
        ('O000000005', 'OP', 3, '2021-02-27', 'Complete', 'BB00000005', 'H000000003'),
        ('O000000006', 'A', 19, '2021-02-27', 'Complete', 'BB00000001', 'H000000004'),
        ('O000000007', 'AB', 17, '2021-02-26', 'Complete', 'BB00000002', 'H000000004'),
        ('O000000008', 'O', 6, '2021-02-25', 'Complete', 'BB00000003', 'H000000004'),
        ('O000000009', 'B', 24, '2021-02-24', 'Complete', 'BB00000004', 'H000000004'),
        ('O000000010', 'AB', 49, '2021-02-23', 'Complete', 'BB00000006', 'H000000004'),
        ('O000000011', 'AB', 32, '2021-02-22', 'Complete', 'BB00000007', 'H000000010'),
        ('O000000012', 'AB', 1, '2021-02-21', 'Cancelled', 'BB00000007', 'H000000008'),
        ('O000000013', 'AB', 4, '2021-02-20', 'Cancelled', 'BB00000007', 'H000000009');

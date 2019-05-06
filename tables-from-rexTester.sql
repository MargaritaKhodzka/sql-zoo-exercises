CREATE TABLE Owners ( ID INT IDENTITY(1,1) , Name VARCHAR(50) )
CREATE TABLE Manufacturer ( ID INT IDENTITY(1,1) , Name VARCHAR(255) )
CREATE TABLE VehicleType ( ID INT IDENTITY(1,1) , Name VARCHAR(255) )
CREATE TABLE Models ( ID INT IDENTITY(1,1) , ManufacturerID INT , VehicleTypeID INT , Name VARCHAR(255) , MSRP MONEY )
CREATE TABLE Vehicles ( ID INT IDENTITY(1,1) , OwnerID INT , ModelID INT , Mileage INT , LastService DATETIME , PurchaseDate DATETIME , PurchasePrice MONEY )
INSERT INTO Owners (Name)
VALUES ('Brenda'), ('Fred'), ('George'), ('Kevin'), ('Lily'), ('Sue'), ('Zach')
INSERT INTO Manufacturer (Name)
VALUES ('Ford') , ('Toyota'), ('Honda'), ('BMW')
INSERT INTO VehicleType (Name)
VALUES ('Sedan'), ('Coup'), ('Truck'), ('SUV'), ('Motorcycle')
INSERT INTO Models ( ManufacturerID, VehicleTypeID, Name, MSRP )
VALUES
( 1, 1, 'Taurus' , 27595),
( 1, 1, 'Focus' , 17860),
( 1, 2, 'Mustang' , 25585),
( 1, 4, 'Escape' , 23850),
( 1, 4, 'Explorer' , 31990),
( 1, 3, 'F-150' , 27610),
( 2, 1, 'Yaris' , 15635),
( 2, 1, 'Camry' , 23495),
( 2, 2, '86' , 26255),
( 2, 3, 'Tacoma' , 25200),
( 2, 4, 'RAV4' , 24510) ,
( 2, 4, 'Highlander', 31030) ,
( 3, 1, 'Accord' , 23570) ,
( 3, 2, 'Accord' , 24125) ,
( 3, 1, 'Civic' , 18840) ,
( 3, 2, 'Civic Si' , 24100) ,
( 3, 3, 'Ridgeline' , 29730) ,
( 3, 5, 'Gold Wing' , 23500) ,
( 3, 5, 'Rebel 500' , 6099) ,
( 3, 5, 'CBR600RR' , 11799) ,
( 4, 1, '3' , 34900) ,
( 4, 1, '7' , 83100) ,
( 4, 2, 'M3' , 54500) ,
( 4, 2, 'Z4' , 49700) ,
( 4, 4, 'X' , 33900) ,
( 4, 5, 'R NINE T' , 15495) ,
( 4, 5, 'S 1000 RR' , 15995)
INSERT INTO Vehicles( OwnerID, ModelID, Mileage, LastService, PurchaseDate, PurchasePrice)
VALUES
( 1, 1 , 137895 , '01/15/2018' , '06/15/2006' , 25000) ,
( 1, 24 , 10000 , '01/01/2017' , '12/20/2014' , 45000) ,
( 2, 8 , 66785 , '12/10/2017' , '08/15/2008' , 27595) ,
( 3, 12 , 40000 , '07/18/2017' , '05/19/2009' , 33000) ,
( 3, 19 , 25000 , '08/12/2017' , '05/19/2012' , 6500) ,
( 4, 18 , 122573 , '01/19/2018' , '07/01/2010' , 22500) ,
( 5, 7 , 67081 , '11/30/2017' , '10/15/2013' , 15300) ,
( 6, 10 , 85000 , '09/15/2017' , '02/18/2009' , 25000)

-- How many vehicle models per manufacturer?

SELECT Manufacturer.Name AS 'Manufacturer', COUNT(Models.name) AS 'no. of models'
FROM Manufacturer JOIN Models ON (Manufacturer.id = Models.ManufacturerID)
GROUP BY Manufacturer.Name;

-- Per Vehicle Type?

SELECT VehicleType.Name AS 'Vehicle Type', COUNT(Models.name) AS 'no. of models'
FROM VehicleType JOIN Models ON (VehicleType.id = Models.VehicleTypeID)
GROUP BY VehicleType.Name;

-- How many cars does each owner possess?

SELECT Owners.name AS 'Owner', COUNT (Vehicles.id) AS 'no. of vehicles'
FROM Owners JOIN Vehicles ON (Owners.id = Vehicles.OwnerID)
GROUP BY Owners.name;

-- How many total miles are logged to each owner?
SELECT Owners.name AS 'Owner', SUM(Vehicles.Mileage) AS 'miles logged'
FROM Owners JOIN Vehicles ON (Owners.id = Vehicles.OwnerID)
GROUP BY Owners.name;

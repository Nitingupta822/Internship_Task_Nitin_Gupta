create database ola;
use ola;

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    City VARCHAR(50) NOT NULL,
    VehicleType VARCHAR(20) NOT NULL,
    Rating DECIMAL(2, 1) CHECK (Rating BETWEEN 0 AND 5)
);

CREATE TABLE Riders (
    RiderID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    City VARCHAR(50) NOT NULL,
    JoinDate DATE NOT NULL
);

CREATE TABLE Rides (
    RideID INT PRIMARY KEY,
    RiderID INT NOT NULL,
    DriverID INT NOT NULL,
    RideDate DATETIME NOT NULL,
    PickupLocation VARCHAR(255) NOT NULL,
    DropLocation VARCHAR(255) NOT NULL,
    Distance DECIMAL(5, 2) NOT NULL,
    Fare DECIMAL(10, 2) NOT NULL,
    RideStatus ENUM('Completed', 'Cancelled', 'Ongoing') NOT NULL,
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    RideID INT NOT NULL,
    PaymentMethod ENUM('Card', 'Cash', 'Wallet') NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATETIME NOT NULL,
    FOREIGN KEY (RideID) REFERENCES Rides(RideID)
);

INSERT INTO Drivers (DriverID, FirstName, LastName, Phone, City, VehicleType, Rating) VALUES
(1,'Nitin', 'Gupta', '9834567890', 'Rewa', 'Sedan', 4.7),
(2,'Vineet', 'Gupta', '9734567891', 'Indor', 'SUV', 4.8),
(3,'Rahul', 'Shing', '9934567892', 'Bhopal', 'Hatchback', 4.3),
(4,'Ritesh', 'Mishra', '9634567893', 'Jablpure', 'Sedan', 4.9),
(5,'Udit', 'Varma', '8634567894', 'Satan', 'SUV', 4.4),
(6,'Mohit', 'Jain', '9534567895', 'Rewa', 'Hatchback', 4.6),
(7,'Sandeep', 'Gupta', '9434567896', 'Indore', 'Sedan', 4.2),
(8,'Krish', 'Mishra', '9334567897', 'Bhopal', 'SUV', 4.5),
(9,'Prayansh', 'Agrawal', '9234567898', 'Satan', 'Hatchback', 4.1),
(10,'Raj', 'Gupta', '9134567899', 'Jablpure', 'Sedan', 4.8);

INSERT INTO Riders (RiderID, FirstName, LastName, Phone, City, JoinDate) VALUES
(1,'Aman', 'Panday', '2234567890', 'Rewa', '2024-01-01'),
(2,'Bipen', 'Gupta', '2234567891', 'Rewa', '2024-02-01'),
(3,'Ajay', 'Panday', '2234567892', 'Indor', '2024-03-01'),
(4,'Satym', 'Agrawa1', '2234567893', 'Indor', '2024-04-01'),
(5,'Rohit', 'Jain', '2234567894', 'Bhopal', '2024-05-01'),
(6,'Ram', 'Mishra', '2234567895', 'Bhopal', '2024-06-01'),
(7,'Mohan', 'Shing', '2234567896', 'Jablpure', '2024-07-01'),
(8,'Parth', 'Gupta', '2234567897', 'Jablpure', '2024-08-01'),
(9,'Ramesh', 'Patail', '2234567898', 'Satan', '2024-09-01'),
(10,'Shubham', 'Varma', '2234567899', 'Satan', '2024-10-01');

INSERT INTO Rides (RideID,RiderID, DriverID, RideDate, PickupLocation, DropLocation, Distance, Fare, RideStatus) VALUES
(1,1, 1, '2024-01-10 08:00:00', 'Location A', 'Location B', 15.2, 150.50, 'Completed'),
(2,2, 2, '2024-01-15 09:30:00', 'Location C', 'Location D', 10.5, 100.00, 'Completed'),
(3,3, 3, '2024-02-01 10:00:00', 'Location E', 'Location F', 20.0, 200.00, 'Cancelled'),
(4,4, 4, '2024-02-10 07:00:00', 'Location G', 'Location H', 25.0, 250.00, 'Completed'),
(5,5, 5, '2024-03-01 08:30:00', 'Location I', 'Location J', 18.0, 180.00, 'Completed'),
(6,6, 6, '2024-03-15 06:45:00', 'Location K', 'Location L', 12.5, 125.00, 'Ongoing'),
(7,7, 7, '2024-04-01 09:15:00', 'Location M', 'Location N', 30.0, 300.00, 'Completed'),
(8,8, 8, '2024-04-10 11:00:00', 'Location O', 'Location P', 8.0, 80.00, 'Completed'),
(9,9, 9, '2024-05-01 08:15:00', 'Location Q', 'Location R', 22.5, 225.00, 'Cancelled'),
(10,10, 10, '2024-05-15 10:30:00', 'Location S', 'Location T', 16.0, 160.00, 'Completed');

INSERT INTO Payments (PaymentID, RideID, PaymentMethod, Amount, PaymentDate) VALUES
(1,1, 'Card', 150.50, '2024-01-10 08:10:00'),
(2,2, 'Cash', 100.00, '2024-01-15 09:40:00'),
(3,4, 'Wallet', 250.00, '2024-02-10 07:10:00'),
(4,5, 'Card', 180.00, '2024-03-01 08:40:00'),
(6,7, 'Cash', 300.00, '2024-04-01 09:25:00'),
(7,8, 'Wallet', 80.00, '2024-04-10 11:10:00'),
(8,10, 'Card', 160.00, '2024-05-15 10:40:00'),
(9,6, 'Wallet', 125.00, '2024-03-15 06:50:00'),
(10,3, 'Cash', 200.00, '2024-02-01 10:10:00'),
(11,9, 'Card', 225.00, '2024-05-01 08:25:00');


-- 1. Retrieve the names and contact details of all drivers with a rating of 4.5 or higher.

SELECT FirstName, LastName, Phone, City
FROM Drivers
WHERE Rating >= 4.5;

-- 2. Find the total number of rides completed by each driver.

SELECT Drivers.DriverID, Drivers.FirstName, Drivers.LastName, COUNT(Rides.RideID) AS TotalCompletedRides
FROM Drivers
LEFT JOIN Rides ON Drivers.DriverID = Rides.DriverID
WHERE Rides.RideStatus = 'Completed'
GROUP BY Drivers.DriverID, Drivers.FirstName, Drivers.LastName;

-- 3. List all riders who have never booked a ride.

SELECT RiderID, FirstName, LastName, Phone
FROM Riders
WHERE RiderID NOT IN (SELECT DISTINCT RiderID FROM Rides);

-- 4. Calculate the total earnings of each driver from completed rides.

SELECT d.DriverID, d.FirstName, d.LastName, SUM(r.Fare) AS TotalEarnings
FROM Drivers d
JOIN Rides r ON d.DriverID = r.DriverID
WHERE r.RideStatus = 'Completed'
GROUP BY d.DriverID;

-- 5. Retrieve the most recent ride for each rider.

SELECT r.RiderID, MAX(r.RideDate) AS MostRecentRideDate
FROM Rides r
GROUP BY r.RiderID;

-- 6. Count the number of rides taken in each city.

SELECT City, COUNT(*) AS TotalRides
FROM Riders r
JOIN Rides rd ON r.RiderID = rd.RiderID
GROUP BY City;

-- 7. List all rides where the distance was greater than 20 km.

SELECT * FROM Rides
WHERE Distance > 20;

-- 8. Identify the most preferred payment method.

SELECT PaymentMethod, COUNT(*) AS UsageCount
FROM Payments
GROUP BY PaymentMethod
ORDER BY UsageCount DESC
LIMIT 1;

-- 9. Find the top 3 highest-earning drivers.

SELECT d.DriverID, d.FirstName, d.LastName, SUM(r.Fare) AS TotalEarnings
FROM Drivers d
JOIN Rides r ON d.DriverID = r.DriverID
WHERE r.RideStatus = 'Completed'
GROUP BY d.DriverID
ORDER BY TotalEarnings DESC
LIMIT 3;

-- 10.Retrieve details of all cancelled rides along with the rider's and driver's names.

SELECT r.RideID, r.RideDate, r.PickupLocation, r.DropLocation, r.Distance, 
rd.FirstName AS RiderFirstName, rd.LastName AS RiderLastName, 
d.FirstName AS DriverFirstName, d.LastName AS DriverLastName
FROM Rides r
JOIN Riders rd ON r.RiderID = rd.RiderID
JOIN Drivers d ON r.DriverID = d.DriverID
WHERE r.RideStatus = 'Cancelled';





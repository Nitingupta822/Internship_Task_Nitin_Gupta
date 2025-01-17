create database HR_Management;

use HR_Management;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    HireDate DATE,
    DepartmentID INT,
    ManagerID INT,
    Salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE PerformanceReviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    ReviewDate DATE,
    PerformanceScore ENUM('Excellent', 'Good', 'Average', 'Poor'),
    Comments TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Payroll (
    PayrollID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod ENUM('Bank Transfer', 'Check'),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

alter table Employees add FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

alter table Employees add FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID);

INSERT INTO Departments (DepartmentName, ManagerID) VALUES
('HR', NULL),
('Finance', NULL),
('IT', NULL),
('Marketing', NULL);

select * from Departments;

INSERT INTO Employees (FirstName, LastName, Email, Phone, HireDate, DepartmentID, ManagerID, Salary) VALUES
('Abhay', 'Gupta', 'abhay@gmail.com', '9134567890', '2023-02-01', 1, NULL, 50000),
('Bipeen', 'Mishra', 'bipeen@gmail.com', '9334567891', '2023-03-15', 2, 1, 55000),
('Cahal', 'Singh', 'chal@gmail.com', '9534567892', '2022-12-01', 3, 1, 60000),
('Dhruv', 'Patail', 'dhruv@gmail.com', '9734567893', '2023-05-21', 4, 2, 62000),
('Golu', 'Kusvaha', 'golu@gmail.com', '9934567894', '2021-10-10', 1, 3, 70000),
('Aman', 'Panday', 'aman@gmail.com', '9234567895', '2022-09-15', 2, 3, 48000),
('Garv', 'Jain', 'garv@gmail.com', '9434567896', '2020-05-11', 3, 4, 80000),
('Harsh', 'Ansari', 'harsh@gmail.com', '9634567897', '2021-08-19', 4, 5, 65000),
('Mohit', 'Shukala', 'mohit@gmail.com', '9834567898', '2023-04-01', 1, 6, 45000),
('Divay', 'Tamkar', 'divay@gmail.com', '9994567899', '2023-06-15', 2, 7, 52000);

select * from Employees;

INSERT INTO PerformanceReviews (EmployeeID, ReviewDate, PerformanceScore, Comments) VALUES
(1, '2023-06-01', 'Excellent', 'Great performance in the last quarter.'),
(2, '2023-06-15', 'Good', 'Solid work ethic.'),
(3, '2023-05-20', 'Average', 'Needs improvement in some areas.'),
(4, '2023-07-01', 'Excellent', 'Outstanding leadership.'),
(5, '2023-06-25', 'Good', 'Consistently good work.'),
(6, '2023-05-30', 'Poor', 'Requires substantial improvement.'),
(7, '2023-07-05', 'Excellent', 'Consistently exceeds expectations.'),
(8, '2023-06-10', 'Good', 'Positive contributions to the team.'),
(9, '2023-06-15', 'Average', 'Adequate performance.'),
(10, '2023-06-20', 'Excellent', 'Exceptional skill demonstration.');

select * from PerformanceReviews;

INSERT INTO Payroll (EmployeeID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2023-06-30', 5000, 'Bank Transfer'),
(2, '2023-06-30', 5500, 'Check'),
(3, '2023-06-30', 6000, 'Bank Transfer'),
(4, '2023-06-30', 6200, 'Bank Transfer'),
(5, '2023-06-30', 7000, 'Check'),
(6, '2023-06-30', 4800, 'Bank Transfer'),
(7, '2023-06-30', 8000, 'Check'),
(8, '2023-06-30', 6500, 'Bank Transfer'),
(9, '2023-06-30', 4500, 'Check'),
(10, '2023-06-30', 5200, 'Bank Transfer');

select * from Payroll;

-- 1. Retrieve names and contact details of employees hired after January 1, 2023.

SELECT FirstName, LastName, Email, Phone FROM Employees WHERE HireDate > '2023-01-01';

-- 2. Find the total payroll amount paid to each department.

SELECT d.DepartmentName, SUM(p.Amount) AS TotalPayroll
FROM Payroll p
JOIN Employees e ON p.EmployeeID = e.EmployeeID
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 3. List all employees who have not been assigned a manager.

SELECT FirstName, LastName FROM Employees WHERE ManagerID IS NULL;

-- 4. Retrieve the highest salary in each department along with the employee’s name.

SELECT d.DepartmentName, e.FirstName, e.LastName, e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (SELECT MAX(Salary) FROM Employees WHERE DepartmentID = d.DepartmentID);

-- 5. Find the most recent performance review for each employee.

SELECT e.FirstName, e.LastName, pr.ReviewDate, pr.PerformanceScore
FROM Employees e
JOIN PerformanceReviews pr ON e.EmployeeID = pr.EmployeeID
WHERE pr.ReviewDate = (SELECT MAX(ReviewDate) FROM PerformanceReviews WHERE EmployeeID = e.EmployeeID);

-- 6. Count the number of employees in each department.

SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 7. List all employees who have received a performance score of "Excellent."

SELECT e.FirstName, e.LastName
FROM Employees e
JOIN PerformanceReviews pr ON e.EmployeeID = pr.EmployeeID
WHERE pr.PerformanceScore = 'Excellent';

-- 8. Identify the most frequently used payment method in payroll.

SELECT PaymentMethod, COUNT(*) AS UsageCount
FROM Payroll
GROUP BY PaymentMethod
ORDER BY UsageCount DESC
LIMIT 1;

-- 9. Retrieve the top 5 highest-paid employees along with their departments.

SELECT e.FirstName, e.LastName, d.DepartmentName, e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
ORDER BY e.Salary DESC
LIMIT 5;

-- 10. Show details of all employees who report directly to a specific manager (e.g., ManagerID = 101).

SELECT FirstName, LastName, Email, Phone
FROM Employees
WHERE ManagerID = 10;



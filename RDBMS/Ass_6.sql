CREATE DATABASE DoctorPatientAppointment;

USE DoctorPatientAppointment;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE Specialties (
    specialty_id INT PRIMARY KEY,
    specialty_name VARCHAR(100)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    department_id INT,
    specialty_id INT,
    joining_date DATE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (specialty_id) REFERENCES Specialties(specialty_id)
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    date_of_birth DATE,
    gender VARCHAR(10),
    address TEXT
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    appointment_date DATETIME,
    reason TEXT,
    status VARCHAR(20),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    appointment_id INT,
    payment_date DATE,
    payment_amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

INSERT INTO Departments VALUES
(1, 'Cardiology'),
(2, 'Dermatology'),
(3, 'Neurology'),
(4, 'Orthopedics'),
(5, 'Pediatrics'),
(6, 'Psychiatry'),
(7, 'Radiology'),
(8, 'Oncology'),
(9, 'Endocrinology'),
(10, 'Gastroenterology');

select * from Departments;

INSERT INTO Specialties VALUES
(1, 'Cardiology'),
(2, 'Dermatology'),
(3, 'Neurology'),
(4, 'Orthopedics'),
(5, 'Pediatrics'),
(6, 'Psychiatry'),
(7, 'Radiology'),
(8, 'Oncology'),
(9, 'Endocrinology'),
(10, 'Gastroenterology');

select * from Specialties;

INSERT INTO Doctors VALUES
(1, 'Rajesh', 'Sharma', 'rajesh.sharma@gmail.com', '9123456789', 1, 1, '2020-01-10'),
(2, 'Aditi', 'Singh', 'aditi.singh@gmail.com', '9923456790', 2, 2, '2019-05-15'),
(3, 'Kiran', 'Patel', 'kiran.patel@gmail.com', '9723456791', 3, 3, '2021-02-20'),
(4, 'Suresh', 'Reddy', 'suresh.reddy@gmail.com', '9523455792', 4, 4, '2020-09-12'),
(5, 'Anjali', 'Mehta', 'anjali.mehta@gmail.com', '9623456793', 5, 5, '2018-11-25'),
(6, 'Vikram', 'Desai', 'vikram.desai@gmail.com', '9423356794', 6, 6, '2022-03-08'),
(7, 'Priya', 'Iyer', 'priya.iyer@gmail.com', '9223456795', 7, 7, '2021-06-30'),
(8, 'Amit', 'Chopra', 'amit.chopra@gmail.com', '9323456796', 8, 8, '2017-07-14'),
(9, 'Sneha', 'Nair', 'sneha.nair@gmail.com', '9663456797', 9, 9, '2022-01-03'),
(10, 'Rahul', 'Kumar', 'rahul.kumar@gmail.com', '9763456798', 10, 10, '2019-12-19');

select * from Doctors;

INSERT INTO Patients VALUES
(1, 'Arjun', 'Gupta', 'arjun.gupta@gmail.com', '9816543210', '2024-05-10', 'Male', 'Mumbai'),
(2, 'Neha', 'Agarwal', 'neha.agarwal@gmail.com', '9176543211', '2024-03-25', 'Female', 'Delhi'),
(3, 'Manish', 'Verma', 'manish.verma@gmail.com', '9276543212', '1988-07-15', 'Male', 'Bangalore'),
(4, 'Pooja', 'Jain', 'pooja.jain@gmail.com', '9376543213', '2025-01-20', 'Female', 'Hyderabad'),
(5, 'Rohan', 'Malhotra', 'rohan.malhotra@gmail.com', '9476543214', '2025-11-05', 'Male', 'Chennai'),
(6, 'Snehal', 'Kulkarni', 'snehal.kulkarni@gmail.com', '9676543215', '2024-12-12', 'Female', 'Pune'),
(7, 'Ankit', 'Saxena', 'ankit.saxena@gmail.com', '9776543216', '2024-04-30', 'Male', 'Kolkata'),
(8, 'Ritu', 'Bhatia', 'ritu.bhatia@gmail.com', '9876543217', '2024-08-22', 'Female', 'Ahmedabad'),
(9, 'Vivek', 'Mishra', 'vivek.mishra@gmail.com', '9976543218', '2024-09-10', 'Male', 'Jaipur'),
(10, 'Kavita', 'Roy', 'kavita.roy@gmail.com', '9766543219', '2023-06-18', 'Female', 'Lucknow');

select * from Patients;

INSERT INTO Appointments VALUES
(1, 1, 1, '2025-01-20 10:00:00', 'Routine Checkup', 'Scheduled'),
(2, 2, 2, '2025-01-21 11:00:00', 'Skin Allergy', 'Completed'),
(3, 3, 3, '2025-01-22 12:30:00', 'Headache', 'Cancelled'),
(4, 4, 4, '2025-01-23 09:00:00', 'Fracture Follow-up', 'Scheduled'),
(5, 5, 5, '2025-01-24 15:00:00', 'Child Vaccination', 'Completed'),
(6, 6, 6, '2025-01-25 14:00:00', 'Stress Consultation', 'Cancelled'),
(7, 7, 7, '2025-01-26 13:30:00', 'MRI Scan', 'Scheduled'),
(8, 8, 8, '2025-01-27 16:00:00', 'Cancer Follow-up', 'Completed'),
(9, 9, 9, '2025-01-28 17:30:00', 'Diabetes Check', 'Cancelled'),
(10, 10, 10, '2025-01-29 10:30:00', 'Stomach Pain', 'Scheduled');

select * from Appointments;

INSERT INTO Payments VALUES
(1, 2, '2025-01-21', 1500.00, 'Credit Card'),
(2, 5, '2025-01-24', 2000.00, 'Cash'),
(3, 8, '2025-01-27', 3000.00, 'Insurance');

select * from Payments;

-- 1. Find the Total Number of Appointments for Each Doctor

SELECT doctor_id, COUNT(*) AS total_appointments
FROM Appointments
GROUP BY doctor_id;


-- 2. List All Patients Who Have an Appointment with a Specific Doctor (e.g., Dr. John Smith)

SELECT P.*
FROM Patients P
JOIN Appointments A ON P.patient_id = A.patient_id
JOIN Doctors D ON A.doctor_id = D.doctor_id
WHERE D.first_name = 'John' AND D.last_name = 'Smith';

-- 3. Find the Number of Appointments Scheduled in a Specific Department

SELECT D.department_name, COUNT(*) AS total_appointments
FROM Appointments A
JOIN Doctors Doc ON A.doctor_id = Doc.doctor_id
JOIN Departments D ON Doc.department_id = D.department_id
WHERE D.department_name = 'Cardiology'
GROUP BY D.department_name;

-- 4. Find the Most Popular Specialty Based on Number of Appointments

SELECT top 1 S.specialty_name, COUNT(*) AS total_appointments
FROM Appointments A
JOIN Doctors Doc ON A.doctor_id = Doc.doctor_id
JOIN Specialties S ON Doc.specialty_id = S.specialty_id
GROUP BY S.specialty_name
ORDER BY total_appointments DESC;

-- 5. Get the Total Payment Amount for All Completed Appointments

SELECT SUM(P.payment_amount) AS total_payment
FROM Payments P
JOIN Appointments A ON P.appointment_id = A.appointment_id
WHERE A.status = 'Completed';

-- 6. Find the Number of Patients Seen by Each Doctor

SELECT doctor_id, COUNT(DISTINCT patient_id) AS total_patients
FROM Appointments
GROUP BY doctor_id;

-- 7. List All Patients Who Have Missed Their Appointments (Status 'Cancelled')

SELECT P.*
FROM Patients P
JOIN Appointments A ON P.patient_id = A.patient_id
WHERE A.status = 'Cancelled';

-- 8. Find the Total Number of Appointments for Each Status (Scheduled, Completed, Cancelled)

SELECT status, COUNT(*) AS total_appointments
FROM Appointments
GROUP BY status;

-- 9. Get the Average Payment Amount for Completed Appointments

SELECT AVG(P.payment_amount) AS average_payment
FROM Payments P
JOIN Appointments A ON P.appointment_id = A.appointment_id
WHERE A.status = 'Completed';

-- 10. Find the Doctor with the Highest Number of Appointments

SELECT top 1 doctor_id, COUNT(*) AS total_appointments
FROM Appointments
GROUP BY doctor_id
ORDER BY total_appointments DESC;

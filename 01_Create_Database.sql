CREATE DATABASE IF NOT EXISTS Hr_Analytics_DB;
USE Hr_Analytics_DB;
CREATE TABLE Departments(
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);
CREATE TABLE Cities(
CityID INT PRIMARY KEY,
CityName VARCHAR(50)
);
CREATE TABLE Education(
EducationID INT PRIMARY KEY,
Education VARCHAR(30)
);
CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Gender ENUM('Male','Female'),
DepartmentID INT,
CityID INT,
EducationID INT,
Salary DECIMAL(10,2),
Experience INT,
HireDate DATE,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
FOREIGN KEY (CityID) REFERENCES Cities(CityID),
FOREIGN KEY (EducationID) REFERENCES Education(EducationID) 
);
CREATE TABLE Performance(
PerformanceID INT PRIMARY KEY,
EmployeeID INT,
Rating TINYINT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
Attrition ENUM('Yes','No'),
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);



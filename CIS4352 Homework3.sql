-- Question 1
CREATE TABLE Employee(
EmpID INT NOT NULL IDENTITY(1001,1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Address NVARCHAR(60) NOT NULL,
City NVARCHAR(30) NOT NULL,
State CHAR(5) NOT NULL,
Zip VARCHAR(5) NULL,
PayRate DECIMAL(19,4) NOT NULL,
PRIMARY KEY (EmpID)
); 

-- Question 2
CREATE TABLE Department(
DeptID INT NOT NULL IDENTITY(10,1),
DeptName NVARCHAR(50) NOT NULL,
Building NVARCHAR(50) NOT  NULL,
Supervisor NVARCHAR(50) NOT NULL,
SupervisorID INT NOT NULL,
);

-- Question 3
ALTER TABLE Department
ADD FOREIGN KEY (SupervisorID) REFERENCES Employee (EmpID);

-- Question 4
ALTER TABLE Department
ADD CONSTRAINT Dept_Id PRIMARY KEY (DeptID);

-- Question 5
ALTER TABLE Employee
ADD CONSTRAINT check_payRate CHECK (PayRate > 0);

-- Question 6
ALTER TABLE Employee
NOCHECK CONSTRAINT check_payRate;

-- Question 7
ALTER TABLE Department
DROP CONSTRAINT FK__Departmen__Super__267ABA7A; --Constraint name given by default


-- Question 8
INSERT INTO Employee
(FirstName, LastName, Address, City, State, Zip, PayRate, DeptID)
VALUES
('John', 'Doe', '123 Any Street', 'Any Town', 'TX', '76549', 8.75, 11),
('Jane', 'Doe', '666 Devil''s Way', 'Diablo', 'NM', '12345', 6.66, 12),
('Sally', 'Green', '345 North St', 'Killeen', 'TX', '76544', 22.34, 12),
('Bob', 'Jones', '567 South St', 'Killeen', 'TX', '', 14.00, 10);
INSERT INTO Department
(DeptName, Building, Supervisor, SupervisorID)
VALUES 
('Sales', 'Main', 'Bob Jones', 1004),
('Engineering', 'South', 'Kali Smith', 1005),
('Admin', 'Main', 'Bob Roberts', 1006),
('Finance', 'South', 'Ebenezer Scrooge', 1007);

-- Question 9
SELECT FirstName, LastName, PayRate
FROM Employee
WHERE PayRate = 
(SELECT MIN(PayRate)
FROM Employee);

-- Question 10
SELECT DeptID, DeptName, Supervisor
FROM Department
WHERE DeptID NOT IN
(Select DeptID
FROM Employee);

-- Question 11
SELECT DeptID, DeptName, (
SELECT MIN(Employee.PayRate)
FROM Employee
WHERE Employee.DeptID = Department.DeptID
)
AS MinPayRate
FROM Department;

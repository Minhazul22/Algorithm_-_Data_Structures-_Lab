Create database company;
use company;


-- Create Department table
CREATE TABLE Department (
    Dname VARCHAR(255),
    Dnumber INT PRIMARY KEY,
    Mgr_ssn CHAR(9),
    Mgr_start_date DATE
);

-- Create Employee table
CREATE TABLE Employee (
    Fname VARCHAR(255),
    Minit CHAR(1),
    Lname VARCHAR(255),
    Ssn CHAR(9) PRIMARY KEY,
    Bdate DATE,
    Address VARCHAR(255),
    SEX CHAR(1),
    Salary DECIMAL(10,2),
    Super_Ssn CHAR(9),
    Dnumber INT
);

-- Create Project table
CREATE TABLE Project (
    Pname VARCHAR(255),
    Pnumber INT PRIMARY KEY,
    Plocation VARCHAR(255),
    Dnumber INT
);

-- Create Department_locations table
CREATE TABLE Department_locations (
    Dnumber INT,
    Dlocation VARCHAR(255),
    PRIMARY KEY (Dnumber, Dlocation)
);

-- Create Works_on table
CREATE TABLE Works_on (
    Essn CHAR(9),
    Pnumber INT,
    Hours DECIMAL(4,2),
    PRIMARY KEY (Essn, Pnumber)
);

-- Create Dependent table
CREATE TABLE Dependent (
    Essn CHAR(9),
    Dependent_name VARCHAR(255),
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(255),
    PRIMARY KEY (Essn, Dependent_name)
);

-- Add foreign key constraints

ALTER TABLE Employee ADD FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber);

ALTER TABLE Department ADD FOREIGN KEY (Mgr_ssn) REFERENCES Employee(Ssn);

ALTER TABLE Project ADD FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber);

ALTER TABLE Department_locations ADD FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber);

ALTER TABLE Works_on ADD FOREIGN KEY (Essn) REFERENCES Employee(Ssn),
                       ADD FOREIGN KEY (Pnumber) REFERENCES Project(Pnumber);

ALTER TABLE Dependent ADD FOREIGN KEY (Essn) REFERENCES Employee(Ssn);


-- task 3.1
SELECT Lname, Fname 
FROM Employee AS E 
JOIN Works_on AS W ON E.Ssn = W.Essn 
WHERE E.Dnumber = 5 AND W.Hours > 10;

-- 3.2

Select fName from employee as e
join dependent as d on e.ssn = d.essn
where e.fname = d.dependent_name;


Create database shipping_company;

USE shipping_company;

CREATE TABLE Harbour
  (harbourID INT NOT NULL,
   location VARCHAR(32) NOT NULL,
   establishedIn date,
   PRIMARY KEY (harbourID) ); 
   
CREATE TABLE Sailor
  (sailorID INT NOT NULL,
   lastName VARCHAR(32),
   dob date,
   trainedAt INT,
   primary key (sailorID),
   foreign key (trainedAT) references Harbour(harbourID));

CREATE TABLE Ship
  (shipID INT NOT NULL,
   name VARCHAR(32),
   grossWeight INT,
   launchDate date,
   baseHarbour INT,
   primary key (shipID),
   foreign key (baseHarbour) references Harbour(harbourID));
   
CREATE TABLE hire
  (sailorID INT NOT NULL,
  shipID INT NOT NULL,
   startOfService date,
   annualSalary INT,
   primary key (sailorID, shipID),
   foreign key (sailorID) references Sailor(sailorID),
   foreign key (shipID) references ship(shipID));


INSERT INTO Harbour
VALUES ( 123, 'Hamburg','1189-01-01'); 

INSERT INTO Harbour
VALUES ( 234, 'Amsterdam','1200-01-01'); 

INSERT INTO Harbour
VALUES ( 345, 'Rotterdam','1898-01-01');

INSERT INTO Sailor
VALUES ( 12, 'Meyer','2002-02-03', 123);

INSERT INTO Sailor
VALUES ( 13, 'Smith','2005-02-03', 123);

INSERT INTO Sailor
VALUES ( 14, 'Jones','2012-02-08', 123);

INSERT INTO Sailor
VALUES ( 18, 'James','2015-02-08', 123);

INSERT INTO Sailor
VALUES ( 15, 'Ranger','2022-02-03', 234);

-- Weight in weight ton
INSERT INTO Ship
VALUES ( 45, 'Ship1',53.800, '2007-02-03',  123);

INSERT INTO Ship
VALUES ( 46, 'Ship2',55.800, '2015-02-03',  123);

INSERT INTO Ship
VALUES ( 47, 'Ship3',51.800, '2018-08-03',  234);

INSERT INTO Hire
VALUES ( 12, 45, '2010-08-03',  45000);

INSERT INTO Hire
VALUES ( 13, 45, '2012-08-03',  47000);

INSERT INTO Hire
VALUES ( 14, 45, '2012-08-03',  42000);

INSERT INTO Hire
VALUES ( 15, 47, '2012-08-03',  41000);

INSERT INTO Hire
VALUES ( 18, 46, '2011-08-03',  40500);

select * from hire;
-- task 2.1

Select dob from sailor as s
join hire as h on s.sailorid = h.sailorID
where startofservice = '2012-08-03'
order by dob desc;


USE shipping_company;


-- task 2.2

SELECT * FROM sailor AS s
JOIN hire AS h ON s.sailorID = h.sailorID
WHERE h.startOfService BETWEEN '2011-07-03' AND '2012-09-03'
AND lastName LIKE '%j';

-- task 2.3

SELECT s.shipID, s.name, sum(h.annualSalary) AS total_annual_salary FROM ship as s
JOIN hire as h on s.shipID = h.shipID 
GROUP BY s.shipID;

-- task 2.4
  SELECT s.shipID, s.name, count(h.sailorID) as number_of_sailors FROM ship as s
  JOIN hire as h on s.shipID = h.shipID where h.annualSalary <= '42000'
  GROUP BY s.shipID, s.name;

-- task 2.5
SELECT DISTINCT h1.location
FROM SHIP s1, SHIP s2, HARBOUR h1, HARBOUR h2
WHERE s1.baseHarbour = h1.harbourID
       AND s2.baseHarbour = h2.harbourID
       AND s1.launchDate = s2.launchDate
       AND h1.location = h2.location
       AND h1.harbourID != h2.harbourID ;
	

 

CREATE database COMPANY;
USE Company;
Drop database company;



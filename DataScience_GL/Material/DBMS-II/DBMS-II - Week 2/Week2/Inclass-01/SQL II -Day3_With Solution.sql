# Datasets used: AirlineDetails.csv, passengers.csv and senior_citizen.csv

-- -----------------------------------------------------
-- Schema Airlines
-- -----------------------------------------------------
USE InClass;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Create a table Airline_Details. Follow the instructions given below: 
-- -- Q1. Values in the columns Flight_ID should not be null.
-- -- Q2. Each name of the airline should be unique.
-- -- Q3. No country other than United Kingdom, USA, India, Canada and Singapore should be accepted
-- -- Q4. Assign primary key to Flight_ID
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Table Airline_Details
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Airline_Details (
  Flight_ID INT NOT NULL,
  Airline VARCHAR(100) NULL UNIQUE,
  Country VARCHAR(50) NULL CHECK (Country IN ('United Kingdom', 'USA', 'India', 'Canada', 'Singapore')),
  Punctuality FLOAT NULL,
  Service_Quality FLOAT NULL,
  AirHelp_Score FLOAT NULL,
  PRIMARY KEY (Flight_ID)
);

SELECT * FROM Airline_Details;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. Create a table Passengers. Follow the instructions given below: 
-- -- Q1. Values in the columns Traveller_ID and PNR should not be null.
-- -- Q2. Only passengers having age greater than 18 are allowed.
-- -- Q3. Assign primary key to Traveller_ID
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Table Passengers
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Passengers (
  Traveller_ID VARCHAR(5) NOT NULL,
  Name VARCHAR(50) NULL,
  PNR VARCHAR(10) NOT NULL,
  Flight_ID INT NULL,
  Ticket_Price INT NULL,
  age int check (age>18),
  PRIMARY KEY (Traveller_ID)
);

SELECT * FROM PASSENGERS;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- Questions for table Passengers:  
-- -- Q3. PNR status should be unique and should not be null.
-- -- Q4. Flight Id should not be null.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

# 3.
ALTER TABLE Passengers MODIFY PNR VARCHAR(10) NOT NULL UNIQUE;
# 4.
ALTER TABLE Passengers MODIFY Flight_ID INT NOT NULL;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Create a table Senior_Citizen_Details. Follow the instructions given below: 
-- -- Q1. Column Traveller_ID should not contain any null value.
-- -- Q2. Assign primary key to Traveller_ID
-- -- Q3. Assign foreign key constraint on Traveller_ID such that if any row from passenger table is updated, then the Senior_Citizen_Details table should also get updated.
-- -- --  Also deletion of any row from passenger table should not be allowed.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Table Senior_Citizen_Details
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Senior_Citizen_Details (
  Traveller_ID VARCHAR(5) NOT NULL,
  Senior_Citizen VARCHAR(5) NULL,
  Discounted_Price VARCHAR(20) NULL,
  PRIMARY KEY (Traveller_ID),
  CONSTRAINT fk_Passenger_Senior_Citizen
    FOREIGN KEY (Traveller_ID)
    REFERENCES Passengers(Traveller_ID)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

SELECT * FROM SENIOR_CITIZEN_details;
SELECT CONSTRAINT_NAME,
       UNIQUE_CONSTRAINT_NAME, 
       MATCH_OPTION, 
       UPDATE_RULE,
       DELETE_RULE,
       TABLE_NAME,
       REFERENCED_TABLE_NAME
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'InClass';
-- --------------------------------------------------------------------------------------------------------------------------------------------------- 
-- -- Q6. Create a new column Age in Passengers table that takes values greater than 18. 

-- -- Note: Airlines service is providing a 10% discount on ticket price.
-- -- Q7. Create a trigger such that when the value is entered in the column Age, 
-- -- -- - if age is greater than 60 then, 
-- -- -- -- -- The value in Senior citizen column from the table SENIOR_CITIZEN_DETAILS should be updated to 'YES'otherwise 'NO'.
-- -- -- -- -- The discounted price should get reflected in the column Discounted_Price in the SENIOR_CITIZEN_DETAILS table.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

# 6 *****************************************************************************
ALTER TABLE Passengers
	ADD COLUMN Age INT CHECK (AGE > 18);
    
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 7. Create a table books. Follow the instructions given below: 
-- -- Columns: books_no, description, author_name, cost
-- -- Qa. The cost should not be less than or equal to 0.
-- -- Qb. The cost column should not be null.
-- -- Qc. Assign a primary key to the column books_no.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE books (
    books_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(250),
    author VARCHAR(250),
    cost DECIMAL(10, 2) NOT NULL 
    CHECK (cost > 0));


# Q8. Update the table 'books' such that the values in the columns 'description' and author' must be unique.
ALTER TABLE books
ADD CONSTRAINT new_desc1
UNIQUE (description, author);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 9. Create a table bike_sales. Follow the instructions given below: 
-- -- Columns: id, product, quantity, release_year, release_month
-- -- Q1. Assign a primary key to ID. Also the id should auto increment.
-- -- Q2. None of the columns should be left null.
-- -- Q3. The release_month should be between 1 and 12 (including the boundries i.e. 1 and 12).
-- -- Q4. The release_year should be between 2000 and 2010.
-- -- Q5. The quantity should be greater than 0.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE bike_sales (
id INT AUTO_INCREMENT,
product VARCHAR(100) NOT NULL,
quantity INT NOT NULL,
release_year INT NOT NULL,
release_month INT NOT NULL,
CHECK (release_month >=1 AND release_month <=12 ),
CHECK (release_year BETWEEN 2000 AND 2020),
CHECK (quantity > 0),
PRIMARY KEY(id));

-- --------------------------------------------------------------------------
-- Use the following comands to insert the values in the table bike_sales
INSERT INTO bike_sales VALUES('1','Pulsar','1','2001','7');
INSERT INTO bike_sales VALUES('2','yamaha','3','2002','3');
INSERT INTO bike_sales VALUES('3','Splender','2','2004','5');
INSERT INTO bike_sales VALUES('4','KTM','2','2003','1');
INSERT INTO bike_sales VALUES('5','Hero','1','2005','9');
INSERT INTO bike_sales VALUES('6','Royal Enfield','2','2001','3');
INSERT INTO bike_sales VALUES('7','Bullet','1','2005','7');
INSERT INTO bike_sales VALUES('8','Revolt RV400','2','2010','7');
INSERT INTO bike_sales VALUES('9','Jawa 42','1','2011','5');
-- --------------------------------------------------------------------------




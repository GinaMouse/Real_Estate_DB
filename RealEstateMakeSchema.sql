-- -----------------------------------------------------
-- Create Project 2 Real Estate Database
-- LGina Hall
-- -----------------------------------------------------

set sqlblanklines on
prompt Building sample real estate database.  Please wait ...

-- -----------------------------------------------------
-- Table 'Branch' -- branchID assigned by HQ
-- -----------------------------------------------------
CREATE TABLE Branch (
  branchId VARCHAR(5) NOT NULL, 
  location VARCHAR(45) NOT NULL,
-- -----------------------------------------------------
-- *** Keys *********************************************
-- -----------------------------------------------------
PRIMARY KEY(branchId)
);

-- -----------------------------------------------------
-- Values in Branch: 6 Test Values ---------------------
-- -----------------------------------------------------
insert into Branch VALUES ('1','South Austin');
insert into Branch VALUES ('2','Central Austin');
insert into Branch VALUES ('3','North Austin');
insert into Branch VALUES ('4','Round Rock');
insert into Branch VALUES ('5','San Jose');
insert into Branch VALUES ('6','Normal');



-- -----------------------------------------------------
-- Table 'Employee'
-- -----------------------------------------------------
CREATE TABLE Employee (
    empId     VARCHAR(5) NOT NULL,
    empName   VARCHAR(40) NOT NULL,
    empPhone  VARCHAR(10) NULL,
    empEmail  VARCHAR(40) NULL,
    empStart  DATE default CURRENT_TIMESTAMP,
    salaryMonth NUMERIC(9,2) NULL,
    branchId  VARCHAR(5),
-- -----------------------------------------------------
--*** Keys *********************************************
-- -----------------------------------------------------
PRIMARY KEY (empId),
FOREIGN KEY (branchId) REFERENCES Branch(branchId)
);

-- -----------------------------------------------------
-- Values in Employee: 6 Test Values -------------------
-- -----------------------------------------------------
insert into Employee (empId, empName, empPhone, empEmail, salaryMonth, branchId) 
VALUES ('101', 'Chandra Simms', '5127865607', 'chandrarealtor93@goldenseller.org', 57387.90, '1');

insert into Employee (empId, empName, empPhone, empEmail, salaryMonth, branchId) 
VALUES ('102', 'Gina Hall', '5124893456', 'gmh49@txstate.edu', 71893.11, '2');

insert into Employee (empId, empName, empPhone, empEmail, salaryMonth, branchId) 
VALUES ('103', 'Lyle Denman', '7849476355', 'yomamma@imgur.com', 58357.61, '3');

insert into Employee (empId, empName, empPhone, empEmail, salaryMonth, branchId) 
VALUES ('104', 'David Hill', '2115608736', 'rightknightly@gmail.com', 93939.39, '4');

insert into Employee (empId, empName, empPhone, empEmail, salaryMonth, branchId) 
VALUES ('105', 'Molly Manos', '3287469901', 'mollyesteryear@gmail.com', 110873.64, '5');

insert into Employee (empId, empName, empPhone, empEmail, salaryMonth, branchId) 
VALUES ('106', 'Nakia Soeharsono', '2187749502', 'dapperbrapper24@netscape.com', 274345.69, '6');


-- -----------------------------------------------------
-- Table 'Property'
-- -----------------------------------------------------
CREATE TABLE Property (
    propId      VARCHAR(5) NOT NULL,
    propType    VARCHAR(5) NULL,
    stAddress   VARCHAR(40) NULL,
    city        VARCHAR(30) NULL,
    stateInit   VARCHAR(2) NULL,
    zipCode     VARCHAR(5) NULL,
    nBed        NUMERIC(2,1) NULL,
    nBath       NUMERIC(2,1) NULL,
    sqFt        NUMERIC(6,2) NULL,
    dateListed  DATE default CURRENT_TIMESTAMP,
    branchId    VARCHAR(5),
-- -----------------------------------------------------
-- *** Keys ********************************************
-- -----------------------------------------------------
PRIMARY KEY (propId),
FOREIGN KEY (branchId) REFERENCES Branch(branchId)
);

-- -----------------------------------------------------
-- Values in Property: 15 Test Values ------------------
-- ------------------------------------------------------
INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2001', 'apt', '1203 N Pershing St APT A', 'Truth or Consequences', 'NM', '87901', '2', '2', 875, '1');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2002', 'apt', '122 Ridgeway Dr', 'San Marcos', 'TX', '78666', '4.5', '2', 1035, '2');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2003', 'house', '375 Copelyn Springs Rd', 'Washington', 'TX', '77880', '3', '2.5', 1902, '3');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2004', 'house', '639-641 35TH Ave', 'San Francisco', 'CA', '94121', '6', '4', 2790, '4');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2005', 'comm', '3045 Middlefield Rd', 'Palo Alto', 'CA', '94306', '3', '1', 1824, '5');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2006', 'comm', '1501 N Main', 'Normal', 'IL', '87901', '3', '2', 2650, '6');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2007', 'house', '101 Saturday Ln', 'Mooresville', 'NC', '28117', '4', '2', 1420, '1');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2008', 'apt', '3137 Cheyenne St', 'San Marcos', 'TX', '78666', '4', '3', 2035, '2');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2009', 'house', '3111 Oak Springs Rd', 'Pflugervegas', 'TX', '77880', '3', '1', 1350, '3');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2010', 'house', '101 DNA Ct', 'San Francisco', 'CA', '94121', '3', '3', 1222, '4');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2011', 'apt', '1999 Party Ln', 'Prince', 'CA', '94306', '4', '2', 2185, '5');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2012', 'comm', '2001 Space Odyssey St', 'Mars', 'TX', '87901', '5', '1', 2291, '6');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, nBed, nBath, sqFt, branchId)
VALUES ('2013', 'apt', '111 Royal Tenenbaum Square', 'Brooklyn', 'NY', '12123', '1', '1', 1990, '6');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, sqFt, branchId)
VALUES ('2014', 'comm', '777 Heaven Ave', 'Round Rock', 'TX', '78665', 2340, '5');

INSERT into Property(propId, propType, stAddress, city, stateInit, zipCode, sqFt, branchId)
VALUES ('2015', 'house', '666 Hades Way', 'Round Rock', 'TX', '78665', 1655, '4');


-- -- -----------------------------------------------------
-- Table 'Transaction'
-- -----------------------------------------------------
CREATE TABLE Transaction (
  transactionId VARCHAR(5) NOT NULL,
  commDeduct    NUMERIC(10,2) NULL,
  transDate     DATE default CURRENT_TIMESTAMP,
  transValue    NUMERIC(10,2) NULL,
  rentCollect   VARCHAR(45) NULL,
  repairSpent   VARCHAR(45) NULL,
-- -----------------------------------------------------
-- *** Keys ********************************************
-- -----------------------------------------------------
PRIMARY KEY (transactionId)
);

-- -----------------------------------------------------
-- Values in Transcation: 15 Test Values ------------------
-- ------------------------------------------------------
INSERT into Transaction(transactionId, commDeduct, transValue, rentCollect, repairSpent) 
VALUES ('9001', 0.00, 540.73, 600.00, 59.27);

INSERT into Transaction(transactionId, commDeduct, transValue, rentCollect, repairSpent) 
VALUES ('9002', 0.00, 600.00, 600.00, 0.00);

INSERT into Transaction(transactionId, commDeduct, transValue, rentCollect, repairSpent) 
VALUES ('9003', 0.00, 680.00, 700.00, 20.00);




-- -----------------------------------------------------
-- Table 'Inspection'
-- -----------------------------------------------------
CREATE TABLE Inspection (
  inspectionId  VARCHAR(5) NOT NULL,
  startTime     DATE default CURRENT_TIMESTAMP,
  endTime     DATE default CURRENT_TIMESTAMP,
  propId      VARCHAR(5) NOT NULL,
-- -----------------------------------------------------
-- *** Keys ********************************************
-- -----------------------------------------------------
PRIMARY KEY (inspectionId),
FOREIGN KEY (propID) REFERENCES Property(propID)
);

-- -----------------------------------------------------
-- Values in Inspection: 3 Test Values -------------------
-- -----------------------------------------------------
INSERT into Inspection(inspectionId, propID) VALUES ('TX256', 02001);

INSERT into Inspection(inspectionId, propID) VALUES ('CA298', 02008);

INSERT into Inspection(inspectionId, propID) VALUES ('IL564', 02017);




-- -----------------------------------------------------
-- Table "Advertisement'
-- -----------------------------------------------------
CREATE TABLE Advertisement (
  adId    VARCHAR(5) NOT NULL,
  content   VARCHAR(1500) NULL,
  price     NUMERIC(10,2) NULL,
  adDate    DATE default CURRENT_TIMESTAMP,
  location  VARCHAR(45) NULL,
  propId    VARCHAR(5) NOT NULL,
-- -----------------------------------------------------
-- *** Keys ********************************************
-- -----------------------------------------------------
PRIMARY KEY (adId),
FOREIGN KEY (propID) REFERENCES Property(propID)
);

-- -----------------------------------------------------
-- Values in Advertisement: 3 Test Values --------------
-- -----------------------------------------------------
INSERT into Advertisement (adId, content, price, location, propId) 
VALUES ('3001', 'This is a great house. This is the best house ever.', 219999.00, 'Austin Chronicle', '2001');
INSERT into Advertisement (adId, content, price, location, propId) 
VALUES ('3002', 'This apartment will get you laid.', 219999.00, 'Austin Chronicle', '2002');
INSERT into Advertisement (adId, content, price, location, propId) 
VALUES ('3003', 'Your mother-in-law will believe her daughter didn''t make a mistake marrying you.', 219999.00, 'Austin Chronicle', '2003');

-- -----------------------------------------------------
-- Table 'Client'
-- -----------------------------------------------------
CREATE TABLE Client ( 
  cId       VARCHAR(5) NOT NULL,
  cPhone  VARCHAR(10) NULL,
  branchId      VARCHAR(5),
-- -----------------------------------------------------
-- *** Keys ***********************************
-- -----------------------------------------------------
PRIMARY KEY (cId),
FOREIGN KEY (branchId) REFERENCES Branch(branchId)
);

-- -----------------------------------------------------
-- Values in Client: 3 Test Values ---------------------
-- -----------------------------------------------------
INSERT into Client(cId, cPhone, branchId) 
VALUES ('7001', '5127850001', '2');

INSERT into Client(cId, cPhone, branchId) 
VALUES ('7002', '5127776661', '3');

INSERT into Client(cId, cPhone, branchId) 
VALUES ('7003', '5123431212', '4');

INSERT into Client(cId, cPhone, branchId) 
VALUES ('7004', '5129112335', '1');




-- -----------------------------------------------------
-- Table 'Sale'
-- -----------------------------------------------------
CREATE TABLE Sale (
  saleId         VARCHAR(5) NOT NULL,
  askingPrice    NUMBER(10) NULL,
  saleType       VARCHAR(15) NULL,
  saleStAddress  VARCHAR(40) NULL,
  saleCity       VARCHAR(30) NULL,
  saleStateInit  VARCHAR(2) NULL,
  saleZip        VARCHAR(5) NULL,
  salePrice      NUMBER(15, 2) NULL,
  saleDate       DATE NULL,
  propId         VARCHAR(5) NOT NULL,
-- -----------------------------------------------------
-- *** Keys ********************************************
-- -----------------------------------------------------
PRIMARY KEY (saleId),
FOREIGN KEY (propID) REFERENCES Property(propID)
);

-- -----------------------------------------------------
-- Values in Sale: 3 Test Values -------------------
-- -----------------------------------------------------
INSERT into Sale
VALUES ('s1', 160000, 'auction', '4538 Main St', 'San Marcos', 'TX', '78666', 155675.87, TO_DATE('11/01/2016','mm/dd/yyyy'), '2011');

INSERT into Sale (saleId, askingPrice, saleType, salePrice, saleDate, propId)
VALUES ('s2', 135000, 'private', 130200.00, TO_DATE('11/02/2016','mm/dd/yyyy'), '2012');

INSERT into Sale (saleId, askingPrice, saleType, salePrice, saleDate, propId)
VALUES ('s3', 185000, 'highest', 177500.00, TO_DATE('11/03/2016','mm/dd/yyyy'), '2013');

INSERT into Sale (saleId, askingPrice, saleType, salePrice, saleDate, propId)
VALUES ('s4', 185000, 'highest', 177500.00, TO_DATE('11/01/2016','mm/dd/yyyy'), '2014');

INSERT into Sale (saleId, askingPrice, saleType, salePrice, saleDate, propId)
VALUES ('s5', 185000, 'highest', 177500.00, TO_DATE('10/29/2016','mm/dd/yyyy'), '2015');

INSERT into Sale (saleId, askingPrice, propId)
VALUES ('s6', 185000, '2006');

INSERT into Sale (saleId, askingPrice, propId)
VALUES ('s7', 200000, '2007');

INSERT into Sale (saleId, askingPrice, propId)
VALUES ('s8', 165000, '2008');

INSERT into Sale (saleId, askingPrice, propId)
VALUES ('s9', 285000, '2009');

INSERT into Sale (saleId, askingPrice, propId)
VALUES ('s10', 223000, '2010');



-- -----------------------------------------------------
-- Table 'Owner'
-- -----------------------------------------------------
CREATE TABLE Owner (
  propType VARCHAR(8) NULL CONSTRAINT ValidType
     CHECK (propType IN ('private','business')),
  propId VARCHAR(5),
  clientId VARCHAR(5),
  transactionId VARCHAR(5),
-- -----------------------------------------------------
-- *** Keys ********************************************
-- -----------------------------------------------------
FOREIGN KEY (propId) REFERENCES Property(propId),
FOREIGN KEY (clientId) REFERENCES Client(cId),
FOREIGN KEY (transactionId) REFERENCES Transaction(TransactionId)
);

-- -----------------------------------------------------
-- Values in Owner: 3 Test Values ----------------------
-- -----------------------------------------------------
INSERT into Owner VALUES ('private', '2001', '7001', '9001');
INSERT into Owner VALUES ('business', '2001', '7001', '9002');
INSERT into Owner VALUES ('private', '2001', '7001', '9003');

-- -- -----------------------------------------------------
-- -- Table 'sellingAgent'
-- -- -----------------------------------------------------
CREATE TABLE SellingAgent (
  commission NUMERIC(5,2) NOT NULL,
  empId VARCHAR(5),
  -- -----------------------------------------------------
  -- *** Keys ********************************************
  -- -----------------------------------------------------
  FOREIGN KEY (empId) REFERENCES Employee(empId)
);

-- -----------------------------------------------------
-- Values in ListType: 6 Test Values -------------------
-- -----------------------------------------------------
INSERT into SellingAgent VALUES (6.250, '101');
INSERT into SellingAgent VALUES (5.575, '102');
INSERT into SellingAgent VALUES (7.305, '103');
INSERT into SellingAgent VALUES (6.125, '104');
INSERT into SellingAgent VALUES (5.500, '105');
INSERT into SellingAgent VALUES (7.025, '106');

-- -----------------------------------------------------
-- Table 'ListingAgent'
-- -----------------------------------------------------
CREATE TABLE ListingAgent (
  commission NUMERIC(5,2) NOT NULL,
  empId VARCHAR(5),
  -- -----------------------------------------------------
  -- *** Keys ********************************************
  -- -----------------------------------------------------
  FOREIGN KEY (empId) REFERENCES Employee(empId)
);

-- -----------------------------------------------------
-- Values in ListAgent: 6 Test Values ------------------
-- -----------------------------------------------------
INSERT into ListingAgent VALUES (3.125, '101');
INSERT into ListingAgent VALUES (2.250, '102');
INSERT into ListingAgent VALUES (3.900, '103');
INSERT into ListingAgent VALUES (3.025, '104');
INSERT into ListingAgent VALUES (2.550, '105');
INSERT into ListingAgent VALUES (3.750, '106');


-- -----------------------------------------------------
-- Table 'Buyer'
-- -----------------------------------------------------
CREATE TABLE Buyer (
  propType VARCHAR(15) NULL,
  priceLimit NUMERIC(8,2) NOT NULL,
  sqFt NUMERIC(6,2) NULL,
  nBath NUMERIC(2,1) NULL,
  nBed NUMERIC(2,1) NULL,
  location VARCHAR(45) NULL,
  clientId VARCHAR(5),
  empId VARCHAR(5),
  -- -----------------------------------------------------
  -- *** Keys ***********************************
  -- -----------------------------------------------------
  FOREIGN KEY (clientId) REFERENCES Client(cId),
  FOREIGN KEY (empId) REFERENCES Employee(empId)
);

-- -----------------------------------------------------
-- Values in ListAgent: 4 Test Values ------------------
-- -----------------------------------------------------
insert into Buyer VALUES ('house', 200000, 3000, 4, 2, 'North Austin', '7001', '101');
insert into Buyer VALUES ('house', 150000, 2200, 3, 2, 'South Austin', '7002', '102');
insert into Buyer VALUES ('house', 225000, 3500, 4, 3, 'East Austin', '7003', '102');
insert into Buyer VALUES ('house', 320000, 4000, 5, 3, 'Round Rock', '7004', '104');


-- -----------------------------------------------------
-- Table 'Rental'
-- -----------------------------------------------------
CREATE TABLE Rental (
  rentalId VARCHAR(5) NOT NULL,
  rentalRate NUMERIC(15, 2) NULL,
  availableDate DATE NULL,
  propId VARCHAR(5),
-- -----------------------------------------------------
-- *** Keys ********************************************
-- -----------------------------------------------------
PRIMARY KEY (rentalId),
FOREIGN KEY (propId) REFERENCES Property(propId)
);

-- -----------------------------------------------------
-- Values in Rental: 5 Test Values ---------------------
-- -----------------------------------------------------
INSERT into Rental(rentalId, rentalRate, availableDate, propId)
VALUES ('2101', 1500.00, TO_DATE('10/15/2017','mm/dd/yyyy'), '2001');

INSERT into Rental(rentalId, rentalRate, availableDate, propId)
VALUES ('2202', 1900.00, TO_DATE('01/01/2017','mm/dd/yyyy'), '2002');

INSERT into Rental(rentalId, rentalRate, availableDate, propId)
VALUES ('2203', 950.00, TO_DATE('05/27/2018','mm/dd/yyyy'), '2003');

INSERT into Rental(rentalId, rentalRate, availableDate, propId)
VALUES ('2204', 1120.80, TO_DATE('09/27/2017','mm/dd/yyyy'), '2004');

INSERT into Rental(rentalId, rentalRate, availableDate, propId)
VALUES ('2205', 3276.99, TO_DATE('11/27/2019','mm/dd/yyyy'), '2005');



-- -----------------------------------------------------
-- Table 'Renter'
-- -----------------------------------------------------
CREATE TABLE Renter (
  rentalAgId    VARCHAR(5) NULL,
  transactionId   VARCHAR(5) NULL,
  clientId    VARCHAR(5) NULL,
-- -----------------------------------------------------
-- *** Keys ********************************************
-- -----------------------------------------------------
PRIMARY KEY (rentalAgId),
FOREIGN KEY (clientId) REFERENCES Client(cId),
FOREIGN KEY (transactionId) REFERENCES Transaction(TransactionId)
);

-- -----------------------------------------------------
-- Values in Renter: 3 Test Values ---------------------
-- -----------------------------------------------------
INSERT into Renter VALUES ('11001', '9001', '7001');
INSERT into Renter VALUES ('11002', '9002', '7002');
INSERT into Renter VALUES ('11003', '9003', '7003');

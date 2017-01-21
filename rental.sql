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
-- Values in Rental: 3 Test Values ---------------------
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
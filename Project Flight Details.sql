-- creating data base
CREATE DATABASE project;
-- using the db
use project;
-- creating the table passenger
CREATE TABLE Passenger(
    Passenger_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Date_of_Birth DATE,
    Gender VARCHAR(10),
    Contact_Number VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT);
-- insert values into passenger
INSERT INTO Passenger(Passenger_ID, Name, Date_of_Birth, Gender, Contact_Number, Email, Address)
VALUES 
(101, 'John Doe', '1995-08-15', 'Male', '1-987-654-3210', 'john@example.com', '123 Main Street, New York, NY 10001, USA'),
(102, 'David Frank', '2000-03-25', 'Male', '44-7654-321-987', 'david@example.com', '456 Elm Avenue, Los Angeles, CA 90012, USA'),
(103, 'Sam Noel', '1987-12-10', 'Male', '91-98765-43210', 'sam@example.com', '789 Oak Road, Toronto, ON M5H 2N2, Canada'),
(104, 'Anny Frank', '1992-06-30', 'Female', '61-412-345-678', 'anny@example.com', '101 Maple Drive, London SW1A 1AA, UK'),
(105, 'Daniel William', '1985-11-05', 'Male', '49-170-1234567', 'daniel@example.com', '202 Cherry Lane, Sydney, NSW 2000, Australia'),
(106, 'Swamy Nathan', '1998-04-20', 'Male', '33-612-345-678', 'swamy@example.com', '303 Pine Street, Mumbai, MH 400001, India'),
(107, 'Xavier Bob', '2003-09-12', 'Male', '81-90-1234-5678', 'xavier@example.com', '404 Birch Avenue, Berlin 10115, Germany'),
(108, 'Theresa Vinsent', '1990-07-01', 'Female', '55-21-98765-4321', 'theresa@example.com', '505 Cedar Boulevard, Tokyo 100-0001, Japan'),
(109, 'Anna John', '1982-10-18', 'Female', '27-82-123-4567', 'anna@example.com', '606 Willow Court, Cape Town 8001, South Africa'),
(110, 'Kale Paul', '2005-02-28', 'Male', '86-138-7654-3210', 'kale@example.com', '707 Spruce Crescent, São Paulo 01000-000, Brazil');
ALTER TABLE Passenger
Modify column Contact_Number VARCHAR(70);
-- displaying the content
SELECT * FROM Passenger;	

-- creating table flight
CREATE TABLE Flight (
    Flight_ID INT PRIMARY KEY,
    Flight_Number VARCHAR(10),
    Airline_Name VARCHAR(50),
    Source VARCHAR(50),
    Destination VARCHAR(50),
    Departure_Time DATETIME,
    Arrival_Time DATETIME,
    Total_Seats INT);
-- insert values into flight
INSERT INTO Flight(Flight_ID, Flight_Number, Airline_Name, Source, Destination, Departure_Time, Arrival_Time, Total_Seats)
VALUES
(1001, 'AI101', 'Air India', 'New York', 'London', '2024-06-10 23:00:00', '2024-06-11 01:00:00', 20),
(1002, 'AI102', 'SkyJet Airways', 'USA', 'Delhi', '2024-09-22 13:00:00', '2024-09-23 12:00:00', 26),
(1003, 'AI103', 'Global Wings', 'Bangalore', 'Chennai', '2024-10-13 07:00:00', '2024-10-14 08:00:00', 200),
(1004, 'AI104', 'AeroVista Airlines', 'Indonnasia', 'Chennai', '2024-11-30 03:00:00', '2024-12-01 04:00:00', 167),
(1005, 'AI105', 'Cloud Nine Air', 'Coimbatore', 'Bangalore', '2024-07-04 04:00:00', '2024-07-05 05:00:00', 123),
(1006, 'AI106', 'SwiftAir Express', 'Delhi', 'Bangkok', '2024-05-01 05:00:00', '2024-05-02 06:00:00', 16),
(1007, 'AI107', 'EagleFly Aviation', 'Delhi', 'Ahmedabad', '2024-01-28 06:00:00', '2024-01-29 07:00:00', 11),
(1008, 'AI108', 'Sunrise Airlines', 'France', 'Germany', '2024-03-29 10:00:00', '2024-03-30 11:00:00', 25),
(1009, 'AI109', 'NovaJet Airways', 'Africa', 'South Korea', '2024-12-31 11:00:00', '2025-01-01 12:00:00', 60),
(1010, 'AI110', 'Infinity Air', 'Khazakastan', 'Coimbatore', '2024-08-09 12:00:00', '2024-08-10 13:00:00', 100);
-- displaying the content
SELECT * FROM Flight;

-- creating table booking
CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Passenger_ID INT,
    Flight_ID INT,
    Booking_Date DATE,
    Seat_Number VARCHAR(5),
    Status VARCHAR(20) CHECK (Status IN ('Confirmed', 'Canceled', 'Pending')),
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
    FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID));
    Select * from Booking;
-- insert values into booking
INSERT INTO Booking(Booking_ID, Passenger_ID, Flight_ID, Booking_Date, Seat_Number, Status)
VALUES
(201, 101, 1001, '2024-10-01', '08J', 'Confirmed'),
(202, 102, 1002, '2024-09-02', '10P', 'Canceled'),
(203, 103, 1003, '2024-08-03', '17U', 'Confirmed'),
(204, 104, 1004, '2024-07-04', '03I', 'Pending'),
(205, 105, 1005, '2024-06-05', '39F', 'Confirmed'),
(206, 106, 1006, '2024-05-06', '44Q', 'Pending'),
(207, 107, 1007, '2024-04-07', '38B', 'Canceled'),
(208, 108, 1008, '2024-03-08', '09R', 'Confirmed'),
(209, 109, 1009, '2024-02-09', '49L', 'Canceled'),
(210, 110, 1010, '2024-01-10', '50A', 'Confirmed');
-- displaying the content
SELECT * FROM Booking;

-- creating table payment
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Booking_ID INT,
    Amount INT,
    Payment_Date DATE,
    Payment_Status VARCHAR(80) CHECK (Payment_Status IN ('Paid', 'Pending', 'Failed')),
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID));
-- inserting the values
INSERT INTO Payment(Payment_ID, Booking_ID, Amount, Payment_Date, Payment_Status)
VALUES
(301, 201, 1500, '2024-09-01', 'Paid'),
(302, 202, 2500, '2024-08-02', 'Paid'),
(303, 203, 3500, '2024-07-03', 'Paid'),
(304, 204, 4500, '2024-06-04', 'Paid'),
(305, 205, 2500, '2024-05-05', 'Paid'),
(306, 206, 1500, '2024-04-06', 'Paid'),
(307, 207, 2500, '2024-03-07', 'Paid'),
(308, 208, 7500, '2024-02-08', 'Paid'),
(309, 209, 3500, '2024-01-09', 'Paid'),
(310, 210, 7500, '2024-11-10', 'Paid');
-- displaying the content
SELECT * FROM Payment;
-- creating table airpot
CREATE TABLE Airport (
    Airport_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50));
-- inserting values
INSERT INTO Airport (Airport_ID, Name, City, Country)
VALUES
(1, 'John F. Kennedy International Airport', 'New York', 'USA'),
(2, 'Los Angeles International Airport', 'Los Angeles', 'USA'),
(3, 'Heathrow Airport', 'London', 'UK'),
(4, 'Charles de Gaulle Airport', 'Paris', 'France'),
(5, 'Dubai International Airport', 'Dubai', 'UAE'),
(6, 'Tokyo Haneda Airport', 'Tokyo', 'Japan'),
(7, 'Sydney Kingsford Smith Airport', 'Sydney', 'Australia'),
(8, 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'India'),
(9, 'Frankfurt Airport', 'Frankfurt', 'Germany'),
(10, 'Singapore Changi Airport', 'Singapore', 'Singapore');
-- displaying the content
SELECT* FROM Airport; 

-- creating the table aircraft
CREATE TABLE Aircraft (
    Aircraft_ID INT PRIMARY KEY,
    Model VARCHAR(50),
    Capacity INT);
-- inserting values
INSERT INTO Aircraft(Aircraft_ID, Model, Capacity)
VALUES
(111, 'Boeing 737', 189),
(222, 'Airbus A320', 180),
(333, 'Boeing 777', 396),
(444, 'Airbus A350', 440),
(555, 'Boeing 787', 296),
(666, 'Airbus A380', 850),
(777, 'Embraer E190', 114),
(888, 'Bombardier CRJ900', 90),
(999, 'Boeing 747', 524),
(1010, 'Airbus A321', 244);
-- displaying the content
SELECT * FROM Aircraft;

-- creating table crew
CREATE TABLE Crew (
    Crew_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Flight_ID INT,
    FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID));
-- inserting values
INSERT INTO Crew (Crew_ID, Name, Role, Flight_ID)
VALUES
(1, 'John Smith', 'Pilot', 1001),
(2, 'Sarah Johnson', 'Co-Pilot', 1002),
(3, 'Michael Brown', 'Flight Attendant', 1003),
(4, 'Emily Davis', 'Flight Attendant', 1004),
(5, 'David Wilson', 'Pilot', 1005),
(6, 'Emma Martinez', 'Co-Pilot', 1006),
(7, 'James Taylor', 'Flight Attendant', 1007),
(8, 'Olivia Anderson', 'Flight Attendant', 1008),
(9, 'William Thomas', 'Pilot', 1009),
(10, 'Sophia White', 'Co-Pilot', 1010);
-- displaying the content
SELECT * FROM Crew;

-- retrieve flight details
SELECT * FROM Flight WHERE Source = 'New York' AND Destination = 'London';

--  get booking details for a passenger
SELECT b.Booking_ID, p.Name, f.Flight_Number, f.Airline_Name, f.Source, f.Destination, b.Booking_Date, b.Seat_Number, b.Status
FROM Booking b
JOIN Passenger p ON b.Passenger_ID = p.Passenger_ID
JOIN Flight f ON b.Flight_ID = f.Flight_ID
WHERE p.Passenger_ID = 101;

-- find available flights between two locations
SELECT Flight_Number, Airline_Name, Departure_Time, Arrival_Time, Total_Seats
FROM Flight
WHERE Source = 'Coimbatore' AND Destination = 'Bangalore';

-- getting payment details for a specific booking
SELECT p.Payment_ID, b.Booking_ID, p.Amount, p.Payment_Date, p.Payment_Status
FROM Payment p
JOIN Booking b ON p.Booking_ID = b.Booking_ID
WHERE b.Booking_ID = 210;

-- listing all pending bookings
SELECT * FROM Booking WHERE Status = 'Pending';

-- update booking status
UPDATE Booking 
SET Status = 'Confirmed' 
WHERE Booking_ID = 206;

-- getting flights departing 
SELECT * FROM Flight 
WHERE Departure_Time BETWEEN '2024-06-10 23:00:00' AND '2025-01-01 12:00:00';

-- find the most popular flight based on bookings
SELECT f.Flight_ID, f.Flight_Number, f.Airline_Name, COUNT(b.Booking_ID) AS Total_Bookings
FROM Flight f
JOIN Booking b ON f.Flight_ID = b.Flight_ID
GROUP BY f.Flight_ID, f.Flight_Number, f.Airline_Name
ORDER BY Total_Bookings DESC
LIMIT 1;

-- creating view for 
CREATE VIEW PassengerFlightDetails AS
SELECT 
    p.Passenger_ID, 
    p.Name AS Passenger_Name, 
    p.Contact_Number, 
    p.Email, 
    f.Flight_Number, 
    f.Airline_Name, 
    f.Source, 
    f.Destination, 
    b.Booking_Date, 
    b.Seat_Number, 
    b.Status AS Booking_Status
FROM Passenger p
JOIN Booking b ON p.Passenger_ID = b.Passenger_ID
JOIN Flight f ON b.Flight_ID = f.Flight_ID;
-- to view the data
SELECT * FROM PassengerFlightDetails;

-- stored procedure (IN)
delimiter //
CREATE PROCEDURE GetFlightByID(IN f_ID INT)
BEGIN
    SELECT * FROM Flight WHERE Flight_ID = f_ID;
END //
delimiter ;
-- calling the IN procedure
CALL GetFlightByID(1001);

-- stored procedure (OUT)
delimiter //
CREATE PROCEDURE GetFlightInfo(
    IN f_ID INT,
    OUT f_Number VARCHAR(10),
    OUT f_Airline VARCHAR(50),
    OUT f_Source VARCHAR(50),
    OUT f_Destination VARCHAR(50)
)
BEGIN
    SELECT Flight_Number, Airline_Name, Source, Destination
    INTO f_Number, f_Airline, f_Source, f_Destination
    FROM Flight WHERE Flight_ID = f_ID;
END //
delimiter ;
-- calling the OUT procedure
CALL GetFlightInfo(1001, @FlightNumber, @Airline, @Source, @Destination);
-- displaying the data
SELECT @FlightNumber, @Airline, @Source, @Destination;

-- stored procedure (INOUT)
delimiter //
CREATE PROCEDURE GetTotalSeats(INOUT f_ID INT, OUT total_Seats INT)
BEGIN
    SELECT Total_Seats INTO total_Seats FROM Flight WHERE Flight_ID = f_ID;
END //
delimiter ;
-- calling the INOUT procedure
SET @FlightID = 1001;
CALL GetTotalSeats(@FlightID, @Seats);
-- displaying the data
SELECT @Seats;



    






mysql> USE AirlineReservation;
Database changed
mysql> CREATE TABLE Flights (
    ->     FlightID VARCHAR(10) PRIMARY KEY,
    ->     Airline VARCHAR(50),
    ->     Source VARCHAR(50),
    ->     Destination VARCHAR(50),
    ->     DepartureTime TIME,
    ->     ArrivalTime TIME,
    ->     Price DECIMAL(10, 2)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> CREATE TABLE Passengers (
    ->     PassengerID VARCHAR(10) PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     ContactNumber VARCHAR(15),
    ->     Email VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> CREATE TABLE Bookings (
    ->     BookingID VARCHAR(10) PRIMARY KEY,
    ->     PassengerID VARCHAR(10),
    ->     FlightID VARCHAR(10),
    ->     BookingDate DATE,
    ->     SeatNumber VARCHAR(5),
    ->     FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    ->     FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> CREATE TABLE Schedules (
    ->     ScheduleID VARCHAR(10) PRIMARY KEY,
    ->     FlightID VARCHAR(10),
    ->     DayOfWeek VARCHAR(10),
    ->     Frequency VARCHAR(10),
    ->     FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO Flights (FlightID, Airline, Source, Destination, DepartureTime, ArrivalTime, Price)
    -> VALUES
    -> ('F101', 'Air India', 'Delhi', 'Mumbai', '08:00', '10:30', 5000),
    -> ('F102', 'Indigo', 'Delhi', 'Bangalore', '09:00', '12:00', 7000);
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Passengers (PassengerID, FirstName, LastName, ContactNumber, Email)
    -> VALUES ('P101', 'John', 'Doe', '9876543210', 'john.doe@example.com');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM Flights;
+----------+-----------+--------+-------------+---------------+-------------+---------+
| FlightID | Airline   | Source | Destination | DepartureTime | ArrivalTime | Price   |
+----------+-----------+--------+-------------+---------------+-------------+---------+
| F101     | Air India | Delhi  | Mumbai      | 08:00:00      | 10:30:00    | 5000.00 |
| F102     | Indigo    | Delhi  | Bangalore   | 09:00:00      | 12:00:00    | 7000.00 |
+----------+-----------+--------+-------------+---------------+-------------+---------+
2 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Flights
    -> WHERE Source = 'Delhi' AND Destination = 'Mumbai';
+----------+-----------+--------+-------------+---------------+-------------+---------+
| FlightID | Airline   | Source | Destination | DepartureTime | ArrivalTime | Price   |
+----------+-----------+--------+-------------+---------------+-------------+---------+
| F101     | Air India | Delhi  | Mumbai      | 08:00:00      | 10:30:00    | 5000.00 |
+----------+-----------+--------+-------------+---------------+-------------+---------+
1 row in set (0.00 sec)

mysql> SELECT Passengers.FirstName, Flights.Airline, Bookings.SeatNumber
    -> FROM Passengers
    -> JOIN Bookings ON Passengers.PassengerID = Bookings.PassengerID
    -> JOIN Flights ON Bookings.FlightID = Flights.FlightID;
Empty set (0.00 sec)
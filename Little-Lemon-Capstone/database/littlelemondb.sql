DROP DATABASE IF EXISTS LittleLemonDB;
-- 1. Setup Database
CREATE DATABASE IF NOT EXISTS LittleLemonDB;
USE LittleLemonDB;

-- 2. Tabel Customers
CREATE TABLE customers (
    CustomerID VARCHAR(50) PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    City VARCHAR(100),
    Country VARCHAR(100),
    PostalCode VARCHAR(50),
    CountryCode VARCHAR(10)
);

-- 3. Tabel MenuItems
CREATE TABLE menuitems (
    MenuID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    CuisineName VARCHAR(100),
    StarterName VARCHAR(100),
    DesertName VARCHAR(100),
    Drink VARCHAR(100),
    Sides VARCHAR(100)
);

-- 4. Tabel Bookings
CREATE TABLE bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    TableNumber INT,
    CustomerID VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

-- 5. Tabel Orders
CREATE TABLE orders (
    OrderID VARCHAR(50) PRIMARY KEY,
    OrderDate DATE,
    DeliveryDate DATE,
    CustomerID VARCHAR(50),
    MenuID INT,
    Cost DECIMAL(10,2),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    DeliveryCost DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (MenuID) REFERENCES menuitems(MenuID)
);

-- =============================================
-- 5 STORED PROCEDURES (WAJIB SESUAI TUGAS)
-- =============================================
DELIMITER //

-- 1. GetMaxQuantity
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS "Max Quantity in Order" FROM orders;
END //

-- 2. AddBooking
CREATE PROCEDURE AddBooking(IN b_id INT, IN c_id VARCHAR(50), IN b_date DATE, IN t_num INT)
BEGIN
    INSERT INTO bookings (BookingID, CustomerID, BookingDate, TableNumber) 
    VALUES (b_id, c_id, b_date, t_num);
    SELECT 'New booking added' AS 'Confirmation';
END //

-- 3. UpdateBooking
CREATE PROCEDURE UpdateBooking(IN b_id INT, IN b_date DATE)
BEGIN
    UPDATE bookings SET BookingDate = b_date WHERE BookingID = b_id;
    SELECT CONCAT('Booking ', b_id, ' updated') AS 'Confirmation';
END //

-- 4. CancelBooking
CREATE PROCEDURE CancelBooking(IN b_id INT)
BEGIN
    DELETE FROM bookings WHERE BookingID = b_id;
    SELECT CONCAT('Booking ', b_id, ' cancelled') AS 'Confirmation';
END //

-- 5. ManageBooking
CREATE PROCEDURE ManageBooking(IN b_date DATE, IN t_num INT)
BEGIN
    DECLARE status_msg VARCHAR(50);
    IF EXISTS(SELECT 1 FROM bookings WHERE BookingDate = b_date AND TableNumber = t_num) THEN
        SET status_msg = 'Table is already booked';
    ELSE
        SET status_msg = 'Table is available';
    END IF;
    SELECT status_msg AS 'Booking Status';
END //

DELIMITER ;
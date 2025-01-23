--1. Create view For Successful Bookings
CREATE VIEW successful_bookings AS
SELECT * FROM bookings
WHERE booking_status = 'Success';
--Retrieve all successful bookings:
SELECT * FROM Successful_bookings;
-- DROP VIEW
DROP VIEW successful_bookings;

--2. Create View For average ride distance for each vehicle type
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT vehicle_type, AVG(ride_distance)
AS avg_distance FROM bookings
GROUP BY vehicle_type
ORDER BY vehicle_type;

-- Find the average ride distance for each vehicle type?
SELECT * FROM ride_distance_for_each_vehicle;

--3. Create View of total number of cancelled rides by customers.
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) AS cancelled_bookings FROM bookings
WHERE booking_status = 'Canceled by Customer';
-- Get the total number of cancelled rides by customers.
SELECT * FROM cancelled_rides_by_customers;

--4. Create view of top 5 customers who booked the highest number of rides
CREATE VIEW top_five_customers AS
SELECT customer_id, COUNT(booking_id) as total_rides
FROM bookings
GROUP BY customer_id
ORDER BY total_rides DESC LIMIT 5;
-- list the top 5 customers who booked the highest number of rides:
SELECT * FROM top_five_customers;

--5.Create a view of rides cancelled by drivers due to personal and car-related issues
CREATE VIEW ride_cancelled_by_drivers AS
SELECT COUNT(*) AS booking_cancelled
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

--Get the number of rides cancelled by drivers due to personal and car-related issues
SELECT * FROM ride_cancelled_by_drivers;

--6. Create View MIN and MAX Rating 
CREATE VIEW ratings AS
SELECT MAX(driver_ratings) as max_rating, MIN(driver_ratings) as min_rating
FROM bookings
WHERE vehicle_type = 'Prime Sedan';
--Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT * FROM ratings;

--7. Create View Payment Mode UPI
CREATE VIEW payment_method_upi AS
SELECT * FROM bookings
WHERE payment_method = 'UPI';
--Retrieve all rides where payment mode was made using UPI.
SELECT * FROM payment_method_upi;
-- DROP VIEW
DROP VIEW payment_method_upi;

-- Retrieve all data
SELECT * FROM bookings;

-- First we alter the column name of driver ratings and customer ratings from character to float
ALTER TABLE bookings
ALTER COLUMN customer_rating TYPE FLOAT USING customer_rating::FLOAT;

SELECT * FROM bookings
WHERE driver_ratings = 'NULL';

-- UPDATE column data
UPDATE bookings
SET driver_ratings = NULL
WHERE driver_ratings = 'NULL';

ALTER TABLE bookings
ALTER COLUMN driver_ratings TYPE FLOAT USING driver_ratings::FLOAT;

--8. Create view of average customer rating per vehicle
CREATE VIEW customer_rating_per_vehicle AS
SELECT vehicle_type, AVG(customer_rating) AS avg_customer_rating
FROM bookings
GROUP BY vehicle_type;
--Find the average customer rating per vehicle type:
SELECT * FROM customer_rating_per_vehicle;

SELECT * FROM bookings;
--9. Create View Total booking value
CREATE VIEW total_booking_value AS
SELECT SUM(booking_value) AS total_value
FROM bookings;
-- Calculate the total booking value of rides completed successfully:
SELECT * FROM total_booking_value;

--10. Create View
CREATE VIEW incomplete_ride_with_reason AS
SELECT incomplete_rides, incomplete_rides_reason
FROM bookings
WHERE incomplete_rides = 'Yes';
-- List all incomplete rides along with the reason:
SELECT * FROM incomplete_ride_with_reason;
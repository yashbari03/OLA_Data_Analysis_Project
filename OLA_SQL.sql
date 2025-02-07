Create database Ola;
Use ola;
select * from bookings;

#1. Retrieve all successful bookings:
CREATE VIEW successful_bookings AS
SELECT * FROM bookings
WHERE Booking_Status = "Success";

SELECT * FROM successful_bookings;

#2. Find the average ride distance for each vehicle type:
CREATE VIEW avg_ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM avg_ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
CREATE VIEW total_no_of_cancelled_rides_by_customers AS
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM total_no_of_cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings
GROUP BY Customer_ID ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM Top_5_Customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW rides_cancelled_by_drivers_P_C_Issues AS
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM rides_cancelled_by_drivers_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) AS max_rating, MIN(Driver_Ratings) AS min_rating FROM bookings
WHERE Vehicle_Type = "Prime Sedan";

SELECT * FROM Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_Payment AS 
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payment;

#8. Find the average customer rating per vehicle type:
CREATE VIEW Avg_Customer_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM Avg_Customer_Rating;

#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW booking_value_of_rides_completed AS
SELECT SUM(Booking_Value) FROM bookings
WHERE Booking_Status = "Success";

SELECT * FROM booking_value_of_rides_completed;

#10. List all incomplete rides along with the reason:
CREATE VIEW incomplete_rides_reasons AS
SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings
WHERE Incomplete_Rides ="yes";

SELECT * FROM incomplete_rides_reasons;
create database ola;
use ola;
select*from booking;
#1. Retrieve all successful bookings:
create view Successful_Bookings As
select*from booking 
where Booking_Status='Success';
select*from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
create view Ride_Distance_From_Each_Vehicle as
select Vehicle_Type ,avg(Ride_Distance)
as avg_distance from booking group by Vehicle_Type;

select Vehicle_Type ,avg(Ride_Distance)
as avg_distance from booking group by Vehicle_Type;

select*from Ride_Distance_From_Each_Vehicle;

#3. Get the total number of cancelled rides by customers:
create view canceled_by_customer as 
select count(*) from booking 
where Booking_Status = 'Canceled by Customer';

select count(*) from booking 
where Booking_Status = 'Canceled by Customer';

select*from canceled_by_customer;

#4. List the top 5 customers who booked the highest number of rides:
create view  top_5_customers as
select Customer_Id,count(Booking_Id) as total_rides
from booking 
group by Customer_Id 
order by total_rides desc limit 5 ;

select Customer_Id,count(Booking_Id) as total_rides
from booking 
group by Customer_Id 
order by total_rides desc limit 5 ;

select*from top_5_customers;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*) from booking 
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

create view cancel_by_driver as 
select count(*) from booking 
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select*from cancel_by_driver;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_rating as 
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating 
from booking where Vehicle_Type = 'Prime Sedan';

select*from max_min_rating;

#7. Retrieve all rides where payment was made using UPI:
create view Payment_Meth as 
select Customer_Id,Payment_Method 
from booking 
where Payment_Method = 'UPI';

select*from Payment_Meth;


#8. Find the average customer rating per vehicle type:
create view ratings_avg as 
select avg(Customer_Rating),Vehicle_Type as average_Rating
from booking 
group by Vehicle_Type;

select*from ratings_avg;

#9. Calculate the total booking value of rides completed successfully:
create view total_booking_value as 
select sum(Booking_Value)  
as total_succesful_value from booking
where Booking_Status = 'Success';

select sum(Booking_Value)  
as total_succesful_value from booking
where Booking_Status = 'Success';

select*from total_booking_value;

#10. List all incomplete rides along with the reason:
create view incomp_ride_reason as 
select Incomplete_Rides_Reason,Booking_Id from booking
where Incomplete_Rides ='Yes';

select Incomplete_Rides_Reason,Booking_Id from booking
where Incomplete_Rides ='Yes';

select*from incomp_ride_reason; 




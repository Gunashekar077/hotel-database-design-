create database Hotel_chain_management_system;

use Hotel_chain_management_system;

create table Hotel
(
hotel_code int not null primary key,
hotel_name varchar(250),
city varchar(250),
number_of_rooms int,
star_rating float
);
CREATE TABLE Rooms (
    room_number INT NOT NULL PRIMARY KEY,
    room_type VARCHAR(250),
    price_per_night INT,
    availability_status VARCHAR(250),
    hotel_id INT,
    FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_code)
);
CREATE TABLE Guests
(
    guest_ID INT NOT NULL PRIMARY KEY,
    guest_name VARCHAR(250),
    loyalty_level VARCHAR(250)
);
CREATE TABLE Bookings
(
    booking_ID INT NOT NULL PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATETIME,
    check_out DATETIME,
    dates DATETIME,
    total_bill FLOAT,
    FOREIGN KEY(guest_id) REFERENCES Guests(guest_ID),
    FOREIGN KEY(room_id) REFERENCES Rooms(room_number)
);
CREATE TABLE Roles
(
role_id INT NOT NULL PRIMARY KEY,
role_name VARCHAR(250)
);
CREATE TABLE Employee
(
    employee_ID INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(250),
    role_id INT,
    hotel_assigned INT,
    shift_details VARCHAR(250),
    FOREIGN KEY(role_id) REFERENCES Roles(role_id),
    FOREIGN KEY(hotel_assigned) REFERENCES Hotel(hotel_code)
);
CREATE TABLE Feedback
(
    feedback_id INT NOT NULL PRIMARY KEY,
    booking_id INT,
    comments VARCHAR(250),
    rating FLOAT,
    FOREIGN KEY(booking_id) REFERENCES Feedback(feedback_Id)
);
 
 INSERT INTO Hotel (hotel_code, hotel_name, city, number_of_rooms, star_rating) VALUES
(101, 'Grand Palace', 'Hyderabad', 120, 4.5),
(102, 'Sea View Resort', 'Goa', 80, 4.7),
(103, 'Mountain Retreat', 'Manali', 60, 4.2),
(104, 'City Comfort Inn', 'Delhi', 100, 4.0),
(105, 'Luxury Stay', 'Mumbai', 150, 4.8),
(106, 'Heritage Hotel', 'Jaipur', 90, 4.3);

INSERT INTO Rooms (room_number, room_type, price_per_night, availability_status, hotel_id) VALUES
(201, 'Deluxe', 5000, 'Available', 101),
(202, 'Suite', 7500, 'Occupied', 101),
(203, 'Standard', 3000, 'Available', 102),
(204, 'Deluxe', 5500, 'Occupied', 102),
(205, 'Suite', 8000, 'Available', 103),
(206, 'Standard', 3500, 'Occupied', 103);

INSERT INTO Guests (guest_ID, guest_name, loyalty_level) VALUES
(301, 'Ravi Kumar', 'Gold'),
(302, 'Anjali Sharma', 'Silver'),
(303, 'John Doe', 'Platinum'),
(304, 'Priya Mehta', 'Bronze'),
(305, 'Ahmed Khan', 'Gold'),
(306, 'Sunita Reddy', 'Silver');

INSERT INTO Bookings (booking_ID, guest_id, room_id, check_in, check_out, dates, total_bill) VALUES
(401, 301, 201, '2025-06-01 14:00:00', '2025-06-05 12:00:00', '2025-06-01', 20000),
(402, 302, 202, '2025-06-02 15:00:00', '2025-06-06 11:00:00', '2025-06-02', 30000),
(403, 303, 203, '2025-06-03 13:00:00', '2025-06-07 12:00:00', '2025-06-03', 12000),
(404, 304, 204, '2025-06-04 16:00:00', '2025-06-08 11:00:00', '2025-06-04', 22000),
(405, 305, 205, '2025-06-05 12:00:00', '2025-06-09 12:00:00', '2025-06-05', 32000),
(406, 306, 206, '2025-06-06 14:00:00', '2025-06-10 12:00:00', '2025-06-06', 14000);

INSERT INTO Roles (role_id, role_name) VALUES
(1, 'Manager'),
(2, 'Receptionist'),
(3, 'Housekeeping'),
(4, 'Security'),
(5, 'Chef'),
(6, 'Concierge');
 
 INSERT INTO Employee (employee_ID, emp_name, role_id, hotel_assigned, shift_details) VALUES
(501, 'Suresh Patel', 1, 101, 'Morning'),
(502, 'Neha Joshi', 2, 102, 'Evening'),
(503, 'Raj Verma', 3, 103, 'Night'),
(504, 'Kiran Rao', 4, 104, 'Morning'),
(505, 'Amit Roy', 5, 105, 'Evening'),
(506, 'Lata Sharma', 6, 106, 'Night');

INSERT INTO Feedback (feedback_id, booking_id, comments, rating) VALUES
(601, 401, 'Great stay, very comfortable!', 4.5),
(602, 402, 'Nice service but food was average.', 3.8),
(603, 403, 'Excellent hospitality!', 4.9),
(604, 404, 'Clean rooms and friendly staff.', 4.2),
(605, 405, 'Satisfactory, could be better.', 3.5),
(606, 406, 'Loved the ambience and location.', 4.7);
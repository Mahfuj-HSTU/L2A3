# Vehicle Rental System Database

This project involves creating and managing a database for a vehicle rental system. Below are the SQL queries used to perform various data retrieval operations.

## Project Queries and Solutions

Here are the specific queries used to retrieve data from the database.

### Query 1: Retrieve Customer Bookings

**Objective:** Fetch all bookings made by users with the role 'Customer', including booking details, customer name, and vehicle name.

```sql
SELECT
  b.booking_id,
  u.name AS customer_name,
  v.name AS vehicle_name,
  b.start_date,
  b.end_date,
  b.status
FROM "Bookings" b
JOIN "Users" u ON b.user_id = u.user_id
JOIN "Vehicles" v ON b.vehicle_id = v.vehicle_id
WHERE u.role = 'Customer';
```

### Query 2: Retrieve Non-Rented Vehicles

**Objective:** Fetch all vehicles that are not currently rented or booked.

```sql
SELECT *
FROM "Vehicles"
WHERE status NOT IN ('rented');
```

### Query 3: Retrieve Available Cars

**Objective:** Fetch all vehicles that are available and are of type 'car' (case-insensitive).

```sql
SELECT *
FROM "Vehicles"
WHERE status = 'available'
  AND LOWER(type) = 'car';
```

### Query 4: Popular Vehicles with Multiple bookings

**Objective:** Fetch the names of vehicles that have been booked more than twice, along with the total count of bookings.

```sql
SELECT
  v.name AS vehicle_name,
  COUNT(b.booking_id) AS total_bookings
FROM "Vehicles" v
JOIN "Bookings" b
  ON v.vehicle_id = b.vehicle_id
GROUP BY
  v.vehicle_id,
  v.name
HAVING COUNT(b.booking_id) > 2;
```

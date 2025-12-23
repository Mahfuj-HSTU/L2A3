-- query 1
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

-- query 2
SELECT *
FROM "Vehicles"
WHERE status NOT IN ('rented');

-- query 3
SELECT *
FROM "Vehicles"
WHERE status = 'available'
  AND LOWER(type) = 'car';

-- query 4
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
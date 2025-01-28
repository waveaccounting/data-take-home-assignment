-- models/stg/stg_customer_shipment_spend


WITH customers AS (
   SELECT
       id AS customer_id,
       city,
       province_code,
       email_address,
       phone_number,
       created_at AS registration_date
   FROM raw.database.shipments
   -- for simplicity we select all customers who send shipments
),


shipments AS (
   SELECT
       s.id AS shipment_id,
       s.customer_id,
       s.shipment_date,
       s.shipment_status,
       s.delivery_cost
   FROM {{ source('raw', 'shipments') }} s
   WHERE s.shipment_status IN ('completed', 'in_progress')
),


shipment_totals AS (
   SELECT
       shipments.customer_id,
       COUNT(shipments.shipment_id) AS total_shipment,
       SUM(shipments.delivery_cost) AS total_cost,
       MIN(shipments.shipment_date) AS first_shipment_dt,
       MAX(shipments.shipment_date) AS last_shipment_dt

   FROM shipments
   GROUP BY shipments.customer_id
),


customer_data AS (
   SELECT
       customers.customer_id,
       CONCAT(customers.city, ' ', customers.province_code) AS customer_location,
       customers.email_address,
       customers.phone_number,
       shipment_totals.total_shipment,
       shipment_totals.total_cost,
       shipment_totals.first_shipment_dt,
       shipment_totals.last_shipment_dt
   FROM customers
   LEFT JOIN shipment_totals ON customers.customer_id = shipment_totals.customer_id
)


SELECT
   customer_data.customer_id,
   customer_data.customer_location,
   customer_data.email_address,
   customer_data.phone_number,
   customer_data.total_shipment,
   customer_data.total_cost,
   CASE
       WHEN customer_data.total_cost > 1000 THEN 'High Value'
       WHEN customer_data.total_cost BETWEEN 500 AND 1000 THEN 'Medium Value'
       ELSE 'Low Value'
   END AS customer_type
FROM customer_data
ORDER BY customer_data.total_cost DESC;



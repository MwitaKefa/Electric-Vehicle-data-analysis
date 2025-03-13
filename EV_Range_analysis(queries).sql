USE ev_range_analysis;
 
-- table information overview
SELECT *
FROM
    electric_vehicle_population_data
LIMIT 10;

DESC electric_vehicle_population_data;

-- removing null values from the table 
DELETE FROM electric_vehicle_population_data
WHERE `VIN_1_10` IS NULL
   OR County IS NULL
   OR City IS NULL
   OR State IS NULL
   OR `Postal Code` IS NULL
   OR `Model Year` IS NULL
   OR Make IS NULL
   OR Model IS NULL
   OR `Electric Vehicle Type` IS NULL
   OR `Clean Alternative Fuel Vehicle (CAFV) Eligibility` IS NULL
   OR `Electric Range` IS NULL
   OR `Base MSRP` IS NULL
   OR `Legislative District` IS NULL
   OR `DOL Vehicle ID` IS NULL
   OR `Vehicle Location` IS NULL
   OR `Electric Utility` IS NULL
   OR `2020 Census Tract` IS NULL
LIMIT 1000;  -- adjust limit if needed

-- Electric Vehicle range by EV type
SELECT `Electric Vehicle Type`, AVG(`Electric Range`) AS average_ev_range
FROM electric_vehicle_population_data
GROUP BY `Electric Vehicle Type`;

-- Average EV range by make
SELECT Make, AVG(`Electric Range`) AS average_ev_range
FROM electric_vehicle_population_data
GROUP BY Make
ORDER BY average_ev_range DESC;

-- Average EV range by make and EV_type
SELECT Make, `Electric Vehicle Type`, AVG(`Electric Range`) AS average_ev_range
FROM electric_vehicle_population_data
GROUP BY Make, `Electric Vehicle Type` 
ORDER BY average_ev_range DESC;

-- Average EV range by make and Model
SELECT Make, Model, AVG(`Electric Range`) AS average_ev_range
FROM electric_vehicle_population_data
GROUP BY Make, Model 
ORDER BY average_ev_range DESC;

-- Average EV range for Chevrolet
SELECT Make, `Model Year`, AVG(`Electric Range`) AS average_ev_range
FROM electric_vehicle_population_data
WHERE Make = 'CHEVROLET' 
GROUP BY `Model Year`
HAVING AVG(`Electric Range`) > 0
ORDER BY `Model Year`

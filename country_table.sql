--Creating country table
/*
CREATE TABLE IF NOT EXISTS country_table(
country_name TEXT);

--Adding a primary key to country table
ALTER TABLE country_table
ADD COLUMN country_id SERIAL PRIMARY KEY;

--Adding data into country_table using ramen_table
INSERT INTO country_table(
SELECT DISTINCT country
FROM ramen_table);
*/

SELECT * 
FROM country_table;

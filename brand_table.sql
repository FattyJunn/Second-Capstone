--Creating brand_table
/*
DROP TABLE IF EXISTS brand_table;
CREATE TABLE IF NOT EXISTS brand_table(
brand_name TEXT);
*/
--Getting data from ramen_table into brand_table
/*
INSERT INTO brand_table
SELECT DISTINCT brand
FROM ramen_table
ORDER BY brand;
*/
--Adding a primary key to the table
/*
ALTER TABLE brand_table
ADD COLUMN brand_id SERIAL PRIMARY KEY;
*/


--Getting data from ramen_table for brand_table
/*
UPDATE ramen_table SET brand_id = brand_table.brand_id
FROM brand_table
WHERE ramen_table.brand = brand_table.brand_name;
*/


SELECT * 
FROM brand_table;

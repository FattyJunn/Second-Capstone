
--Adding style_id into ramen_table to reference from style_table
/*
ALTER TABLE ramen_table
ADD COLUMN style_id INT;
*/

--Adding country_id for ramen_table
/*
ALTER TABLE ramen_table
ADD COLUMN country_id INT;
*/

--Adding brand_id for ramen_table
/*
ALTER TABLE ramen_table
ADD COLUMN brand_id INT;
*/


--Updating style id for ramen_table in reference from style_table
/*
UPDATE ramen_table 
SET style_id = 
(
    SELECT style_id 
    FROM style_table
    WHERE style_name = ramen_table.style
);
*/

--Updating country_id for ramen_table in reference from country_table
/*
UPDATE ramen_table 
SET country_id = 
(
    SELECT country_id 
    FROM country_table
    WHERE country_name = ramen_table.country
);

*/
--Updating brand_id for ramen_table in reference from brand_table
/*
UPDATE ramen_table 
SET brand_id = 
(
    SELECT brand_id 
    FROM brand_table
    WHERE brand_name = ramen_table.brand
);
*/

--Dropping column for country
/*
ALTER TABLE ramen_table
DROP COLUMN country;
*/

--Dropping column for brand
/*
ALTER TABLE ramen_table
DROP COLUMN brand;
*/

--Dropping column for style
/*
ALTER TABLE ramen_table
DROP COLUMN style;
*/


--Updating blank values in top_ten
/*
UPDATE ramen_table
SET top_ten = 'Not listed'
WHERE top_ten = '';
*/

--To select in top ten order
/*
SELECT * FROM ramen_table
ORDER BY top_ten
;
*/

--1)
--Using joins to select top 100 ONLY bowl style ramen
SELECT 
ramen_table.variety, 
style_table.style_name, 
ramen_table.stars,
ramen_table.top_ten,
brand_table.brand_name
FROM ramen_table
INNER JOIN style_table
ON ramen_table.style_id = style_table.style_id
INNER JOIN brand_table
ON ramen_table.brand_id = brand_table.brand_id
WHERE (ramen_table.stars = '5' OR ramen_table.stars LIKE '4%')
AND style_table.style_name = 'Bowl'
ORDER BY ramen_table.stars DESC
LIMIT 100;

--2)
--Using joins to select top 100 ONLY Cup style ramen
SELECT 
ramen_table.variety, 
style_table.style_name, 
ramen_table.stars,
ramen_table.top_ten,
brand_table.brand_name
FROM ramen_table
INNER JOIN style_table
ON ramen_table.style_id = style_table.style_id
INNER JOIN brand_table
ON ramen_table.brand_id = brand_table.brand_id
WHERE (ramen_table.stars = '5' OR ramen_table.stars LIKE '4%')
AND style_table.style_name = 'Cup'
ORDER BY ramen_table.stars DESC
LIMIT 100;

--3)
--Using joins to select top 100 ONLY Pack style ramen
SELECT 
ramen_table.variety, 
style_table.style_name, 
ramen_table.stars,
ramen_table.top_ten,
brand_table.brand_name
FROM ramen_table
INNER JOIN style_table
ON ramen_table.style_id = style_table.style_id
INNER JOIN brand_table
ON ramen_table.brand_id = brand_table.brand_id
WHERE (ramen_table.stars = '5' OR ramen_table.stars LIKE '4%')
AND style_table.style_name = 'Pack'
ORDER BY ramen_table.stars DESC
LIMIT 100;

--4)
--Using joins to select top 100 ONLY Tray style ramen
SELECT 
ramen_table.variety, 
style_table.style_name, 
ramen_table.stars,
ramen_table.top_ten,
brand_table.brand_name
FROM ramen_table
INNER JOIN style_table
ON ramen_table.style_id = style_table.style_id
INNER JOIN brand_table
ON ramen_table.brand_id = brand_table.brand_id
WHERE (ramen_table.stars = '5' OR ramen_table.stars LIKE '4%')
AND style_table.style_name = 'Tray'
ORDER BY ramen_table.stars DESC
LIMIT 100;

--5)
--To select top10 awarded ramen limit to 50
SELECT
ramen_table.variety,
ramen_table.top_ten,
ramen_table.stars,
style_table.style_name,
brand_table.brand_name,
country_table.country_name
FROM ramen_table
INNER JOIN style_table
ON ramen_table.style_id = style_table.style_id
INNER JOIN country_table
ON ramen_table.country_id = country_table.country_id
INNER JOIN brand_table
ON ramen_table.brand_id = brand_table.brand_id
WHERE stars = '5' OR stars LIKE '4%'
ORDER BY top_ten
LIMIT 50;

--6)
--Finding out which country produces which brand
SELECT
DISTINCT ON (brand_table.brand_name) brand_table.brand_name,
ramen_table.variety,
country_table.country_name
FROM ramen_table
INNER JOIN country_table
ON ramen_table.country_id = country_table.country_id
INNER JOIN brand_table
ON ramen_table.brand_id = brand_table.brand_id
ORDER BY brand_name;

--7)
--Comparing Japan and Korea ramen
SELECT
ramen_table.variety,
ramen_table.top_ten,
ramen_table.stars,
country_table.country_name
FROM ramen_table
INNER JOIN country_table
ON ramen_table.country_id = country_table.country_id
WHERE (country_table.country_name = 'Japan' OR country_table.country_name = 'South Korea')
AND ramen_table.top_ten != 'Not listed'
ORDER BY top_ten DESC;


--8)
-- SELECT all from ramen_table
SELECT * 
FROM ramen_table
ORDER BY review_id;
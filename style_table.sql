--Creating style_table
/*
CREATE TABLE IF NOT EXISTS style_table(
	style_name TEXT);
*/


/*
INSERT INTO style_table (style_name)
(SELECT DISTINCT style
FROM ramen_table
ORDER BY style)
;
*/

--Deleting blanks for style_id in style_table
/*
DELETE FROM style_table
WHERE style_name = ''
;
*/

--Adding a primary key into style_table
/*
ALTER TABLE style_table
ADD COLUMN style_id SERIAL PRIMARY KEY;
*/

SELECT *
FROM style_table;
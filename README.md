# My Second Capstone
## Analysis on Ramen
###### Dashboard in excel
![Imgur](https://imgur.com/JBzIwiw.png)

#### Entity Relationship Diagram
![Imgur](https://imgur.com/P0l2mQd.png)
#### Schema Diagram
![Imgur](https://imgur.com/nPiy9qY.png)


# Some Examples of the SELECT I've used.
#### Using joins to select top 100 ONLY bowl style ramen
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

#### To select top10 awarded ramen limit to 50
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

#### Finding out which country produces which brand
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

#### Comparing Japan and Korea ramen
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


# Changes made from raw data
- Data cleaning (removing blanks using SQL query).
- Importing CSV data into SQL.
- Exporting SELECT queries in SQL into CSV to do analysis.
- Renaming some of the columns data.
- Data normalisation up to 3NF.
- Making charts from the SELECT queries export.


## Personal Thoughts
After doing my second capstone, I have realised that datas can be cleaned and sorted out with different methods.
For this capstone, I have been instructed to use SQL to do my analysis.
As compared to using excel, SQL can do a better/faster job if you are good in writing the correct queries.
SQL also does help to create a new view/table which helps in doing analysis better.
By selecting different table using JOINS to create a new table helps with analysing the data better.
Hope that I'll able to do better for my next project.



[Link to dataset used](https://www.kaggle.com/datasets/residentmario/ramen-ratings)


Below is a link to my Linked In.

[Linkedin Link](https://www.linkedin.com/in/see-jun-wong-b33922263/)



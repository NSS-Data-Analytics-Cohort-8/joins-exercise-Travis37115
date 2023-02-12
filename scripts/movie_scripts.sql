-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.
SELECT specs.film_title, specs.release_year, revenue.worldwide_gross
FROM specs
INNER JOIN revenue ON specs.movie_id=revenue.movie_id
ORDER BY worldwide_gross ASC;
-- answer is Semi-Tough grossing 37187139

-- 2. What year has the highest average imdb rating?
SELECT release_year, MAX(rating.imdb_rating) AS avg_rating
FROM rating
INNER JOIN specs ON specs.movie_id=rating.movie_id
GROUP BY release_year 
ORDER BY avg_rating DESC;
--answer is 2008 having the highest rating 

-- 3. What is the highest grossing G-rated movie? Which company distributed it?
SELECT distributors.company_name, revenue.worldwide_gross, specs.mpaa_rating, film_title
FROM distributors
INNER JOIN specs 
ON distributors.distributor_id=specs.domestic_distributor_id
INNER JOIN revenue
ON specs.movie_id=revenue.movie_id
WHERE mpaa_rating = 'G'
ORDER BY worldwide_gross DESC
--answer Toy Story is the highest "g-rated movie"

-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
-- table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.
SELECT distributors.company_name, COUNT(specs.film_title)
FROM distributors
LEFT JOIN specs 
ON specs.domestic_distributor_id = distributors.distributor_id
GROUP BY distributors.company_name
ORDER BY distributors.company_name

-- 5. Write a query that returns the five distributors with the highest average movie budget.
SELECT DISTINCT distributors.company_name, revenue.film_budget 
FROM distributors 
CROSS JOIN revenue 
ORDER BY revenue.film_budget DESC;
--answer is 20th century Fox, The H Collective, Icon Productions, Fox Searchlight Pictures, New Line Cinema

-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?
SELECT distributors.company_name, distributors.headquarters, rating.imdb_rating, specs.film_title
FROM


-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?
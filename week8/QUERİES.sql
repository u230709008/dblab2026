# 1. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.
select title, votes, year 
from movies 
where votes > 50000 and year < 2000 and
movie_id in 
(select movie_id from movie_directors join directors on movie_directors.director_id
where director_name like "Quentin");
# 2. Show the films that Tom Hanks has act and have won more than 3 Oscars.
select m.title, m.oscars, s.star_name
from movies m 
join movie_stars ms on m.movie_id = ms.movie_id
join stars s on ms.star_id = s.star_id
where s.star_name = "Tom Hanks" and m.oscars > 3;

# 3. Show the history films produced in USA and whose duration is between 100-200 minutes.
SELECT
    m.title,
    m.duration,
    g.genre_name,
    c.country_name
FROM movies m
JOIN genres g
    ON m.movie_id = g.movie_id
JOIN producer_countries pc
    ON m.movie_id = pc.movie_id
JOIN countries c
    ON c.country_id = pc.country_id
WHERE g.genre_name = 'History'
    AND c.country_name = 'USA'
    AND m.duration BETWEEN 100 AND 200
LIMIT 0, 1000;
# 4.Compute the average budget of the films directed by Peter Jackson.
select AVG(m.budget) as avg_budget
from movies m 
join movie_directors md on m.movie_id = md.movie_id
join directors d on d.director_id = md.director_id
where d.director_name = "Peter Jackson";
# 5.Show the Francis Ford Coppola film that has the maximum budget.
select m.title, m.budget
from movies m
join movie_directors md on m.movie_id = md.movie_id
join directors d on d.director_id = md.director_id
where d.director_name = "Francis Ford Coppola"
order by m.budget desc 
limit 1;

# 6.Show the film that has the most vote and has been produced in USA.

# 7. List all stars who have acted in more than 1 films


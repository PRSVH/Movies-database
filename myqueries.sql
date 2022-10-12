-----------------------------------------------------------------------------------------
--Only used for COMP2400 students in S2 2022
--Please input your UID here: U7522927
------------------------------------------------------------------------------------------

-- Q1.1  List the ids of persons whose last name starts with ‘Y’.


SELECT id FROM PERSON 
WHERE LAST_NAME LIKE 'Y%';

--Q 1.1a How many persons are there in this database? List that number.
SELECT count(id)
FROM person;






-- Q1.2 How many movies were categorised in the ‘PG-13’ restriction in USA? List that number.


SELECT COUNT(*) as "Number of movies categorised in the PG13 restriction in USA"
FROM RESTRICTION 
WHERE DESCRIPTION='PG-13' AND COUNTRY='USA';




-- Q1.3 How many restriction categories each country has? List the countries and the corresponding numbers of restriction categories. Order your result in the descending order of the numbers of restriction categories.


SELECT COUNT(description),country
FROM RESTRICTION_CATEGORY
GROUP BY RESTRICTION_CATEGORY.country
ORDER BY COUNT(description) DESC;

--Q1.3a Which writers have won a writer award in 1994? List the ids, the first and last names of the writers along with the award names.

SELECT w.id, first_name, last_name, award_name
FROM writer_award AS w INNER JOIN person AS p
ON w.id = p.id
WHERE year_of_award = 1994 AND lower(result) = 'won';




-- Q1.4 How many movies were co-written by exactly two writers? List that number.

SELECT COUNT(*) FROM
(SELECT title,COUNT(title)
FROM WRITER
GROUP BY title, priduction_year
HAVING COUNT(title)=2) 
AS "Number of movies cowritten by 2 writers";




-- Q1.5 What is the percentage of Australian movies (i.e., movies produced in Australia) among all movies in this
--database? List the percentage as a decimal (round to two decimal places).

SELECT ROUND(((COUNT(title)*100.0)/(SELECT COUNT(title) FROM MOVIE)),2) 
AS "Percentage of Australian Movies"
FROM MOVIE
WHERE lower(country)='australia';





-- Q1.6 Which movie(s) won the largest number of crew awards in a single year? List their title(s) and production year(s).


WITH crewwins AS (SELECT title,production_year,year_of_award,count(*) As wins 
                  FROM CREW_AWARD 
                  WHERE lower(result)='won'
                  GROUP BY title,production_year,year_of_award)
SELECT DISTINCT title,production_year 
FROM crewwins 
WHERE wins= (SELECT MAX(wins) FROM crewwins);



-- Q1.7

WITH numvar AS (SELECT D.id, COUNT(DISTINCT major_genre)
                 AS numg FROM DIRECTOR D JOIN MOVIE M
                 ON D.title=M.title
                 GROUP BY D.id
                 ORDER BY COUNT(DISTINCT major_genre))
SELECT DISTINCT id FROM DIRECTOR NATURAL JOIN numvar
WHERE numg=(SELECT MAX(numg) FROM numvar);


-- Q1.8 Who is/are the most productive director(s) (i.e., who has/have directed the greatest number of movies)?
--List their id(s).
WITH DirectorNum AS (SELECT id, COUNT(*) AS num
                     FROM director
                     GROUP BY id)
SELECT id
FROM DirectorNum dn
WHERE dn.num = (SELECT MAX(num)
                FROM DirectorNum);

--Q1.9 Who have been nominated for an actor award at least twice but never won? List their ids, the first and
--last names, and order them in the ascending order of their last names.
SELECT id, first_name, last_name
FROM person
WHERE id IN (SELECT id
             FROM actor_award natural join role
             WHERE lower(result) <> 'won'
             GROUP BY id
             HAVING count(*) > 1
             EXCEPT
             SELECT id
             FROM actor_award NATURAL JOIN role
             WHERE lower(result) = 'won')
ORDER BY last_name ASC;

--Q 1.10 Find all the movies which have won exactly two movie awards. List the titles and production years of these movies
SELECT title, production_year
FROM movie_award
WHERE lower(result) = 'won'
GROUP BY title, production_year
HAVING count(*) = 2;



----------------------------------------------------------------
-- End of your answers
-----------------------------------------------------------------

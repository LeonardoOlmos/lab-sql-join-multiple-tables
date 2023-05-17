-- Leonardo Olmos Saucedo / Lab SQL Joins

-- 1. Write a query to display for each store its store ID, city, and country.
select S.STORE_ID, C.CITY, C2.COUNTRY 
from STORE S 
join ADDRESS A 
on A.ADDRESS_ID = S.ADDRESS_ID 
join CITY C 
on C.CITY_ID = A.CITY_ID 
join COUNTRY C2 
on C2.COUNTRY_ID = C.COUNTRY_ID;

-- 2. Write a query to display how much business, in dollars, each store brought in.
select S.STORE_ID, SUM(P.AMOUNT) as TOTAL_AMOUNT
from STORE S 
join INVENTORY I 
on I.STORE_ID = S.STORE_ID 
join RENTAL R 
on I.INVENTORY_ID = R.INVENTORY_ID 
join PAYMENT P 
on P.RENTAL_ID = R.RENTAL_ID 
group by S.STORE_ID;

-- 3. What is the average running time of films by category?
select C.NAME, AVG(F.`length`) as AVG_LENGTH
from FILM F 
join FILM_CATEGORY FC 
on FC.FILM_ID = F.FILM_ID 
join CATEGORY C 
on C.CATEGORY_ID = FC.CATEGORY_ID 
group by C.NAME;

-- 4. Which film categories are longest?
select C.NAME, AVG(F.`length`) as AVG_LENGTH
from FILM F 
join FILM_CATEGORY FC 
on FC.FILM_ID = F.FILM_ID 
join CATEGORY C 
on C.CATEGORY_ID = FC.CATEGORY_ID 
group by C.NAME
order by 2 desc 
limit 1;

-- 5. Display the most frequently rented movies in descending order.
select F.TITLE, COUNT(R.INVENTORY_ID) as RENTAL_FREQ
from FILM F 
join INVENTORY I 
on I.FILM_ID = F.FILM_ID 
join RENTAL R 
on R.INVENTORY_ID = I.INVENTORY_ID
group by F.TITLE 
order by 2 desc;

-- 6. List the top five genres in gross revenue in descending order.
select C.NAME, SUM(P.AMOUNT) as 'GROSS_REVENUE'
from CATEGORY C 
join FILM_CATEGORY FC 
on C.CATEGORY_ID = FC.CATEGORY_ID 
join FILM F 
on FC.FILM_ID = F.FILM_ID 
join INVENTORY I 
on F.FILM_ID = I.FILM_ID 
join RENTAL R 
on I.INVENTORY_ID = R.INVENTORY_ID 
join PAYMENT P 
on R.RENTAL_ID = P.RENTAL_ID 
group by C.NAME 
order by 2 desc 
limit 5;

-- 7. Is "Academy Dinosaur" available for rent from Store 1?
select *
from FILM F 
join INVENTORY I 
on F.FILM_ID = I.FILM_ID 
left join RENTAL R 
on I.INVENTORY_ID = R.INVENTORY_ID 
where F.TITLE = 'Academy Dinosaur'
and R.RENTAL_ID is NULL 
and I.STORE_ID = 1;

-- NO, THERE IS NO AVAILABLE FOR RENT IN STORE 2


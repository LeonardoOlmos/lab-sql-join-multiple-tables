-- Leonardo Olmos Saucedo / SQL Self and Cross join lab

-- 1. Get all pairs of actors that worked together.
select distinct F.TITLE, FA.ACTOR_ID, A.FIRST_NAME, FA2.ACTOR_ID, A2.FIRST_NAME
from FILM_ACTOR FA 
join FILM_ACTOR FA2 
on FA.FILM_ID  = FA2.FILM_ID 
join ACTOR A 
on A.ACTOR_ID = FA.ACTOR_ID 
join ACTOR A2
on A2.ACTOR_ID = FA2.ACTOR_ID 
join FILM F  
on FA.FILM_ID = F.FILM_ID 
where FA.ACTOR_ID < FA2.ACTOR_ID
order by 1, 2, 4;

-- 2. Get all pairs of customers that have rented the same film more than 3 times.
select DISTINCT R.CUSTOMER_ID, R2.CUSTOMER_ID, COUNT(*) as COINCIDENCES
from RENTAL R 
join INVENTORY I 
on R.INVENTORY_ID = I.INVENTORY_ID 
join FILM F 
on I.FILM_ID = F.FILM_ID 
join FILM F2 
on F.FILM_ID = F2.FILM_ID 
join INVENTORY I2 
on F2.FILM_ID = I2.FILM_ID 
join RENTAL R2 
on R2.INVENTORY_ID = I2.INVENTORY_ID 
where R.CUSTOMER_ID <> R2.CUSTOMER_ID 
group by R.CUSTOMER_ID , R2.CUSTOMER_ID 
having COUNT(*) > 3
order by 1, 2 ;

-- 3. Get all possible pairs of actors and films.
select A.ACTOR_ID, A.FIRST_NAME, F.TITLE 
from ACTOR A 
cross join FILM F 
order by 1;
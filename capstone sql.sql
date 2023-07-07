/*
Credit_Card_dataset

I had raw data.There were some missing values in that data.
Then I filled thise missing values by using pandas library in python.
Then I cleaned the data.After that Import the cleaned data into mysql.*/


/*
1. Group the customer based on their income type and the find  the average of their annual income.
*/
SELECT * FROM credit_Card ;
SELECT Type_income, round(AVG(annual_income),2) AS average_income
FROM  credit_Card 
GROUP BY Type_income;


/*2
find the female owners of car and property.
*/
select * from  credit_Card  where Car_Owner="Y" and Propert_Owner="Y" and GENDER="F";


/* 3
Find the male customers who are staying with their family.
*/
select * from credit_Card  where GENDER="M" and Family_Members!=0;



/* 4
Please list the top five people having highest income.
*/
SELECT * from credit_Card 
ORDER BY Annual_income DESC
LIMIT 5;

/*
5.
How many married people are having bad credit?
*/
select Marital_status,count(*) as "married people count" from credit_Card  where Marital_status="Married" and label="0";


/* 
6.
What is the highest eduaction level and what is the total count?    
*/
select distinct EDUCATION from credit_Card;
select EDUCATION,count(*) total_count from credit_Card  where EDUCATION ='Academic Degree' ;


/* 
7.
Betwwen married male and females who is having more bad credit card
*/
SELECT gender, marital_status, COUNT(*) AS bad_credit_cards
from credit_Card 
WHERE label=0
AND marital_status = 'married'
GROUP BY gender, marital_status
order by bad_credit_cards DESC limit 1;
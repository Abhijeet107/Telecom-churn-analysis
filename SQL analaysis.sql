create database churn;

use churn;

select * from telecom_churn;

-- SQL query for reporting
-- 1. How many total customers are there?

select count(*) as Total_customers 
from telecom_churn;

-- 2. What is the churn rate?

select (sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100 as churn_rate_percentage
from telecom_churn;

-- 3. Number of customers per telecom parttner

select telecom_partner, count(*) as number_of_customers
from telecom_churn
group by telecom_partner
order by number_of_customers desc;

-- 4. Average salary of churned vs non-churned customers

select churn, avg(estimated_salary) as avg_salary
from telecom_churn
group by churn;

-- 5. States with the highest numbers of churned customers

Select state, count(*) as churned_customers
from telecom_churn
where churn ='Yes'
group by state
order by churned_customers desc
limit 5 ;

-- 6. Age distribution: Average age of churned vs non- churned customers

select churn, avg(age) as avg_age
from telecom_churn
group by churn;

-- 7. Total data usage (GB) per telecom partner

select telecom_partner, sum(data_used) as total_data_used
from telecom_churn
group by telecom_partner
order by total_data_used desc;

-- 8. Customer Registration by month

SELECT month(date_of_registration) as registration_month,
count(*) as number_of_registrations
from telecom_churn
group by registration_month
order by registration_month;

-- 9. Churn rate by gender

select gender, (sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100 as churn_rate_percentage
from telecom_churn
group by gender;

-- 10. Top 5 cities with highest churned customers

select city, count(*) as churned_customers
from telecom_churn
where churn = 'Yes'
group by city
order by churned_customers desc
limit 5;

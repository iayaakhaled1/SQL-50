## Question 1: 2356. Number of Unique Subjects Taught by Each Teacher


**Solution:**
```SELECT 
teacher_id,
count(distinct subject_id) as cnt
FROM Teacher
GROUP BY teacher_id
```
----------------------------------------------------------------------------------------------------------------------------

## Question 2: 1141. User Activity for the Past 30 Days I

## Hint 
```To effectively solve this SQL challenge, the rule states that we need to consider a 30-day period ending on 2019-07-27. Hence, the date condition should cover the preceding 29 days, not 30.```
**Solution:**
```with total_activities_per_user_cte as (
SELECT 
 user_id,
 activity_date,
 sum(case when activity_type is not null then 1 else 0 end) as total_activities
FROM Activity
WHERE activity_date between   
      DATE_ADD('2019-07-27', INTERVAL -29 DAY)  
  AND '2019-07-27'
  GROUP BY user_id,
 activity_date)
 SELECT 
  activity_date as day,
  count(distinct user_id) as active_users
 FROM 
   total_activities_per_user_cte
WHERE total_activities > 0 
GROUP BY activity_date
```

----------------------------------------------------------------------------------------------------------------------------

## 1045. Customers Who Bought All Products

```with count_all_prod as (
SELECT count(distinct product_key) as total_prods
FROM Product
) , 
total_prod_per_cust as (
 SELECT customer_id, count(distinct product_key) as total_prod
 FROM Customer
 GROUP BY customer_id
)
SELECT 
 distinct customer_id
FROM count_all_prod,total_prod_per_cust
where total_prods = total_prod
```

----------------------------------------------------------------------------------------------------------------------------

## 619. Biggest Single Number
```
with cte as (
SELECT 
  num
  FROM MyNumbers
GROUP BY num
having count(*) = 1  )

SELECT 
      max(num) as num 
from cte 
```

----------------------------------------------------------------------------------------------------------------------------
## 596. Classes More Than 5 Students
```
SELECT 
class
FROM Courses
GROUP BY class
having count(distinct student) >= 5
```

----------------------------------------------------------------------------------------------------------------------------

## 1729. Find Followers Count
```
SELECT user_id , count(distinct follower_id) as followers_count
from followers
group by user_id
```
----------------------------------------------------------------------------------------------------------------------------

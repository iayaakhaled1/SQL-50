# LeetCode Questions and Answers

## Question 1: 1075. Project Employees I

### Solution:
```
SELECT 
  p.project_id,
  round(sum(experience_years) / count(distinct p.employee_id),2) as average_years
FROM Project p 
INNER JOIN Employee e 
ON p.employee_id = e.employee_id 
GROUP BY   p.project_id
```


##  620. Not Boring Movies

### Solution:
```
SELECT *
FROM Cinema
where id % 2 != 0 
and lower(description) !=  'boring'
ORDER BY rating DESC
```


## 1251. Average Selling Price
# Write your MySQL query statement below

-- The main point to solve this is to use the given equation instead of using the average function
-- also (and us.purchase_date between pr.start_date AND pr.end_date)
-- The condition should be included in the join condition rather than in the WHERE clause because adding it to the WHERE clause would result in filtering out records that have no sold quantity.

 -- get total Qty solid * price of product 
with product_total_price_cte as (
SELECT 
  pr.product_id,
  us.purchase_date,
  us.units * pr.price as product_total_price,
  units as total_products_sold
FROM Prices as pr 
LEFT JOIN UnitsSold us 
ON pr.product_id = us.product_id
and us.purchase_date between pr.start_date AND pr.end_date

)
-- Average selling price = Total Price of Product / Number of products sold.
SELECT product_id , 
       ifnull(
         round(sum(product_total_price) / sum(total_products_sold),2),0) as average_price
FROM product_total_price_cte
group by product_id ```



##  1633. Percentage of Users Attended a Contest

### Solution:
```
with total_users_per_contest as (
 SELECT 
  contest_id,
  count(distinct user_id) as total_users_per_contest
 FROM Register
  group by contest_id
)
 , 
 total_users as (
  SELECT count(distinct user_id) as total_users 
  from Users 
 )

 SELECT 
     contest_id,
     round((total_users_per_contest * 100) / total_users,2) as percentage
 FROM total_users_per_contest , total_users
 ORDER BY percentage DESC , contest_id ASC 
```



##  1934. Confirmation Rate

### Solution:
```
SELECT 
 u.user_id,
 round(
   sum(CASE WHEN  action = 'confirmed' THEN 1 else 0 end)  / count(*),2) confirmation_rate
FROM Signups u 
LEFT JOIN Confirmations c 
on u.user_id = c.user_id
GROUP BY  u.user_id
```




##  1193. Monthly Transactions I

### Solution:
```

SELECT 
 DATE_FORMAT(trans_date, '%Y-%m')  as month ,
 country,
 count(id) as trans_count,
 sum(case when state = 'approved' then 1 else 0 end) as approved_count,
 sum(amount) as trans_total_amount,
 sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
FROM Transactions
group by  month ,
         country
```



## 1174. Immediate Food Delivery II

### Solution:
```
# Write your MySQL query statement below

with first_order as 
(
SELECT *,
      case when order_date = customer_pref_delivery_date
      then 'immediate' else 'scheduled' end as order_type,
      row_number() over(partition by customer_id order by order_date asc ) as first_order_rank
from Delivery ) 

SELECT 
round(
 sum(CASE WHEN order_type = 'immediate' then 1 else 0 end ) * 100
 / count(*)
 ,2) as immediate_percentage
FROM first_order
where first_order_rank = 1 
```

## 550. Game Play Analysis IV
### Solution:
```


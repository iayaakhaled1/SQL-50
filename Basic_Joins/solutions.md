# LeetCode Solutions

This repository contains my solutions to LeetCode questions.

------------------------------------------------------------------------------------------------------------------------

## Question 1: [1378. Replace Employee ID With The Unique Identifier](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/)

**Solution:**


SELECT 
 un.unique_id , emp.name
FROM Employees emp 
LEFT JOIN EmployeeUNI un
ON un.id = emp.id 

------------------------------------------------------------------------------------------------------------------------

## Question 2: [product-sales-analysis](https://leetcode.com/problems/product-sales-analysis-i/?envType=study-plan-v2&envId=top-sql-50)

**Solution:**

SELECT 
  p.product_name,
  s.year,
  s.price
FROM Sales as s 
LEFT JOIN Product as p 
ON p.product_id = s.product_id

------------------------------------------------------------------------------------------------------------------------

## Question 3: [1581. Customer Who Visited but Did Not Make Any Transactions](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/?envType=study-plan-v2&envId=top-sql-50)

**Solution:**

SELECT 
customer_id , 
count(*) as count_no_trans
FROM Visits as v 
LEFT JOIN Transactions tr 
on v.visit_id = tr.visit_id
where tr.transaction_id is null 
GROUP BY customer_id


------------------------------------------------------------------------------------------------------------------------

## Question 4: [197. Rising Temperature](https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&envId=top-sql-50)

**Solution:**

with cte as (
SELECT 
 id , 
 recordDate as current_recordDate,
 temperature as current_temperature, 
 LAG(recordDate) OVER(ORDER BY recordDate) as prev_recordDate,
 LAG(temperature) OVER(ORDER BY recordDate) as prev_temperature
FROM Weather ) 
SELECT 
 id
FROM cte 
where current_temperature > prev_temperature
and DATEDIFF(current_recordDate,prev_recordDate) = 1

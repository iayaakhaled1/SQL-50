# LeetCode Solutions

This repository contains my solutions to LeetCode questions.

---

## Question 1: [1757. Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/)

**Solution:**

SELECT 
distinct product_id
FROM Products
WHERE low_fats = 'Y'
AND recyclable = 'Y'

------------------------------------------------------------------------------------------------------------------------------------------------

## Question 2: [584. Find Customer Referee](https://leetcode.com/problems/find-customer-referee/?envType=study-plan-v2&envId=top-sql-50)

**Solution:**

  SELECT  name
  FROM Customer
  where ifnull(referee_id,0) != 2 

------------------------------------------------------------------------------------------------------------------------------------------------

## Question 3: [595. Big Countries](https://leetcode.com/problems/big-countries/?envType=study-plan-v2&envId=top-sql-50)

**Solution:**

SELECT 
name,
population,
area  
fROM World
where area >= 3000000
OR population >= 25000000

------------------------------------------------------------------------------------------------------------------------------------------------

## Question 4: [1148. Article Views I](https://leetcode.com/problems/article-views-i/?envType=study-plan-v2&envId=top-sql-50)

**Solution:**


SELECT 
 author_id as id 
FROM Views 
where author_id = viewer_id
GROUP BY author_id ,viewer_id
having count(*) >= 1 
ORDER BY author_id asc 

------------------------------------------------------------------------------------------------------------------------------------------------

## Question 5: [1683. Invalid Tweets](https://leetcode.com/problems/invalid-tweets/?envType=study-plan-v2&envId=top-sql-50)

**Solution:**


SELECT 
distinct tweet_id
FROM Tweets 
WHERE LENGTH(content) > 15


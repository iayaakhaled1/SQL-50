### 1075. Project Employees I
```SELECT 
  p.project_id,
  round(sum(experience_years) / count(distinct p.employee_id),2) as average_years
FROM Project p 
INNER JOIN Employee e 
ON p.employee_id = e.employee_id 
GROUP BY   p.project_id```


### 620. Not Boring Movies
<SELECT *
FROM Cinema
where id % 2 != 0 
and lower(description) !=  'boring'
ORDER BY rating DESC>
#------------------------------------------------------------------------------#


#------------------------------------------------------------------------------#
### 1633. Percentage of Users Attended a Contest

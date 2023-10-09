### 620. Not Boring Movies
```SELECT *
FROM Cinema
where id % 2 != 0 
and lower(description) !=  'boring'
ORDER BY rating DESC ```


### 1251. Average Selling Price

-- Q1 How many restaurants have a rating greater than 4.5

select count(distinct restaurant_name) as restaurant_count from swiggy50
where rating > 4.5;


-- Q2 which is the top 1 city with the highest number of restaurants

select city, count(distinct restaurant_name) as restaurant_count from swiggy50
group by city
order by restaurant_count;


-- Q3 How many restaurants have the word 'Pizza' in their name

select count(distinct restaurant_name) as restaurant_count from swiggy50
where restaurant_name like "%pizza%";


-- Q4 What is the most common cuisine among the restaurants in the dataset

select cuisine, count(distinct restaurant_name) as cuisine_count from swiggy50
group by cuisine
order by cuisine_count desc;


-- Q5 What is the average rating of restauarnts in each city

select city, round(avg(rating),2) as avg_rating from swiggy50
group by city;


-- Q6 What is the highest price of item under the 'RECOMMENDED' menu category for each restaurant

select distinct restaurant_name, item, menu_category, max(price) as max_price from swiggy50
where menu_category = 'Recommended'
group by item, restaurant_name
order by max_price desc;	


-- Q7 Find the top 5 most expensive restaurants that offer cuisine other than indian cuisine

select distinct restaurant_name, cuisine, cost_per_person as cost from swiggy50
where cuisine <> "Indian"  
order by cost_per_person desc;


-- Q8 Find the restaurants that have an average cost which is higher than the total average cost of all restaurants together

select distinct restaurant_name, cost_per_person from swiggy50
where cost_per_person > (select avg(cost_per_person) from swiggy50);


-- Q9 Retrive the details of restaurants that have same name but are located in different cities

select restaurant_name, city from swiggy50 
group by restaurant_name,city order by restaurant_name;


-- Q10 Which restaurant offers the most number of items in the 'MAIN COURSE' category

select distinct restaurant_name, menu_category, count(item) as item_count from swiggy50 
where menu_category = "main course"
group by menu_category, restaurant_name
order by item_count desc;


-- Q11 List the names of restaurants that are 100% vegetarian in alphabetical order of restaurant name

select distinct restaurant_name,veg_or_nonveg from swiggy50 where veg_or_nonveg = 'veg'
order by restaurant_name;


-- Q12 Which is the restaurant providing the lowest average price for all items

select distinct restaurant_name, avg(price) as average from swiggy50 
group by restaurant_name
order by average limit 1; 


-- Q13 Which top 5 restaurants offers highest number of categories

select distinct restaurant_name, count(distinct menu_category) as category_count from swiggy50
group by restaurant_name 
order by category_count desc limit 5;


-- Q14 Which restaurant provides the highest percentage of non-vegetarian food

select distinct restaurant_name, veg_or_nonveg, (count(veg_or_nonveg)/26181)*100 as count from swiggy50
where veg_or_nonveg = 'Non-veg'
group by restaurant_name
order by count desc;
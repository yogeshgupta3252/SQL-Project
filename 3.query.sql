-- 1.Total orders palced per customer
select count(*) as order_count, customer_id
from orders
group by customer_id;

-- 2.Total quantity purchased per customer
select customer_id, sum(quantity) as total_unit
from orders
group by customer_id;	


-- 3.Revenue per customer
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(o.quantity * p.unit_price) AS revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    c.customer_id
ORDER BY revenue DESC;

-- 4. 4th monthly revenue trend

select sum(o.quantity*p.unit_price) as revenue, date_format(order_date,'%y-%m') as month 
from orders o 
join products p on 
o.product_id=p.product_id
group by month
order by month desc;

-- 5. Top selling product
select p.name,sum(o.quantity) as unit_sold
from orders o
join products p on
o.product_id=p.product_id
group by p.name
order by unit_sold desc
limit 5;

-- 6. product never ordered
select product_id, name from products
where product_id not in
(select distinct product_id from orders);

-- 7. Average basket size per customer
select avg(quantity) as avg_quant, customer_id
from orders
group by customer_id;

-- 8. Total Revenue by profuct category
select p.category, round(sum(o.quantity * p.unit_price),2) as revenue
from orders o
join products p on 
p.product_id = o.product_id
group by category
order by revenue desc;

-- 9. daily orders and revenue for a given week ( 2024-06-07)- (2024-06-13)
select o.order_date, count(*) as orders, sum(o.quantity * p.unit_price) as revenue
from orders o
join products p on 
p.product_id = o.product_id
where order_date between '2024-06-07' and '2024-06-13'
group by order_date;

-- 10. 10 avg order value
select round(sum(o.quantity * p.unit_price),2)/count(distinct order_id) as avg_order_value
from orders o
join products p on 
p.product_id = O.product_id;







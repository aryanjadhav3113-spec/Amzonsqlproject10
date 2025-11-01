create database retail_orders;
use  retail_orders;
create table orders(
id int primary key,
customer_id varchar(100),
order_date date,
order_amount decimal(10,2)
);	
insert into orders(id,customer_id,order_date,order_amount) values
('19','C101','2025-03-01',309),
('14','C120','2025-04-02',930),
('90','C210','2025-05-12',450),
('13','C102','2025-09-21',520),
('10','C301','2025-04-08',680);
SELECT * FROM ORDERS;
select 
    id,
    customer_id,
    order_date,
    order_amount,
    sum(order_amount) over(
    partition by customer_id
    order by order_date
    ) as cumulative_orders
    from orders;
    
    select 
    sum(order_amount) OVER (
    PARTITION BY customer_id,MONTH(order_date)
    ORDER BY order_date
) AS monthly_cumulative
from orders;

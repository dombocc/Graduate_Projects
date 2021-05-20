
-- Total customers/transactions Q1 2020
select sum(Daily_cust_count) as Q1_cust_count
from (
    select count(customer_number) as Daily_cust_count
    from (
        select trans_date, customer_number
        from (
            -- Only get Q1 2020 results
            select *
            from transactions_inv
            where trans_date < "2020-04-01"
            )
        group by trans_date, customer_number
        )
    group by trans_date
    )
;
-- Q1 2020 = 92289 customers


-- Total itmes sold Q1 2020
select count(*) as q1_items_sold
from (
    -- Only get Q1 2020 results
    select *
    from transactions_inv
    where trans_date < "2020-04-01"
    )
;
-- Q1 2020 = 2813094 Items Sold 

-- Total sales
select round(sum(price),2) as q1_items_sold
from (
    -- Only get Q1 2020 results
    select *
    from transactions_inv
    where trans_date < "2020-04-01"
    )
; 
-- Q1 2020 = $9,630,415.48 in sales


create table sold as
select *
from (
    select sku, count(sku) as sold
    from (
        -- Only get Q1 2020 results
        select *
        from transactions_inv
        where trans_date < "2020-04-01"
        )
    group by sku
    order by count(sku) desc
    )
;

select * from sold;

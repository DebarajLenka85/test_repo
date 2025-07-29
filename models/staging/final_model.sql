{{ config(materialized='table') }}

with customers as (
    select 
        customer_id,
        first_name,
        last_name
    from {{ref('customer')}}
),
orders as (
    select 
        order_id,
        customer_id,
        order_date,
        status
    from {{ref('order_data')}}
),

customer_order as (
    select 
        c.customer_id,
        c.first_name,
        c.last_name,
        max(o.order_date) as recent_order_date,
        nvl(count(o.order_id), 0) as total_orders
    from customers c 
    left join orders o using (customer_id)
    group by c.customer_id, c.first_name, c.last_name
)

select * from customer_order

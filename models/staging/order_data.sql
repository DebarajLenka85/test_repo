{{ config(materialized='table') }}

with s2 as (
    select 
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    from {{source('db_shared_schema', 'raw_order')}}
)
select * from s2

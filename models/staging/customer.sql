{{ config(materialized='table') }}

with s1 as (
    select
        id as customer_id,
        first_name,
        last_name
    from {{ source('db_shared_schema', 'raw_customer') }}
)

select * from s1

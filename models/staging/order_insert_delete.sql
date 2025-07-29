{{ config(materialized="incremental", 
unique_key='order_id', 
incremental_strategy="delete+insert"
) }}
select * from {{ref('order_data')}} where order_id in (1,2,3,4)

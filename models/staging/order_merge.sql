{{ config(
materialized="incremental",
unique_key ='id',
incremental_strategy= "merge"
) 
}}

select * from {{source('db_shared_schema', 'raw_order')}}
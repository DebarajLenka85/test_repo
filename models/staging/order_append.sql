{{ config (materialized = 'incremental', incremental_strategy = 'append') }}
select * from {{source('db_shared_schema', 'raw_order')}}
where id in (1,2,3,4)
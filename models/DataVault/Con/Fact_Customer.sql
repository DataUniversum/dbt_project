{{ config(
    materialized='incremental',
    unique_key='date'
) }}

with customer_count as (
    select 
        sdts as date
        ,count(*) as customer_count
        ,count(distinct hk_customer_h) as unique_customer_count
    from {{ ref('bdv_customer_pit') }}
    {% if is_incremental() %}
    where sdts >= current_date - interval '3 days'
    {% endif %}
    group by all
)
select * 
from customer_count
order by 1 desc


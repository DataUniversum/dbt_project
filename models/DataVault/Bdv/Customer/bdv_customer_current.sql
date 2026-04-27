{{ config(materialized='view') }}

select
    -- keys
    c.hk_customer_h,
    c.customer_id,

    -- satellite payload
    s.c_name,
    s.c_address,
    s.c_phone,
    s.c_mktsegment

from {{ ref('rdv_customer_h') }} as c
inner join {{ ref('rdv_customer_tpch_s') }} as s
    on
        c.hk_customer_h = s.hk_customer_h
        and s.is_current = true

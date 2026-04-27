{{ config(materialized='view') }}
 
select
    -- keys
    o.hk_order_h,
    o.order_id,
 
    -- satellite payload
    s.o_orderstatus,
    s.o_totalprice,
    s.o_orderdate,
    s.o_orderpriority,
    s.o_clerk,
    s.o_shippriority,
    s.o_comment
 
from {{ ref('rdv_order_h') }} o
inner join {{ ref('rdv_order_tpch_s') }} s
    on o.hk_order_h = s.hk_order_h
    and s.is_current = true
 
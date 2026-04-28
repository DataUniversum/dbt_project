{{ config(materialized='view') }}
 
select
    -- hash keys
    li.hk_lineitem_l,
    li.hk_order_h,
    li.hk_part_h,
    li.hk_supplier_h,
 
    -- business keys
    d.l_orderkey,
    d.l_linenumber,
    d.l_partkey,
    d.l_suppkey,
 
    -- effectivity payload
    ef.l_returnflag,
    ef.l_linestatus,
    ef.l_shipdate,
    ef.l_commitdate,
    ef.l_receiptdate,
 
    -- details payload
    d.l_shipinstruct,
    d.l_shipmode,
    d.l_quantity,
    d.l_extendedprice,
    d.l_discount,
    d.l_tax,

    -- technical columns
    li.ldts,
    li.rsrc
 
from {{ ref('rdv_lineitem_l') }} li
inner join {{ ref('rdv_lineitem_tpch_effectivity_s') }} ef
    on li.hk_lineitem_l = ef.hk_lineitem_l
    and ef.is_current = true
inner join {{ ref('rdv_lineitem_tpch_details_s') }} d
    on li.hk_lineitem_l = d.hk_lineitem_l
    and d.is_current = true
 
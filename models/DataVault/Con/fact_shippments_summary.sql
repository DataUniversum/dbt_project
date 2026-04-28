{{ config(materialized='view') }}

select

    to_varchar(year(l_shipdate))
    || '_'
    || lpad(to_varchar(month(l_shipdate)), 2, '0') as ship_month,
    case
        when l_linestatus = 'O' then 'Open'
        when l_linestatus = 'F' and l_returnflag = 'N' then 'Completed'
        when l_linestatus = 'F' and l_returnflag in ('R', 'A') then 'Returned'
    end as status,

    -- volume metrics
    count(*) as line_count,
    count(distinct l_partkey) as products_count,
    count(distinct l_orderkey) as shipments_count,
    round(
        count(distinct l_partkey)
        / nullif(count(distinct l_orderkey), 0),
        2
    ) as products_per_shipment,

    -- revenue metrics
    sum(l_extendedprice) as gross_revenue,
    sum(l_extendedprice * (1 - l_discount)) as net_revenue,
    sum(l_extendedprice * (1 - l_discount) * (1 + l_tax)) as total_charged,

    -- discount metrics
    sum(l_extendedprice * l_discount) as total_discount,

    -- averages
    avg(l_quantity) as avg_quantity,
    avg(l_extendedprice) as avg_gross_price,
    avg(l_discount) as avg_discount

from {{ ref('bdv_lineitem_current') }}
where rsrc != 'SYSTEM'

group by 1, 2

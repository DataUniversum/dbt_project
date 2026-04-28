{{ config(
    materialized='view',
    schema='CON'
) }}

select

    to_varchar(year(l_shipdate))
    || '_'
    || lpad(to_varchar(month(l_shipdate)), 2, '0') as ship_month,
    case
        when l_linestatus = 'O' then 'Open'
        when l_linestatus = 'F' and l_returnflag = 'N' then 'Completed'
        when l_linestatus = 'F' and l_returnflag in ('R', 'A') then 'Returned'
    end as status,
    l_shipmode as transportation_mode,

    -- volume
    count(*) as line_count,

    -- transit time metrics (fulfilled lines only)
    avg(
        case
            when
                l_linestatus = 'F'
                then datediff('day', l_shipdate, l_receiptdate)
        end
    ) as avg_transit_days,
    min(
        case
            when
                l_linestatus = 'F'
                then datediff('day', l_shipdate, l_receiptdate)
        end
    ) as min_transit_days,
    max(
        case
            when
                l_linestatus = 'F'
                then datediff('day', l_shipdate, l_receiptdate)
        end
    ) as max_transit_days,

    -- on time delivery (fulfilled lines only)
    sum(
        case
            when
                l_linestatus = 'F' and l_receiptdate <= l_commitdate
                then 1
            else 0
        end
    ) as on_time_deliveries,
    sum(
        case
            when
                l_linestatus = 'F' and l_receiptdate > l_commitdate
                then 1
            else 0
        end
    ) as late_deliveries,
    round(
        sum(
            case
                when
                    l_linestatus = 'F' and l_receiptdate <= l_commitdate
                    then 1
                else 0
            end
        )
        / nullif(sum(case when l_linestatus = 'F' then 1 else 0 end), 0) * 100,
        2
    ) as on_time_pct,

    -- not delivered (open lines past commit date)
    sum(
        case
            when
                l_linestatus = 'O' and l_commitdate < current_date
                then 1
            else 0
        end
    ) as overdue_count,
    sum(case when l_linestatus = 'O' then 1 else 0 end) as open_count

from {{ ref('bdv_lineitem_current') }}
where
    rsrc != 'SYSTEM'
    and l_shipdate is not null
    and l_receiptdate is not null
    and l_commitdate is not null

group by 1, 2, 3

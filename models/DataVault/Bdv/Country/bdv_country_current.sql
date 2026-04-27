{{ config(materialized='view') }}
 
select
    -- keys
    c.hk_country_h,
    c.country_id,
 
    -- satellite payload
    s.n_name,
    s.n_comment
 
from {{ ref('rdv_country_h') }} c
inner join {{ ref('rdv_country_tpch_s') }} s
    on c.hk_country_h = s.hk_country_h
    and s.is_current = true
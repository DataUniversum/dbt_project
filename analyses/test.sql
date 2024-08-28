select * from {{ref('snapshot_0') }}
--where is_latest = true
order by sdts desc
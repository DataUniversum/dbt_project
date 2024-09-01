WITH row_counts AS (
    WITH
    customer_count AS (
        SELECT 'CUSTOMER' AS table_name, COUNT(*) AS row_count
        FROM snowflake_sample_data.tpch_sf1.customer
    ),
    lineitem_count AS (
        SELECT 'LINEITEM' AS table_name, COUNT(*) AS row_count
        FROM snowflake_sample_data.tpch_sf1.lineitem
    ),
    nation_count AS (
        SELECT 'NATION' AS table_name, COUNT(*) AS row_count
        FROM snowflake_sample_data.tpch_sf1.nation
    ),
    orders_count AS (
        SELECT 'ORDERS' AS table_name, COUNT(*) AS row_count
        FROM snowflake_sample_data.tpch_sf1.orders
    ),
    part_count AS (
        SELECT 'PART' AS table_name, COUNT(*) AS row_count
        FROM snowflake_sample_data.tpch_sf1.part
    ),
    partsupp_count AS (
        SELECT 'PARTSUPP' AS table_name, COUNT(*) AS row_count
        FROM snowflake_sample_data.tpch_sf1.partsupp
    ),
    region_count AS (
        SELECT 'REGION' AS table_name, COUNT(*) AS row_count
        FROM snowflake_sample_data.tpch_sf1.region
    ),
    supplier_count AS (
        SELECT 'SUPPLIER' AS table_name, COUNT(*) AS row_count
        FROM snowflake_sample_data.tpch_sf1.supplier
    ),
    combined_counts AS (
        SELECT * FROM customer_count
        UNION ALL
        SELECT * FROM lineitem_count
        UNION ALL
        SELECT * FROM nation_count
        UNION ALL
        SELECT * FROM orders_count
        UNION ALL
        SELECT * FROM part_count
        UNION ALL
        SELECT * FROM partsupp_count
        UNION ALL
        SELECT * FROM region_count
        UNION ALL
        SELECT * FROM supplier_count
    )
    SELECT
        table_name,
        row_count
    FROM combined_counts
    ORDER BY table_name
)
SELECT * FROM row_counts
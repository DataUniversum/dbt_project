/*****************************************************************************
* CHANGE HISTORY
**********************
* Date        Author             Description
* ==========  ===============    ===============================================
* 2024-08-29  Jaroslaw Syrokosz  Initial draft              
*****************************************************************************/

{%- set yaml_metadata -%}
source_model: 
    'tpch_sf1': 'orders'
ldts: 'current_timestamp'
rsrc: '!tpch_sf1'

hashed_columns:
    hk_order_h:
        - O_ORDERKEY
    hk_customer_h:
        - O_CUSTKEY
    hk_order_customer_l:
        - O_ORDERKEY
        - O_CUSTKEY
    hd_order_s:
        is_hashdiff: true
        columns:
            - O_ORDERSTATUS
            - O_TOTALPRICE
            - O_ORDERDATE
            - O_ORDERPRIORITY
            - O_CLERK
            - O_SHIPPRIORITY
            - O_COMMENT

{%- endset -%}

{#-*****************************************************************************-#}
{#-********************** No changes below this point **************************-#}
{#-*****************************************************************************-#}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set source_model = metadata_dict['source_model'] -%}
{%- set ldts = metadata_dict['ldts'] -%}
{%- set rsrc = metadata_dict['rsrc'] -%}
{%- set hashed_columns = metadata_dict['hashed_columns'] -%}
{%- set derived_columns = metadata_dict['derived_columns'] -%}
{%- set prejoined_columns = metadata_dict['prejoined_columns'] -%}
{%- set missing_columns = metadata_dict['missing_columns'] -%}
{%- set multi_active_config = metadata_dict['multi_active_config'] -%}
 
{{ datavault4dbt.stage( source_model=source_model,
                        ldts=ldts,
                        rsrc=rsrc,
                        hashed_columns=hashed_columns,
                        derived_columns=derived_columns,
                        prejoined_columns=prejoined_columns,
                        missing_columns=missing_columns,
                        multi_active_config=multi_active_config) }}
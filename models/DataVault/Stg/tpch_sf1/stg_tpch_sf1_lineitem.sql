/*****************************************************************************
* CHANGE HISTORY
**********************
* Date        Author             Description
* ==========  ===============    ===============================================
* 2026-04-27  Jaroslaw Syrokosz  Initial draft              
*****************************************************************************/

{%- set yaml_metadata -%}
source_model: 
    'tpch_sf1': 'lineitem'
ldts: 'current_timestamp'
rsrc: '!tpch_sf1'

hashed_columns:
    hk_order_h:
        - L_ORDERKEY
    hk_part_h:
        - L_PARTKEY
    hk_supplier_h:
        - L_SUPPKEY
    hk_lineitem_l:
        - L_ORDERKEY
        - L_LINENUMBER
        - L_PARTKEY
        - L_SUPPKEY
    hd_lineitem_effectivity_s:
        is_hashdiff: true
        columns:
            - L_SHIPDATE
            - L_COMMITDATE
            - L_RECEIPTDATE
            - L_RETURNFLAG
            - L_LINESTATUS
    hd_lineitem_details_s:
        is_hashdiff: true
        columns:
            - L_RETURNFLAG
            - L_LINESTATUS
            - L_SHIPINSTRUCT
            - L_SHIPMODE
            - L_QUANTITY
            - L_EXTENDEDPRICE
            - L_DISCOUNT
            - L_TAX

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
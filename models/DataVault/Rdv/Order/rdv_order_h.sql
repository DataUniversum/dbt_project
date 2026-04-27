/*****************************************************************************
* CHANGE HISTORY
**********************
* Date        Author             Description
* ==========  ===============    ===============================================
* 2024-08-29  Jaroslaw Syrokosz  Initial draft              
*****************************************************************************/

{%- set yaml_metadata -%}
hashkey: 'hk_order_h'
business_keys: 
    - ORDER_ID
source_models: 
    - name: stg_tpch_sf1_orders
      bk_columns:
        - O_ORDERKEY
      rsrc: '!tpch_sf1_orders'
    - name: stg_tpch_sf1_lineitem
      bk_columns:
        - L_ORDERKEY
      rsrc: '!tpch_sf1_lineitem'
{%- endset -%}


{#-*****************************************************************************-#}
{#-********************** No changes below this point **************************-#}
{#-*****************************************************************************-#}

{#- Set all hubs to incremental -#}
{{ config(materialized='incremental') }}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set hashkey = metadata_dict['hashkey'] -%}
{%- set business_keys = metadata_dict['business_keys'] -%}
{%- set source_models = metadata_dict['source_models'] -%}

{{ datavault4dbt.hub(hashkey=hashkey,
                    business_keys=business_keys,
                    source_models=source_models) }}
/*****************************************************************************
* CHANGE HISTORY
**********************
* Date        Author             Description
* ==========  ===============    ===============================================
* 2024-08-29  Jaroslaw Syrokosz  Initial draft              
*****************************************************************************/

{%- set yaml_metadata -%}
source_model: stg_tpch_sf1_orders
parent_hashkey: 'hk_order_h'
src_hashdiff: 'hd_order_s'

src_payload:
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

{#- Set all satellites v0 to incremental -#}
{{ config(materialized='incremental') }}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict['parent_hashkey'],
                        src_hashdiff=metadata_dict['src_hashdiff'],
                        source_model=metadata_dict['source_model'],
                        src_payload=metadata_dict['src_payload']) }}
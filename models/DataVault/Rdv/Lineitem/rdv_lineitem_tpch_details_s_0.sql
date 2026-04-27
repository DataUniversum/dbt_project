/*****************************************************************************
* CHANGE HISTORY
**********************
* Date        Author             Description
* ==========  ===============    ===============================================
* 2024-08-29  Jaroslaw Syrokosz  Initial draft              
*****************************************************************************/

{%- set yaml_metadata -%}
source_model: stg_tpch_sf1_lineitem
parent_hashkey: 'hk_lineitem_l'
src_hashdiff: 'hd_lineitem_details_s'

src_payload:
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

{#- Set all satellites v0 to incremental -#}
{{ config(materialized='incremental') }}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict['parent_hashkey'],
                        src_hashdiff=metadata_dict['src_hashdiff'],
                        source_model=metadata_dict['source_model'],
                        src_payload=metadata_dict['src_payload']) }}
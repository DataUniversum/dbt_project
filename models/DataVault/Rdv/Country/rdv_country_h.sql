/*****************************************************************************
* CHANGE HISTORY
**********************
* Date        Author             Description
* ==========  ===============    ===============================================
* 2024-08-29  Jaroslaw Syrokosz  Initial draft              
*****************************************************************************/

{%- set yaml_metadata -%}
hashkey: 'hk_country_h'
business_keys: 
    - COUTNRY_ID
source_models: 
    - name: stg_tpch_sf1_nation
      bk_columns:
        - N_NATIONKEY
      rsrc: '!tpch_sf1_nation'
    - name: stg_tpch_sf1_customer
      bk_columns:
        - C_NATIONKEY
      rsrc: '!tpch_sf1_customer'
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
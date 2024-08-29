/*****************************************************************************
* CHANGE HISTORY
**********************
* Date        Author             Description
* ==========  ===============    ===============================================
* 2024-08-29  Jaroslaw Syrokosz  Initial draft              
*****************************************************************************/

{%- set yaml_metadata -%}
hashkey: 'hk_customer_h'
business_keys: 
    - CUST_ID
source_models: 
    - name: tpch_sf1_nation
      bk_columns:
        - C_CUSTKEY
      rsrc: '!tpch_sf1_nation'
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
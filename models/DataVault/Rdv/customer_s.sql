{{ config(materialized='view') }}

{%- set yaml_metadata -%}
sat_v0: 'customer_s_0'
hashkey: 'hk_customer_h'
hashdiff: 'hd_customer_s'   
ledts_alias: 'end_date'
add_is_current_flag: true
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set sat_v0 = metadata_dict['sat_v0'] -%}
{%- set hashkey = metadata_dict['hashkey'] -%}
{%- set hashdiff = metadata_dict['hashdiff'] -%}
{%- set ledts_alias = metadata_dict['ledts_alias'] -%}
{%- set add_is_current_flag = metadata_dict['add_is_current_flag'] -%}

{{ datavault4dbt.sat_v1(sat_v0=sat_v0,
                        hashkey=hashkey,
                        hashdiff=hashdiff,
                        ledts_alias=ledts_alias,
                        add_is_current_flag=add_is_current_flag) }}
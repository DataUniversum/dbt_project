
{{config(materialized='view', schema='stage')}}

{%- set yaml_metadata -%}
source_model:
    'tpch': 'customer'
hashed_columns:
    hk_customer_h:
        - C_NAME
    hd_customer_s:
        is_hashdiff: true
        columns:
            - C_ADDRESS
            - C_NATIONKEY
            - C_PHONE
            - C_MKTSEGMENT
ldts: 'current_timestamp'
rsrc: '!tpch1'
{%- endset -%}
{%- set metadata_dict = fromyaml(yaml_metadata) -%}
{%- set source_model = metadata_dict['source_model'] -%}
{%- set ldts = metadata_dict['ldts'] -%}
{%- set rsrc = metadata_dict['rsrc'] -%}
{%- set hashed_columns = metadata_dict["hashed_columns"] -%}

{{
datavault4dbt.stage(
    source_model=source_model,
    ldts=ldts,
    rsrc=rsrc,
    hashed_columns=hashed_columns
    )
}}
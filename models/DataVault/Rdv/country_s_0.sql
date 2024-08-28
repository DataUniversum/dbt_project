
{%- set yaml_metadata -%}
parent_hashkey: 'hk_customer_h'
src_hashdiff: 'hd_customer_s'
src_payload:
    - C_NAME
    - C_ADDRESS
    - C_PHONE
    - C_MKTSEGMENT
source_model: 'stg_customer'
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict['parent_hashkey'],
                        src_hashdiff=metadata_dict['src_hashdiff'],
                        source_model=metadata_dict['source_model'],
                        src_payload=metadata_dict['src_payload']) }}
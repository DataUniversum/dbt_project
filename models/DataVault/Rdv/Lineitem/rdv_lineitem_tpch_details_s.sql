
{%- set yaml_metadata -%}
sat_v0: 'rdv_lineitem_tpch_details_s_0'
hashkey: 'hk_lineitem_l'
hashdiff: 'hd_lineitem_details_s'   
ledts_alias: 'ledts'
add_is_current_flag: true
{%- endset -%}    

{#-*****************************************************************************-#}
{#-********************** No changes below this point **************************-#}
{#-*****************************************************************************-#}

{#- Set all satellites v1 to views -#}
{{ config(materialized='view') }}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.sat_v1(sat_v0=metadata_dict['sat_v0'],
                        hashkey=metadata_dict['hashkey'],
                        hashdiff=metadata_dict['hashdiff'],
                        ledts_alias=metadata_dict['ledts_alias'],
                        add_is_current_flag=metadata_dict['add_is_current_flag']) }}
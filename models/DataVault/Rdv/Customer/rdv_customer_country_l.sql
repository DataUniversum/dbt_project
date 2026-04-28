
{%- set yaml_metadata -%}
link_hashkey: 'hk_customer_country_l'

foreign_hashkeys:
    - 'hk_customer_h'
    - 'hk_country_h'

source_models:
    - name: stg_tpch_sf1_customer
      rsrc_static: '!tpch_sf1_customer'
{%- endset -%}    

{#-*****************************************************************************-#}
{#-********************** No changes below this point **************************-#}
{#-*****************************************************************************-#}

{#- Set all links to incremental -#}
{{ config(materialized='incremental') }}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set link_hashkey = metadata_dict['link_hashkey'] -%}
{%- set foreign_hashkeys = metadata_dict['foreign_hashkeys'] -%}
{%- set source_models = metadata_dict['source_models'] -%}


{{ datavault4dbt.link(link_hashkey=link_hashkey,
                    foreign_hashkeys=foreign_hashkeys,
                    source_models=source_models) }}

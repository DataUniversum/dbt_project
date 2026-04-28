
{%- set yaml_metadata -%}
pit_type: '!CustomersPIT'
tracked_entity: 'rdv_customer_h'
hashkey: 'hk_customer_h'
sat_names: 
    - rdv_customer_tpch_s
snapshot_relation: 'snapshot'
snapshot_trigger_column: 'is_active'
dimension_key: 'hk_customer_d'
custom_rsrc: 'PIT table Customers Test'
{%- endset -%}    

{#-*****************************************************************************-#}
{#-********************** No changes below this point **************************-#}
{#-*****************************************************************************-#}


{{ config(materialized='incremental',
        post_hook="{{ datavault4dbt.clean_up_pit('snapshot') }}") }}


{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set pit_type = metadata_dict['pit_type'] -%}
{%- set tracked_entity = metadata_dict['tracked_entity'] -%}
{%- set hashkey = metadata_dict['hashkey'] -%}
{%- set sat_names = metadata_dict['sat_names'] -%}
{%- set snapshot_relation = metadata_dict['snapshot_relation'] -%}
{%- set snapshot_trigger_column = metadata_dict['snapshot_trigger_column'] -%}
{%- set dimension_key = metadata_dict['dimension_key'] -%}
{%- set custom_rsrc = metadata_dict['custom_rsrc'] -%}

{{ datavault4dbt.pit(pit_type=pit_type,
                                tracked_entity=tracked_entity,
                                hashkey=hashkey,
                                sat_names=sat_names,
                                snapshot_relation=snapshot_relation,
                                snapshot_trigger_column=snapshot_trigger_column,
                                dimension_key=dimension_key,
                                custom_rsrc=custom_rsrc) }}
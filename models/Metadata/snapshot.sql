/*****************************************************************************
* CHANGE HISTORY
**********************
* Date        Author             Description
* ==========  ===============    ===============================================
* 2024-08-29  Jaroslaw Syrokosz  Initial draft              
*****************************************************************************/

{%- set yaml_metadata -%}
control_snap_v0: 'snapshot_0'
log_logic: 
    weekly:
        duration: 1
        unit: 'YEAR'
    yearly:
        forever: true
{%- endset -%}    

{#-*****************************************************************************-#}
{#-********************** No changes below this point **************************-#}
{#-*****************************************************************************-#}


{#- Set all snapshot v1 to view -#}
{{ config(materialized='view') }}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set control_snap_v0 = metadata_dict['control_snap_v0'] -%}
{%- set log_logic = metadata_dict['log_logic'] -%}

{{ datavault4dbt.control_snap_v1(control_snap_v0=control_snap_v0,
                                log_logic=log_logic) }}
#datavault4dbt model templates
Find below templates ready for copy-and-paste to create SQL models for Data Vault objects using datavault4dbt macros.

##DV Stage template
/*****************************************************************************
* CHANGE HISTORY
**********************
* Date        Author           Description
* ==========  ===============  ===============================================
* YYYY-MM-DD  ##your-name##    ##change-description##                 
*****************************************************************************/

{%- set yaml_metadata -%}
source_model: ##source_model_name##
ldts: 'ldts'
rsrc: 'rsrc'


hashed_columns: 
    ##hash_key_name##:
        - ##business_key_1##
        - ##business_key_2## -- OPTIONAL, if business key is a composite key
    
    {#- OPTIONAL - remove if not used. -#}
    {#- Provide definition of hash diff, if DV stage object contains satellite payload(s). -#}
    {#- In case you have multi-active key, they have to be included in the hashdiff. -#}
    ##hash_diff_name##:
        is_hashdiff: true
        columns:
            - ##list_of_columns##
    
    {#- OPTIONAL - remove if not used. -#}
    derived_columns:
        ##derived_col_1##:
            value: ##derived_expression##
            datatype: ##derived_datatype##
            src_cols_required: ##source_col##
        ##derived_col_2##:
            value: ##derived_expression##
            datatype: ##derived_datatype##
            src_cols_required:
                - ##source_col_1##
                - ##source_col_2##
    
    {#- OPTIONAL - remove if not used. -#}
    prejoined_columns:
        ##column_alias##:
            ref_model: ##referenced_model##
            bk: ##name_of_column_to_be_selected##
            this_column_name: ##name_of_col_in_this_object##
            ref_column_name: ##name_of_col_in_referenced_object##

    {#- OPTIONAL - remove if not used. -#}    
    missing_columns:
        ##col_name##: '##col_datatype##'

    {#- OPTIONAL - remove if not used. -#}
    multi_active_config:
        multi_active_key: '##multi_active_key##'
        main_hashkey_column: '##main_hashkey_name##'
{%- endset -%}

{#-*****************************************************************************-#}
{#-********************** No changes below this point **************************-#}
{#-*****************************************************************************-#}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set source_model = metadata_dict['source_model'] -%}
{%- set ldts = metadata_dict['ldts'] -%}
{%- set rsrc = metadata_dict['rsrc'] -%}
{%- set hashed_columns = metadata_dict['hashed_columns'] -%}
{%- set derived_columns = metadata_dict['derived_columns'] -%}
{%- set prejoined_columns = metadata_dict['prejoined_columns'] -%}
{%- set missing_columns = metadata_dict['missing_columns'] -%}
{%- set multi_active_config = metadata_dict['multi_active_config'] -%}
 
{{ datavault4dbt.stage( source_model=source_model,
                        ldts=ldts,
                        rsrc=rsrc,
                        hashed_columns=hashed_columns,
                        derived_columns=derived_columns,
                        prejoined_columns=prejoined_columns,
                        missing_columns=missing_columns,
                        multi_active_config=multi_active_config) }}

##Hub template
/*****************************************************************************
* CHANGE HISTORY
**********************
* Date        Author           Description
* ==========  ===============  ===============================================
* YYYY-MM-DD  ##your-name##    ##change-description##                 
*****************************************************************************/

{%- set yaml_metadata -%}
hashkey: '##hub_hashkey_name##'
business_keys: 
    - ##business_key_1##
    - ##business_key_2##  -- OPTIONAL, if business key is a composite key

source_models:

    {#- If Hub is loaded by multiple sources, define a rsrc_static to improve load performance. -#}
   - name: ##source_model_name##
      rsrc_static: '##rsrc_static##'
    
    - name: ##source_model_name##
      hk_column: '##alternative_hash_key_name##' {# OPTIONAL, use if hash key in source model has a different name than the one declared above #}
      bk_column: '##alternative_business_key_name##' {# OPTIONAL, use if business key in source model has a different name than the one declared above #}
      rsrc_static: '##rsrc_static##'
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

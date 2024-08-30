/*****************************************************************************
* CHANGE HISTORY
**********************
* Date        Author             Description
* ==========  ===============    ===============================================
* 2024-08-29  Jaroslaw Syrokosz  Initial draft              
*****************************************************************************/

{# 
- To use: dbt run-operation drop_all_user_schemas --args '{database: "your_database_name"}'
- Example: dbt run-operation drop_all_user_schemas --args '{database: "datauniversum"}'
#}

{% macro drop_all_user_schemas(database) %}

{% set database = database | upper %}  -- Convert input to uppercase

{% set get_schemas_query %}
    SELECT schema_name 
    FROM {{ database }}.information_schema.schemata
    WHERE schema_name NOT IN (
        'INFORMATION_SCHEMA', 
        'PUBLIC'
        -- Add any other schemas you want to preserve here
    )

{% endset %}

{% set results = run_query(get_schemas_query) %}

{% if execute %}
    {% set schema_list = results.columns[0].values() %}
    {% do log("Schemas to be dropped in database " ~ database ~ ": " ~ schema_list | join(', '), info=True) %}
    
    {% for schema_name in schema_list %}
        {% set drop_schema_query %}
            DROP SCHEMA IF EXISTS {{ database }}.{{ schema_name }} CASCADE;
        {% endset %}
        {% do run_query(drop_schema_query) %}
        {% do log("Dropped schema: " ~ schema_name, info=True) %}
    {% endfor %}
{% endif %}

{% do log("All user schemas in database " ~ database ~ " have been dropped.", info=True) %}

{% endmacro %}
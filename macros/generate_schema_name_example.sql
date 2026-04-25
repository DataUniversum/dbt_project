{% macro generate_schema_name_example (custom_schema_name, node) %}
    {%- set default_schema = target.schema -%} 
    {%- set target_database = target.database | upper -%}

        {%- if custom_schema_name is not none -%}
            {{ custom_schema_name | trim }}
        {%- else -%}
            {{ default_schema }}_{{ custom_schema_name | trim }}
        {%- endif -%}
{% endmacro %}
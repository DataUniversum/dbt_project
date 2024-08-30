{% docs drop_all_user_schemas %}
## Overview
The `drop_all_user_schemas` macro is designed to drop all user-created schemas in a specified Snowflake database. This macro is particularly useful for cleaning up development or test environments.

## Functionality
- Drops all user-created schemas in the specified Snowflake database.
- Excludes system schemas like 'INFORMATION_SCHEMA' and 'PUBLIC'.
- Uses Snowflake's CASCADE option to ensure all objects within each schema are also dropped.

## Usage
To use this macro, run the following dbt command:
```
dbt run-operation drop_all_user_schemas --args '{database: "your_database_name"}'
```

Example:
```
dbt run-operation drop_all_user_schemas --args '{database: "datauniversum"}'
```

## Parameters
- `database` (string): The name of the Snowflake database where schemas should be dropped. This parameter is case-insensitive.

{% enddocs %}
# DataUniversum dbt Project

## Project Structure

Our dbt project is organized as follows:

```
project_root/
├── models/
│   ├── Metadata/
│   └── DataVault/
│       ├── Stg/
│       ├── Rdv/
│       └── Bdv/
├── tests/
├── macros/
├── seeds/
└── dbt_project.yml
```

- `models/`: Contains all dbt models
  - `Metadata/`: Models for metadata (schema: Rdv, materialized: table, tags: ["dv","rdv"])
  - `DataVault/`: Data Vault models
    - `Stg/`: Staging models (schema: Stg, materialized: view, tags: ["dv","stg"])
    - `Rdv/`: Raw Data Vault models (schema: Rdv, materialized: table, tags: ["dv","rdv"])
    - `Bdv/`: Business Data Vault models (schema: Bdv, materialized: table, tags: ["dv","bdv"])
- `tests/`: Contains custom data tests
- `macros/`: Reusable SQL snippets and functions
- `seeds/`: Static data files (CSVs) to be loaded into the data warehouse
- `dbt_project.yml`: Main configuration file for the dbt project

## Dependencies

This project uses the following dbt packages:
- dbt_utils
- datavault4dbt

Ensure these packages are listed in your `packages.yml` file and installed using `dbt deps`.

## Running the Models

To run the models in this project, follow these steps:

1. Ensure you have dbt installed and configured with your data warehouse.

2. Install project dependencies:
   ```
   dbt deps
   ```
   This will install the required packages (dbt_utils and datavault4dbt) along with any other dependencies specified in your `packages.yml` file.

3. Run all models:
   ```
   dbt run
   ```

   To run specific models or directories:
   ```
   dbt run --models modelname
   dbt run --models DataVault.Stg
   ```

4. Run tests to ensure data quality:
   ```
   dbt test
   ```

5. Generate and view documentation:
   ```
   dbt docs generate
   dbt docs serve
   ```

6. Run a macro:
   To execute a macro, you can use the `dbt run-operation` command. For example:
   ```
   dbt run-operation macro_name
   ```
   If your macro requires arguments, you can pass them like this:
   ```
   dbt run-operation macro_name --args '{arg1: value1, arg2: value2}'
   ```

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

# DataUniversum dbt Project

## Table of Contents
- [Project Structure](#project-structure)
- [Naming Conventions](#naming-conventions)
- [Templates](#templates)
- [Dependencies](#dependencies)
- [Running the Models](#running-the-models)
- [Resources](#resources)
- [Contact Information](#contact-information)

## Project Structure

Our dbt project is organized as follows:

```
project_root/
├── models/
│   ├── Metadata/
│   └── DataVault/
│       ├── Stg/
│       ├── Rdv/
│       ├── Bdv/
│       └── Con/
├── tests/
├── macros/
├── analysis/
├── seeds/
└── dbt_project.yml
```

- `models/`: Contains all dbt models
  - `Metadata/`: Models for metadata
  - `DataVault/`: Data Vault models
    - `Stg/`: Staging models
    - `Rdv/`: Raw Data Vault models
    - `Bdv/`: Business Data Vault models
- `tests/`: Contains custom data tests
- `macros/`: Reusable SQL snippets and functions
- `analysis/`: Custom/ad-hoc queries for analysis needs
- `seeds/`: Static data files (CSVs) to be loaded into the data warehouse
- `_templates/`: Contains custom models and test templates
- `dbt_project.yml`: Main configuration file for the dbt project


## Naming Conventions

To maintain consistency across the project, we follow these naming conventions:

- Folder Names: Pascal Case
  - Example: `DataVault`, `Metadata`

- File Names: snake_case
  - Example: `customer_dimension.sql`, `order_fact.sql`

Please adhere to these conventions when creating new folders or files in the project.

### Data Vault Object Naming

All Data Vault objects use **singular** entity names (e.g. `customer`, not `customers`).

#### Prefixes

| Layer          | Prefix  | Example                        |
|----------------|---------|--------------------------------|
| Raw Data Vault | `rdv_`  | `rdv_customer_h`               |
| Business Vault | `bdv_`  | `bdv_customer_h`               |

#### Suffixes

| Object Type         | Suffix | Example                        |
|---------------------|--------|--------------------------------|
| Hub                 | `_h`   | `rdv_customer_h`               |
| Link                | `_l`   | `rdv_order_customer_l`         |
| Satellite           | `_s`   | `rdv_customer_tpch_sf1_s`      |
| Effectivity Sat     | `_s`   | `rdv_lineitem_effectivity_s`   |

#### Satellite Naming

Satellites include the **source system name** to reflect their origin, making multi-source scenarios explicit:

```
rdv_{entity}_{source_system}_s
```

Examples:
- `rdv_customer_tpch_sf1_s` — customer satellite from TPC-H SF1
- `rdv_order_tpch_sf1_s` — order satellite from TPC-H SF1
- `rdv_lineitem_effectivity_s` — effectivity satellite for line item (bi-temporal)
- `rdv_lineitem_details_s` — details satellite for line item

#### Full Examples

| Object                        | Name                              |
|-------------------------------|-----------------------------------|
| Customer Hub                  | `rdv_customer_h`                  |
| Order Hub                     | `rdv_order_h`                     |
| Order-Customer Link           | `rdv_order_customer_l`            |
| LineItem Link                 | `rdv_lineitem_l`                  |
| Customer Satellite            | `rdv_customer_tpch_sf1_s`         |
| Order Satellite               | `rdv_order_tpch_sf1_s`            |
| LineItem Effectivity Satellite| `rdv_lineitem_effectivity_s`      |
| LineItem Details Satellite    | `rdv_lineitem_details_s`          |

## Templates
Templates provide reusable structures for common coding patterns.

Templates for both model and generic test in yaml files can be access under the `_templates/` forlder and related .md file

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

## Resources:

### DBT

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

### Datavault4dbt package documentation

The following documentation sheds some light on the dbt-macros that have been developed by Scalefree to make your DataVault-Experience more comfortable!
In the documentation, the macros and their parameters are explained and further exemplified.

[datavault4dbt documentation](https://www.datavault4dbt.com/documentation/)

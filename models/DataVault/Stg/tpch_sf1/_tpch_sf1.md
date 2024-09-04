############################################################
### stg_tpch_sf1_customer
############################################################
{% docs stg_tpch_sf1_customer %}
This view is part of the staging layer and represents customer data from the TPC-H SF1 dataset. It includes both source columns and generated hash keys for use in the Data Vault model.

For more information about source attributes check documentation here: [tpch_sf1_customer](#!/source/source.datauniversum.tpch_sf1.customer)".
{% enddocs %}

{% docs stg_tpch_sf1_customer_hk_customer_h %}
Hash key for the customer. This is a unique identifier generated for each customer record.
{% enddocs %}

{% docs stg_tpch_sf1_customer_hk_country_h %}
Hash key for the country. This is a unique identifier generated for each country record.
{% enddocs %}

{% docs stg_tpch_sf1_customer_hd_customer_tpch_s %}
Hash diff for the customer TPC-H satellite. Used to detect changes in the satellite attributes.
{% enddocs %}

{% docs stg_tpch_sf1_customer_hk_customer_country_l %}
Hash key for the Customer-Country link. This is a unique identifier for each customer-country relationship.
{% enddocs %}



############################################################
### stg_tpch_sf1_nation
############################################################
{% docs stg_tpch_sf1_nation %}
This view is part of the staging layer and represents nation data from the TPC-H SF1 dataset. It includes both source columns and generated hash keys for use in the Data Vault model.

For more information about source attributes check here: [tpch_sf1_customer](#!/source/source.datauniversum.tpch_sf1.nation)".
{% enddocs %}

{% docs stg_tpch_sf1_nation_hk_country_h %}
Hash key for the country. This is a unique identifier generated for each country record.
{% enddocs %}

{% docs stg_tpch_sf1_nation_hd_country_tpch_s %}
Hash diff for the customer TPC-H satellite. Used to detect changes in the satellite attributes.
{% enddocs %}
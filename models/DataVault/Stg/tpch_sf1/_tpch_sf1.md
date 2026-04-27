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



############################################################
### stg_tpch_sf1_orders
############################################################
{% docs stg_tpch_sf1_orders %}
This view is part of the staging layer and represents order header data from the TPC-H SF1 dataset. It includes both source columns and generated hash keys for use in the Data Vault model.

For more information about source attributes check here: [tpch_sf1_orders](#!/source/source.datauniversum.tpch_sf1.orders)".
{% enddocs %}

{% docs stg_tpch_sf1_orders_hk_order_h %}
Hash key for the order. This is a unique identifier generated for each order record.
{% enddocs %}

{% docs stg_tpch_sf1_orders_hk_customer_h %}
Hash key for the customer. This is a unique identifier generated for each customer record.
{% enddocs %}

{% docs stg_tpch_sf1_orders_hk_order_customer_l %}
Hash key for the Order-Customer link. This is a unique identifier for each order-customer relationship.
{% enddocs %}

{% docs stg_tpch_sf1_orders_hd_order_s %}
Hash diff for the order satellite. Used to detect changes in all order descriptive attributes: status, total price, order date, priority, clerk, ship priority, and comment.
{% enddocs %}



############################################################
### stg_tpch_sf1_lineitem
############################################################
{% docs stg_tpch_sf1_lineitem %}
This view is part of the staging layer and represents line item data from the TPC-H SF1 dataset. It includes both source columns and generated hash keys for use in the Data Vault model.
Line items are the most granular transactional entity, identified by the composite of order key and line number.

For more information about source attributes check here: [tpch_sf1_lineitem](#!/source/source.datauniversum.tpch_sf1.lineitem)".
{% enddocs %}

{% docs stg_tpch_sf1_lineitem_hk_order_h %}
Hash key for the order. This is a unique identifier generated for each order record.
{% enddocs %}

{% docs stg_tpch_sf1_lineitem_hk_part_h %}
Hash key for the part. This is a unique identifier generated for each part record.
{% enddocs %}

{% docs stg_tpch_sf1_lineitem_hk_supplier_h %}
Hash key for the supplier. This is a unique identifier generated for each supplier record.
{% enddocs %}

{% docs stg_tpch_sf1_lineitem_hk_lineitem_l %}
Hash key for the LineItem link. Represents the full unit of work — generated from order key, part key, and supplier key, plus l_linenumber as a degenerate key to guarantee uniqueness. Feeds a single LNK_LINEITEM table preserving transactional atomicity.
{% enddocs %}

{% docs stg_tpch_sf1_lineitem_hd_lineitem_effectivity_s %}
Hash diff for the line item effectivity satellite. Used to detect changes in lifecycle state and temporal attributes: return flag, line status, ship date, commit date, and receipt date.
{% enddocs %}

{% docs stg_tpch_sf1_lineitem_hd_lineitem_details_s %}
Hash diff for the line item details satellite. Used to detect changes in descriptive and financial attributes: ship instructions, ship mode, quantity, extended price, discount, and tax.
{% enddocs %}
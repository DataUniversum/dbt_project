############################################################
#rdv_customer_h
############################################################

{% docs rdv_customer_h %}
This table is part of the Raw Data Vault (RDV) layer and serves as the Customer Hash table. It stores the hash keys for customers along with their original IDs, load timestamps, and record sources.
{% enddocs %}

{% docs rdv_customer_h_hk_customer_h %}
Hash key for the customer. This is a unique identifier generated for each customer record.
{% enddocs %}

{% docs rdv_customer_h_customer_id %}
The original customer ID from the source system.
{% enddocs %}


############################################################
#rdv_customer_tpch_s_0
############################################################
{% docs rdv_customer_tpch_s_0 %}
This transient table is part of the Raw Data Vault (RDV) layer and serves as the initial load table for the Customer TPC-H Satellite. It stores the attributes of customers from the TPC-H dataset.
{% enddocs %}

{% docs rdv_customer_tpch_s_0_hd_customer_tpch_s %}
Hash diff for the customer TPC-H satellite. Used to detect changes in the satellite attributes.
{% enddocs %}

############################################################
#rdv_customer_tpch_s
############################################################

{% docs rdv_customer_tpch_s %}
This view is part of the Raw Data Vault (RDV) layer and serves as the Customer TPC-H Satellite view. It stores the historical and current attributes of customers from the TPC-H dataset.
{% enddocs %}

{% docs rdv_customer_tpch_s_is_current %}
Flag indicating if this is the current record.
{% enddocs %}

############################################################
#rdv_customer_country_l
############################################################
{% docs rdv_customer_country_l %}
This transient table is part of the Raw Data Vault (RDV) layer and serves as the Link table between Customer and Country entities. It represents the relationship between customers and their associated countries.
{% enddocs %}

{% docs rdv_customer_country_l_hk_customer_country_l %}
Hash key for the Customer-Country link. This is a unique identifier for each customer-country relationship.
{% enddocs %}
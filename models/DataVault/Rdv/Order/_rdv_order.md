############################################################
rdv_order_h
############################################################
{% docs rdv_order_h %}
Hub table for the Order entity in the Raw Data Vault.
Contains the unique order business keys discovered across all source systems.
{% enddocs %}
{% docs rdv_order_h_order_id %}
Business key for the order.
Sourced from o_orderkey in the TPC-H SF1 dataset.
{% enddocs %}
############################################################
rdv_order_customer_l
############################################################
{% docs rdv_order_customer_l %}
Link table connecting Order and Customer entities in the Raw Data Vault.
Represents the relationship between an order and the customer who placed it.
Sourced from the orders staging model where o_custkey is present.
{% enddocs %}
############################################################
rdv_order_tpch_sf1_s
############################################################
{% docs rdv_order_tpch_s_0 %}
Satellite table (v0) for the Order entity, sourced from TPC-H SF1.
Stores the full change history of all descriptive attributes of an order.
{% enddocs %}
{% docs rdv_order_tpch_s %}
Satellite view (v1) for the Order entity, sourced from TPC-H SF1.
Extends the v0 satellite with a load end timestamp (ledts) and is_current flag
for easy current state queries.
{% enddocs %}
############################################################
############################################################
rdv_lineitem_l
############################################################
{% docs rdv_lineitem_l %}
Link table representing the LineItem entity in the Raw Data Vault.
Connects Order, Part, and Supplier hubs as a single unit of work.
L_LINENUMBER is carried as a degenerate key to guarantee uniqueness
of each line item within an order.
{% enddocs %}
############################################################
rdv_lineitem_tpch_effectivity_s
############################################################
{% docs rdv_lineitem_tpch_effectivity_s_0 %}
Satellite table (v0) for line item lifecycle state and temporal attributes.
Tracks changes to return flag, line status, and all shipment-related dates.
Attached to the lineitem link (rdv_lineitem_l).
Used as the primary satellite for bi-temporal analysis using l_shipdate as effective date.
{% enddocs %}
{% docs rdv_lineitem_tpch_effectivity_s %}
Satellite view (v1) for line item effectivity attributes.
Extends the v0 satellite with a load end timestamp (ledts) and is_current flag
for easy current state queries.
{% enddocs %}
############################################################
rdv_lineitem_details_s
############################################################
{% docs rdv_lineitem_tpch_details_s_0 %}
Satellite table (v0) for line item descriptive and financial attributes.
Stores all payload data including source business keys (l_orderkey, l_linenumber,
l_partkey, l_suppkey) as well as shipping instructions, ship mode, and financial
measures (quantity, extended price, discount, tax).
Business keys are stored here to support downstream joins until Part and Supplier
hubs are available.
Attached to the lineitem link (rdv_lineitem_l).
{% enddocs %}
{% docs rdv_lineitem_tpch_details_s %}
Satellite view (v1) for line item details attributes.
Extends the v0 satellite with a load end timestamp (ledts) and is_current flag
for easy current state queries.
{% enddocs %}
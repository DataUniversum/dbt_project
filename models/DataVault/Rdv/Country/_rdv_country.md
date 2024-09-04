############################################################
### rdv_country_h
############################################################

{% docs rdv_country_h %}
This table is part of the Raw Data Vault (RDV) layer and serves as the country Hash table. It stores the hash keys for countrys along with their original IDs, load timestamps, and record sources.
{% enddocs %}

{% docs rdv_country_h_country_id %}
The original country ID from the source system.
{% enddocs %}


############################################################
### rdv_country_tpch_s_0
############################################################
{% docs rdv_country_tpch_s_0 %}
This transient table is part of the Raw Data Vault (RDV) layer and serves as the initial load table for the country TPC-H Satellite. It stores the attributes of countrys from the TPC-H dataset.
{% enddocs %}


############################################################
### rdv_country_tpch_s
############################################################

{% docs rdv_country_tpch_s %}
This view is part of the Raw Data Vault (RDV) layer and serves as the country TPC-H Satellite view. It stores the historical and current attributes of countrys from the TPC-H dataset.
{% enddocs %}

{% docs rdv_country_tpch_s_is_current %}
Flag indicating if this is the current record.
{% enddocs %}
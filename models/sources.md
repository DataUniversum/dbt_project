############################################################
#tpch_sf1
############################################################
{% docs tpch_sf1 %}
This documentation covers the TPCH_SF1 sample data from SNOWFLAKE_SAMPLE_DATA database.
TPCH is a decision support benchmark that is used for benchmarking and testing purposes.
{% enddocs %}

############################################################
#tpch_sf1_customer
############################################################
{% docs tpch_sf1_customer %}
This table contains all customer data.
This data is refreshed daily from our operational systems.
{% enddocs %}

{% docs tpch_sf1_customer_c_custkey %}
Primary key for the customer. 
This is a unique identifier assigned to each customer in our system.
{% enddocs %}

{% docs tpch_sf1_customer_c_name %}
Customer's full name. 
This field combines first name and last name in a single string.
{% enddocs %}

{% docs tpch_sf1_customer_c_address %}
Customer's complete mailing address.
This may include street address, city, state/province, and postal code.
{% enddocs %}

{% docs tpch_sf1_customer_c_nationkey %}
Foreign key to the nation table.
Represents the nation where the customer is located.
{% enddocs %}

{% docs tpch_sf1_customer_c_phone %}
Customer's primary contact phone number.
Stored in the format: [COUNTRY_CODE]-[LOCAL_NUMBER]
{% enddocs %}

{% docs tpch_sf1_customer_c_acctbal %}
Customer's current account balance.
This is a decimal value representing the monetary amount in the default currency.
{% enddocs %}

{% docs tpch_sf1_customer_c_mktsegment %}
The market segment to which the customer belongs.
This categorization helps in targeted marketing and analysis.
{% enddocs %}

{% docs tpch_sf1_customer_c_comment %}
Additional comments or notes about the customer.
This field may contain unstructured data entered by account managers.
{% enddocs %}

############################################################
#tpch_sf1_nation
############################################################

{% docs tpch_sf1_nation %}
This table contains all Naction (Country) information.
{% enddocs %}

############################################################
#tpch_sf1_orders
############################################################

{% docs tpch_sf1_orders %}
This table contains all order information.
Orders are updated in real-time as they progress through our system.
{% enddocs %}
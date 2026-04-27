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

{% docs tpch_sf1_nation_n_nationkey %}
Primary key for the country. 
This is a unique identifier assigned to each country in our system.
{% enddocs %}

{% docs tpch_sf1_nation_n_name %}
Country name. 
{% enddocs %}

{% docs tpch_sf1_nation_n_comment %}
Additional comments or notes about the nation.
This field may contain unstructured data entered by account managers.
{% enddocs %}

############################################################
#tpch_sf1_orders
############################################################

{% docs tpch_sf1_orders %}
This table contains all order header data.
Each row represents a single order placed by a customer.
{% enddocs %}

{% docs tpch_sf1_orders_o_orderkey %}
Primary key for the order.
This is a unique identifier assigned to each order in the system.
{% enddocs %}

{% docs tpch_sf1_orders_o_custkey %}
Foreign key to the customer table.
Represents the customer who placed the order.
{% enddocs %}

{% docs tpch_sf1_orders_o_orderstatus %}
Current status of the order.
Possible values: O (open), F (fulfilled), P (partially fulfilled).
{% enddocs %}

{% docs tpch_sf1_orders_o_totalprice %}
Total price of the order including all line items.
This is a decimal value representing the monetary amount in the default currency.
{% enddocs %}

{% docs tpch_sf1_orders_o_orderdate %}
Date when the order was placed.
Used as the primary business date for order-level reporting and bi-temporal loading.
{% enddocs %}

{% docs tpch_sf1_orders_o_orderpriority %}
Priority classification of the order.
Possible values: 1-URGENT, 2-HIGH, 3-MEDIUM, 4-NOT SPECIFIED, 5-LOW.
{% enddocs %}

{% docs tpch_sf1_orders_o_clerk %}
Identifier of the clerk who processed the order.
Stored as a string in the format: Clerk#[NUMBER].
{% enddocs %}

{% docs tpch_sf1_orders_o_shippriority %}
Shipping priority flag for the order.
Integer value used to prioritize shipment processing.
{% enddocs %}

{% docs tpch_sf1_orders_o_comment %}
Additional comments or notes about the order.
This field may contain unstructured data entered by order processing staff.
{% enddocs %}

############################################################
#tpch_sf1_lineitem
############################################################

{% docs tpch_sf1_lineitem %}
This table contains all line item data representing individual items within an order.
Each row represents a single line item, identified by the combination of order key and line number.
This is the most granular transactional table in the TPC-H schema.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_orderkey %}
Foreign key to the orders table.
Together with l_linenumber forms the composite primary key of the line item.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_partkey %}
Foreign key to the part table.
Identifies the part or product included in this line item.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_suppkey %}
Foreign key to the supplier table.
Identifies the supplier who fulfilled this line item.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_linenumber %}
Sequential line number within the order.
Together with l_orderkey forms the composite primary key of the line item.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_quantity %}
Quantity of the part ordered in this line item.
Stored as a decimal value.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_extendedprice %}
Gross line item price before discount and tax (quantity * part price).
This is a decimal value representing the monetary amount in the default currency.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_discount %}
Discount rate applied to this line item.
Stored as a decimal between 0.00 and 0.10 representing a percentage.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_tax %}
Tax rate applied to this line item.
Stored as a decimal representing a percentage.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_returnflag %}
Return status flag for the line item.
Possible values: N (not returned), A (return in progress), R (returned).
{% enddocs %}

{% docs tpch_sf1_lineitem_l_linestatus %}
Fulfilment status of the line item.
Possible values: O (open/outstanding), F (fulfilled/shipped).
{% enddocs %}

{% docs tpch_sf1_lineitem_l_shipdate %}
Date when the line item was shipped.
Used as the primary effective date for bi-temporal loading of the effectivity satellite.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_commitdate %}
Committed delivery date agreed with the customer for this line item.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_receiptdate %}
Date when the customer received the line item.
Will be later than l_shipdate by the transit time.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_shipinstruct %}
Shipping instructions for this line item.
Possible values: DELIVER IN PERSON, COLLECT COD, NONE, TAKE BACK RETURN.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_shipmode %}
Mode of transport used to ship this line item.
Possible values: AIR, RAIL, SHIP, TRUCK, MAIL, FOB, REG AIR.
{% enddocs %}

{% docs tpch_sf1_lineitem_l_comment %}
Additional comments or notes about the line item.
This field may contain unstructured data entered by order processing staff.
{% enddocs %}
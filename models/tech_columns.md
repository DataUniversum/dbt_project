{% docs ldts %}
Load Date Timestamp (LDTS)

Represents the date and time when the record was loaded into the Data Vault.
Used for tracking history of data changes and enabling point-in-time analysis.

Type: TIMESTAMP
{% enddocs %}

{% docs rsrc %}
Record Source (RSRC)

Indicates the source system or process that provided the data.
Enables traceability of data back to its origin.

Type: VARCHAR
{% enddocs %}

{% docs ledts %}
Load End Timestamp (LEDTS)

Represents the date and time when the record was superseded by a newer version.
Used in conjunction with LDTS to define the validity period of a record.

Type: TIMESTAMP
{% enddocs %}

{% docs is_current %}
Flag indicating if this is the current record.
{% enddocs %}
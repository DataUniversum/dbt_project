# List of standard DataVault generics tests

## Data Vault stage

- (no test required)

## Hubs	

- Uniqueness and Not Null on Hash keys
- Uniqueness and Not Null on Business keys
- Not Null on ldts
- Not Null on rcsr

 ```
models:
  - name: <hub-name>
    columns:
      # Test: Hash key must be unique and not null.
      - name: <hub-hashkey-name>
        tests:
          - not_null
          - unique
      # Test: Business key must be unique and not null.
      # In case of composite business key, apply the test on the concatenated BK attribute.
      - name: <business-key-name>
        tests:
          - not_null
          - unique
      # Test: DV Load date timestamp must not be null.
      - name: ldts
        tests:
          - not_null
      # Test: DV record source must not be null.
      - name: rcsr
        tests:
          - not_null
```

## Links	

- Uniqueness and Not Null on Link Hash keys
- Relationship test on referenced Hub Hash keys (a.k.a. orphan check)
- Not Null on ldts
- Not Null on rcsr

## Satellites	

- Unique combination of columns on Hash key and load date timestamp
- Relationship test on parent hash key (a.k.a. orphan check)
- Not null on HashKey and HashDiff
- Not Null on ldts
- Not Null on rcsr

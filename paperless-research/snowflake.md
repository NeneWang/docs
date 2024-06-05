
To go over
- Best Practices
- Documentations and know-hows.



### UPDATE

#### UPDATE CASE

Example:
From [[corp-visualizer#Updating Creation Date with SET CASES]]
```sql

UPDATE CORPORATION
SET pf_cta_due_date = CASE
    WHEN CREATION_DATE < '2024-01-01' THEN '2025-01-01' 
    WHEN CREATION_DATE >= '2024-01-01' AND CREATION_DATE < '2025-01-01' THEN DATEADD(day, 90, CREATION_DATE) 
    WHEN CREATION_DATE >= '2025-01-01' THEN DATEADD(day, 30, CREATION_DATE) 
    ELSE pf_cta_due_date 
END;

SELECT pf_cta_due_date, creation_date FROM CORPORATION;

```



### Procedures
#procedures #functions #snowflake #2024-06-05 

A procedure is a database object similar to a function. The key differences are: 
- **Procedures are defined with the CREATE PROCEDURE command, not CREATE FUNCTION** . 
- Procedures do not return a function value; hence CREATE PROCEDURE lacks a RETURNS clause.
https://www.postgresql.org/docs/current/xproc.html#:~:text=A%20procedure%20is%20a%20database,PROCEDURE%20lacks%20a%20RETURNS%20clause.




Example:

```sql
CREATE OR REPLACE PROCEDURE update_corporation_fl_email_data()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN
    MERGE INTO CORPORATION AS corp
    USING (  
        SELECT * FROM (
            SELECT CONCAT('FL', '_', t.$1) AS pf_state_corpid,
            TRIM(t.$1) AS corporation_id,
            TRIM(t.$2) AS entity_email,
            ROW_NUMBER() OVER (PARTITION BY t.$1 ORDER BY METADATA$FILE_ROW_NUMBER DESC) AS row_num
            FROM @FL (FILE_FORMAT => csvformat, PATTERN => '.*email.*.*txt.*') AS t
        ) t 
        WHERE t.row_num = 1
    ) AS src
    ON corp.pf_state_corpid = src.pf_state_corpid
    WHEN MATCHED THEN
        UPDATE SET
            corporation_id = src.corporation_id,
            entity_email = src.entity_email 
    WHEN NOT MATCHED THEN
        INSERT (pf_id, pf_state_corpid)
        VALUES (src.corporation_id, src.pf_state_corpid);
    
    RETURN 'Merge operation completed successfully.';
END;
$$;
```


```sql
CALL update_corporation_fl_email_data();
```





### Snowflake Functions





### Metadata Snowflake

#sflk-metadata #2024-06-05 

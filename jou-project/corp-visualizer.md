

### Corporation Visualizer
#2024-06-05

Next steps:

- [ ] Add new field: **pf_cta_due_date**
- [x] Create Auto filing Script?
	- [x] Design
- [ ] Formation < 1/1/2024 = 1/1/2025
- [ ] Formation >= 1/1/2024 AND < 1/1/2025 => 90 days after formation
- [ ]  Formation >= 1/1/2025 => 30 days after formation

- [ ] Add new field: **pf_state_company_per_email_count**

- Number of companies associated to this email in this state (exclude where email is null)

---

- _For the future…_ new field: **pf_global_company_per_email_count**
- Number of companies associated with this email for any state

---
Design strategy:

Questions:
- How will update work in this case?
	- Every time the merge operation is runned. => Update procedure for **number of companies** associated. => Save as procedure.
	- **Every time rows are inserted**. the formation table view checked on insert. to compute whether something is or not => Save as function


---
### Side Research

### Procedures & Functions
#procedures #functions #snowflake #2024-06-05 

A procedure is a database object similar to a function. The key differences are: 
- **Procedures are defined with the CREATE PROCEDURE command, not CREATE FUNCTION** . 
- Procedures do not return a function value; hence CREATE PROCEDURE lacks a RETURNS clause.


### Metadata Snowflake

#sflk-metadata #2024-06-05 



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









# Corporation Visualizer Florida

### Day Tasks Inserting Date Formations 2024-06-05
#2024-06-05

Next steps:

- [x] Add new field: **pf_cta_due_date**
- [x] Create Auto filing Script?
	- [x] Design
- [x] Formation < 1/1/2024 = 1/1/2025
- [x] Formation >= 1/1/2024 AND < 1/1/2025 => 90 days after formation
- [x]  Formation >= 1/1/2025 => 30 days after formation

- [x] Add new field: **pf_state_company_per_email_count**

- [x] Number of companies associated to this email in this state (exclude where email is null)

---

- _For the future…_ new field: **pf_global_company_per_email_count**
- Number of companies associated with this email for any state

---
Design strategy:

Questions:
- How will update work in this case?
	- Every time the merge operation is runned. => Update #procedure for **number of companies** associated. => Save as #procedure[[snowflake#Procedures]]
	- **Every time rows are inserted**. the formation table view checked on insert. to compute whether something is or not => Save as #snflk-function 

[[snowflake#new]]


The documentation added to 

Example: 
#to-study 

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

#### Updating Creation Date with SET CASES
#to-study 

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


![[Pasted image 20240605130847.png]]
### Number of companies associated to this email in this state (exclude where email is null)
#2024-06-05 #to-study



Query:

```sql

UPDATE CORPORATION
SET pf_state_company_per_email_count = sub.email_count
FROM (
    SELECT ENTITY_EMAIL, pf_state, COUNT(*) AS email_count
    FROM CORPORATION
    GROUP BY ENTITY_EMAIL, pf_state
) sub
WHERE CORPORATION.ENTITY_EMAIL = sub.ENTITY_EMAIL AND CORPORATION.pf_state = sub.pf_state;
```



```sql

SELECT pf_state_company_per_email_count, ENTITY_EMAIL, pf_state FROM CORPORATION;
```


![[Pasted image 20240605131655.png]]

### Selecting the Count per state


- Lets have this first

![[Pasted image 20240605133640.png]]


### Creating and Storing Functions



### Loading New State into it.  (North Carolina)

- Think I haven't gotten them yet.

### Loading Emails to be ready


- PF_STATE (=State, two letter)
- PF_STATE_CORPID (=State + Corporation ID, ie. FL_283844)
- PF_CTA_DUE_DATE (=see above)
- PF_STATE_COMPANY_PER_EMAIL_COUNT (=see above)
- PF_GLOBAL_COMPANY_PER_EMAIL_COUNT (=see above)
- CORPORATION_ID (=Corporation ID)
- CORPORATION_NAME
- CORPORATION_TYPE
- ENTITY_EMAIL (=Email)
- FIRSTNAME_MAILING (=First name, cleaned up)
- LASTNAME_MAILING (=Last name, cleaned up)
- CREATION_DATE (“formation date?”)
- FILING_TYPE
- PF_CORPORATION_ENCODED (=internal use to put on link)
- PF_STATE_CORPID_ENCODED
- STATUS
- PF_LOADED_DATE (=date record was loaded to our database)
- PF_ID  (platinum ID)

![[Pasted image 20240607125621.png]]

> I think here I was just taking a picture from her screenshot

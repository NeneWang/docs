

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

![[Pasted image 20240607125621.png]]

> I think here I was just taking a picture from her screenshot

I see the login was on the credentials

[12:56 PM] Rebecca Goldstein, CPA

SFTP Site:  [**https://sftp.sosnc.gov**](https://nam02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsftp.sosnc.gov%2F&data=05%7C02%7Crgoldstein%40platinumfilings.com%7C5b3e02f7f3654e480bf808dc800d7326%7Cfdb0f85e5818407f8514ef2ffe7f75d4%7C0%7C0%7C638526042478429853%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=kgOgLK2TAVj0Rz3p%2BOvYNYy4L9OCLDwuPIQVljiYjZk%3D&reserved=0 "https://nam02.safelinks.protection.outlook.com/?url=https%3a%2f%2fsftp.sosnc.gov%2f&data=05%7c02%7crgoldstein%40platinumfilings.com%7c5b3e02f7f3654e480bf808dc800d7326%7cfdb0f85e5818407f8514ef2ffe7f75d4%7c0%7c0%7c638526042478429853%7cunknown%7ctwfpbgzsb3d8eyjwijoimc4wljawmdailcjqijoiv2lumziilcjbtii6ik1hawwilcjxvci6mn0%3d%7c0%7c%7c%7c&sdata=kgoglk2tavj0rz3p%2bovynyy4l9ocldwupiqvljiyjzk%3d&reserved=0")

Login Account: **PlatinumFilings**

NC Department of the Secretary of State

[12:57 PM] Rebecca Goldstein, CPA

pw: **Pf1L_030524**

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



Current Query:

```

select PF_STATE, PF_STATE_CORPID, PF_CTA_DUE_DATE, PF_STATE_COMPANY_PER_EMAIL_COUNT, PF_STATE_COMPANY_PER_EMAIL_COUNT AS PF_GLOBAL_COMPANY_PER_EMAIL_COUNT, CORPORATION_ID, CORPORATION_NAME, CORPORATION_TYPE, ENTITY_EMAIL, FIRSTNAME_MAILING, LASTNAME_MAILING, CREATION_DATE,  FILING_TYPE, PF_CORPORATION_ENCODED, PF_STATE_CORPID_ENCODED, STATUS, PF_LOADED_DATE, PF_ID   from CORPORATION
WHERE ENTITY_EMAIL IS NOT NULL
    AND creation_date >= '2024-01-01'
    AND creation_date < '2024-12-01' 
AND entity_email in (
    select entity_email from LESS5EMAIL) LIMIT 10;
```

Output:
![[Pasted image 20240607132229.png]]

Missing pieces:
- Did I miss parse Corporation Type?

![[Pasted image 20240607132612.png]]

![[Pasted image 20240607132822.png]]
> Seems to be corrected mapped. according to documentation


> No Results at all.![[Pasted image 20240607133333.png]]

|   |
|---|
|"DOMP" – Domestic Profit "DOMNP" – Domestic Non-Profit "FORP" – Foreign Profit "FORNP" – Foreign Non-Profit "DOMLP" – Domestic Limited Partnership "FORLP" – Foreign Limited Partnership "FLAL" – Florida Limited Liability Co. "FORL" – Foreign Limited Liability Co. "NPREG" – Non-Profit, Registration "TRUST" – Declaration of Trust "AGENT" – Designation of Registered Agent|

- Last name Mailing? => requires to be populated
- Filing Type? => isn't this the same as corporation type?

Fixed by adding the correct match:

```sql
        
WHEN NOT MATCHED THEN
    INSERT (pf_id, pf_state_corpid, pf_state, pf_source, pf_loaded_date, pf_is_active,
    
    corporation_id, corporation_name, creation_date, entity_address_1, entity_address_2, entity_city, entity_state, entity_zip, entity_country, status, registered_agent_name, registered_agent_type, registered_agent_address_1, registered_agent_city, registered_agent_state, registered_agent_zip, corporation_type, officer_1_title, officer_1_type, officer_1_last_name, officer_1_address_1, officer_1_city, officer_1_state, officer_1_zip, officer_2_title, officer_2_type, officer_2_last_name, officer_2_address_1, officer_2_city, officer_2_state, officer_2_zip, officer_3_title, officer_3_type, officer_3_last_name, officer_3_address_1, officer_3_city, officer_3_state, officer_3_zip, officer_4_title, officer_4_type, officer_4_last_name, officer_4_address_1, officer_4_city, officer_4_state, officer_4_zip, officer_5_title, officer_5_type, officer_5_last_name, officer_5_address_1, officer_5_city, officer_5_state, officer_5_zip, officer_6_title, officer_6_type, officer_6_last_name, officer_6_address_1, officer_6_city, officer_6_state, officer_6_zip, entity_mailing_address_1, entity_mailing_address_2, entity_mailing_city, entity_mailing_state, entity_mailing_zip, entity_mailing_country, ein, last_transaction_date, is_there_more_than_6_officers, report_year_1, report_date_1, report_year_2, report_date_2, report_year_3, report_date_3, firstname_mailing, pf_corporation_encode, pf_state_corpid_encoded

    )
    VALUES (src.pf_id, src.pf_state_corpid, src.pf_state, src.pf_source, src.pf_loaded_date, src.pf_is_active, 
    
    src.corporation_id, src.corporation_name, src.creation_date, src.entity_address_1, src.entity_address_2, src.entity_city, src.entity_state, src.entity_zip, src.entity_country, src.status, src.registered_agent_name, src.registered_agent_type, src.registered_agent_address_1, src.registered_agent_city, src.registered_agent_state, src.registered_agent_zip, src.corporation_type, src.officer_1_title, src.officer_1_type, src.officer_1_last_name, src.officer_1_address_1, src.officer_1_city, src.officer_1_state, src.officer_1_zip, src.officer_2_title, src.officer_2_type, src.officer_2_last_name, src.officer_2_address_1, src.officer_2_city, src.officer_2_state, src.officer_2_zip, src.officer_3_title, src.officer_3_type, src.officer_3_last_name, src.officer_3_address_1, src.officer_3_city, src.officer_3_state, src.officer_3_zip, src.officer_4_title, src.officer_4_type, src.officer_4_last_name, src.officer_4_address_1, src.officer_4_city, src.officer_4_state, src.officer_4_zip, src.officer_5_title, src.officer_5_type, src.officer_5_last_name, src.officer_5_address_1, src.officer_5_city, src.officer_5_state, src.officer_5_zip, src.officer_6_title, src.officer_6_type, src.officer_6_last_name, src.officer_6_address_1, src.officer_6_city, src.officer_6_state, src.officer_6_zip, src.entity_mailing_address_1, src.entity_mailing_address_2, src.entity_mailing_city, src.entity_mailing_state, src.entity_mailing_zip, src.entity_mailing_country, src.ein, src.last_transaction_date, src.is_there_more_than_6_officers, src.report_year_1, src.report_date_1, src.report_year_2, src.report_date_2, src.report_year_3, src.report_date_3, src.firstname_mailing, src.pf_corporation_encode, src.pf_state_corpid_encoded    
    );
```


Now lets try with the surname since we are already here.

```sql
TRIM(
  CASE WHEN POSITION(',' IN OFFICER_1_LAST_NAME) > 0 THEN
	SUBSTRING(OFFICER_1_LAST_NAME, POSITION(',' IN OFFICER_1_LAST_NAME) + 1)
  ELSE
	SUBSTRING(OFFICER_1_LAST_NAME, POSITION('  ', OFFICER_1_LAST_NAME) + 2) 
  END
) AS names,
INITCAP(
	CASE 
	WHEN POSITION(' ', names) > 0  THEN
	SUBSTRING(names, 0, POSITION(' ', names))
	ELSE 
	names
	END
) AS FirstName,
CASE WHEN FirstName is NULL OR FirstName='' THEN
	'Officer'
ELSE
	FirstName
END AS firstname_mailing,
```


Corporation Type? 
It should be mapped:

![[Pasted image 20240607132350.png]]

### Getting again the proper stage and IAM User

- We need that. I forgot the storage of that somewhere



## Credentials for snowflake_s3_connector 

```
XXXXAKIAU6GDZ6B2MKLTUP34
XXXXCitHtDXGFeUDquRA15/9X1KrxHwkWS5xnhbRd6lp
```

And the s3 should be something like:

```
s3://pfml2024/20240620/FL_SET1/
```


Why is the upload taking so long here?

FL_SET1


PFML2024

Which means also create for each set it's corresponding folder:


```sql

COPY INTO @PFML2024/20240620/FL_SET1/data_header_true.csv 
FROM (SELECT * FROM FL_SET1) 
FILE_FORMAT = (TYPE = CSV, COMPRESSION = NONE) OVERWRITE=TRUE HEADER=TRUE;
```




# Requirements

  

•   Florida records - "FL_SET1"
    o   Created 2024
    o   5 or less records per email (any time)
    o   Active
•   Florida records -  "FL_SET2"
    o   Created pre-2024
    o   Active
    o   5 or less records per email (any time)
    o   Not in Set 1
•   Fields to export:
    o   PF_ID
    o   STATUS
    o   PF_STATE
    o   PF_STATE_CORPID
    o   PF_CTA_DUE_DATE
    o   PF_STATE_COMPANY_PER_EMAIL_COUNT
    o   PF_GLOBAL_COMPANY_PER_EMAIL_COUNT
    o   CORPORATION_ID
    o   CORPORATION_NAME
    o   CORPORATION_TYPE
    o   ENTITY_EMAIL
    o   FIRSTNAME_MAILING
    o   LASTNAME_MAILING
    o   CREATION_DATE
    o   FILING_TYPE
    o   PF_CORPORATION_ENCODED
    o   PF_STATE_CORPID_ENCODED
    o   PF_LOADED_DATE
•   Also create a new table called "Corporation Tracking":
    o   PF_ID
    o   DATE/TIME
    o   ACTION ("BATCHED","OPENED", etc.)
    o   BATCH NAME
•   Create CSVs, add to tracking (refer to OnGage docs on how the CSV should be formatted)
•   Create a new S3 bucket, public, us-east-1 (pfml2024)
•   Upload the CSVs to:
    o   s3://pfml2024/20240620/FL_SET1/flset1load.csv
    o   etc.
•   Go into OnGage
•   Create all our fields (if they don't exist, like email)
•   Import set 1 into OnGage

  ### Changes:

  

Add:

- PF_EMAIL_ENCODED

Remove following default fields:
- REMOVE from connect Ongage:

os, gender, ip, language, country, product_id

Map the follwoing Fields in the Export:

- firstname_mailing -> first_name
- lastname_mailing -> last_name
- entity_email -> email
    o   PF_ID
    o   STATUS
    o   PF_STATE
    o   PF_STATE_CORPID
    o   PF_CTA_DUE_DATE
    o   PF_STATE_COMPANY_PER_EMAIL_COUNT
    o   PF_GLOBAL_COMPANY_PER_EMAIL_COUNT
    o   CORPORATION_ID
    o   CORPORATION_NAME
    o   CORPORATION_TYPE
    o   ENTITY_EMAIL AS email
    o   FIRSTNAME_MAILING
    o   LASTNAME_MAILING
    o   CREATION_DATE
    o   FILING_TYPE
    o   PF_CORPORATION_ENCODED
    o   PF_STATE_CORPID_ENCODED
    o   PF_LOADED_DATE

  
  

# Exports:

  

```sql

BASE64_ENCODE(CORPORATION_NAME) AS pf_corporation_encoded,

BASE64_ENCODE(PF_STATE_CORPID) AS pf_state_corpid_encoded,

BASE64_ENCODE(creation_date) AS pf_creation_date_encoded,

```

  
  

Update query:

  

```sql

ALTER TABLE CORPORATION ADD pf_creation_date_encoded VARCHAR;

  

UPDATE CORPORATION

SET pf_creation_date_encoded = BASE64_ENCODE(creation_date);

```

  

Now lets see the results:

  
  

```sql
SELECT
    PF_STATE,
    PF_STATE_CORPID,
    PF_CTA_DUE_DATE,
    PF_STATE_COMPANY_PER_EMAIL_COUNT,
    PF_STATE_COMPANY_PER_EMAIL_COUNT AS PF_GLOBAL_COMPANY_PER_EMAIL_COUNT,
    CORPORATION_ID,
    CORPORATION_NAME,
    CORPORATION_TYPE,
    ENTITY_EMAIL,
    FIRSTNAME_MAILING,
    LASTNAME_MAILING,
    CREATION_DATE,  
    CORPORATION_TYPE AS FILING_TYPE,
    PF_CORPORATION_ENCODED,
    PF_STATE_CORPID_ENCODED,
    STATUS,
    PF_LOADED_DATE,
    PF_ID,
    PF_CREATION_DATE_ENCODED
FROM
    CORPORATION
WHERE
    ENTITY_EMAIL IS NOT NULL
    AND CREATION_DATE >= '2024-01-01'
    AND CREATION_DATE < '2024-12-01'
    AND ENTITY_EMAIL IN (
        SELECT ENTITY_EMAIL FROM LESS5EMAIL

    );

  

```

  
  

Exporting specifics:

  

```

Ongage export example:

Key changes that make it different from the original request:

Add:

- PF_EMAIL_ENCODED

Map the follwoing Fields in the Export:

- firstname_mailing -> first_name

- lastname_mailing -> last_name

- entity_email -> email

```

  
  

```sql

  

DROP TABLE LESS5EMAIL;
CREATE TEMPORARY TABLE LESS5EMAIL AS
SELECT
    ENTITY_EMAIL,count(*) cnt
FROM
  corporation
WHERE status = 'A'
AND pf_state = 'FL'
AND (officer_6_last_name IS NULL OR officer_6_last_name='')
AND is_there_more_than_6_officers = FALSE
GROUP BY ENTITY_EMAIL, pf_state
HAVING count(1) < 4;
  

select
    pf_id,
    status,
    pf_state,
    pf_state_corpid,
    TO_CHAR(pf_cta_due_date, 'MM/DD/YYYY') as pf_cta_due_date,
    pf_state_company_per_email_count,
    pf_state_company_per_email_count as pf_global_company_per_email_count,
    corporation_id,
    corporation_name,
    corporation_type,
    entity_email as email,
    firstname_mailing as first_name,
    lastname_mailing as last_name,
    TO_CHAR(creation_date, 'MM/DD/YYYY') as creation_date,  
    corporation_type as filing_type,
    BASE64_ENCODE(corporation_name) as pf_corporation_encoded,
    BASE64_ENCODE(pf_state_corpid) as pf_state_corpid_encoded,
    BASE64_ENCODE(creation_date) as pf_creation_date_encoded,
    TO_CHAR(pf_loaded_date, 'MM/DD/YYYY') as pf_loaded_date
from
    corporation
where
    entity_email is not null
    and creation_date >= '2024-01-01'
    and creation_date < '2024-12-01'
    and entity_email in (
        select entity_email from less5email
    )

limit 10;

  
  
  

```

  

•   Florida records - "FL_SET1"
    o   Created 2024
    o   5 or less records per email (any time)
    o   Active
•   Florida records -  "FL_SET2"
    o   Created pre-2024
    o   Active
    o   5 or less records per email (any time)
    o   Not in Set 1
  

•   Also create a new table called "Corporation Tracking":
    o   PF_ID
    o   DATE/TIME
    o   ACTION ("BATCHED","OPENED", etc.)
    o   BATCH NAME

•   Create CSVs, add to tracking (refer to OnGage docs on how the CSV should be formatted)
•   Create a new S3 bucket, public, us-east-1 (pfml2024)
•   Upload the CSVs to:
    o   s3://pfml2024/20240620/FL_SET1/flset1load.csv
    o   etc.

Should I have a trick to have the CSV being added in each row?
- In each row you should try then to grab this data. from rest end point and run the entire operations

```sql
-- Create or replace FL_SET1 table
CREATE OR REPLACE TEMPORARY TABLE FL_SET1 AS
SELECT 
    pf_id,
    status, 
    pf_state,
    pf_state_corpid, 
    TO_CHAR(pf_cta_due_date, 'MM/DD/YYYY') AS pf_cta_due_date,
    pf_state_company_per_email_count, 
    pf_state_company_per_email_count AS pf_global_company_per_email_count, 
    corporation_id, 
    corporation_name, 
    corporation_type, 
    entity_email AS email,
    firstname_mailing AS first_name,
    lastname_mailing AS last_name,
    creation_date AS creation_date_f,
    TO_CHAR(creation_date, 'MM/DD/YYYY') AS creation_date,  
    corporation_type AS filing_type,
    BASE64_ENCODE(corporation_name) AS pf_corporation_encoded,
    BASE64_ENCODE(pf_state_corpid) AS pf_state_corpid_encoded,
    BASE64_ENCODE(creation_date) AS pf_creation_date_encoded,
    TO_CHAR(pf_loaded_date, 'MM/DD/YYYY') AS pf_loaded_date
FROM 
    corporation
WHERE 
    pf_state = 'FL'
    AND creation_date_f >= '2024-01-01'
    AND status = 'A'
    AND email IN (
        SELECT ENTITY_EMAIL FROM LESS5EMAIL
    );

-- Create or replace FL_SET2 table
CREATE OR REPLACE TEMPORARY TABLE FL_SET2 AS
SELECT 
    pf_id,
    status, 
    pf_state,
    pf_state_corpid, 
    TO_CHAR(pf_cta_due_date, 'MM/DD/YYYY') AS pf_cta_due_date,
    pf_state_company_per_email_count, 
    pf_state_company_per_email_count AS pf_global_company_per_email_count, 
    corporation_id, 
    corporation_name, 
    corporation_type, 
    entity_email AS email,
    firstname_mailing AS first_name,
    lastname_mailing AS last_name,
    creation_date AS creation_date_f,
    TO_CHAR(creation_date, 'MM/DD/YYYY') AS creation_date,  
    corporation_type AS filing_type,
    BASE64_ENCODE(corporation_name) AS pf_corporation_encoded,
    BASE64_ENCODE(pf_state_corpid) AS pf_state_corpid_encoded,
    BASE64_ENCODE(creation_date) AS pf_creation_date_encoded,
    TO_CHAR(pf_loaded_date, 'MM/DD/YYYY') AS pf_loaded_date
FROM 
    corporation
WHERE 
    pf_state = 'FL'
    AND creation_date_f < '2024-01-01'
    AND status = 'A'
    AND email IN (
        SELECT ENTITY_EMAIL FROM LESS5EMAIL
    );
    
-- Select from FL_SET1 to verify the data

-- SELECT * FROM FL_SET1 LIMIT 10;

COPY INTO @PFML2024/20240620/FL_SET1/flset1load.csv 
FROM (SELECT * FROM FL_SET1) 
FILE_FORMAT = (TYPE = CSV, COMPRESSION = NONE, field_optionally_enclosed_by = "'") OVERWRITE=TRUE HEADER=TRUE;


COPY INTO @PFML2024/20240620/FL_SET2/flset2load.csv 
FROM (SELECT * FROM FL_SET2) 
FILE_FORMAT = (TYPE = CSV, COMPRESSION = NONE, field_optionally_enclosed_by = "'") OVERWRITE=TRUE HEADER=TRUE;  
```
  

EYPERXH.KPB27206


- S3 Positions



```json
{
 "Version": "2012-10-17",
 "Id": "S3GetObjectForOngageImportsBucketViaOngageServers",
 "Statement": [
   {
     "Sid": "allow-ongage-server",
     "Effect": "Allow",
     "Principal": "*",
     "Action": "s3:GetObject",
     "Resource": "arn:aws:s3:::pfml2024/*",
     "Condition": {
       "IpAddress": {
         "aws:SourceIp": [
           "107.170.213.132/32",
           "107.170.213.133/32",
           "107.170.213.134/32",
           "107.170.213.135/32",
           "107.170.213.136/32",
           "107.170.213.137/32",
           "107.170.213.138/32",
           "107.170.213.139/32",
           "107.170.213.140/32",
           "107.21.59.147/32",
           "107.23.10.125/32",
           "107.23.12.93/32",
           "107.23.14.88/32",
           "107.23.177.90/32",
           "107.23.178.47/32",
           "108.161.135.135/32",
           "108.161.135.37/32",
           "178.128.139.133/32",
           "18.200.73.64/26",
           "192.241.212.130/32",
           "198.199.88.38/32",
           "206.189.241.97/32",
           "207.244.103.131/32",
           "207.244.103.201/32",
           "207.244.103.202/32",
           "207.244.104.119/32",
           "207.244.104.120/32",
           "207.244.104.121/32",
           "207.244.104.122/32",
           "207.244.104.201/32",
           "207.244.104.202/32",
           "207.244.68.218/32",
           "209.208.109.152/32",
           "209.208.109.172/32",
           "209.208.78.150/32",
           "23.20.201.102/32",
           "23.21.219.19/32",
           "23.23.212.1/32",
           "34.224.117.198/32",
           "34.225.42.120/32",
           "34.226.5.95/32",
           "34.227.41.239/32",
           "34.231.210.31/32",
           "34.231.44.192/26",
           "34.232.157.165/32",
           "34.245.82.192/26",
           "34.245.82.199/32",
           "34.245.82.204/32",
           "34.245.82.233/32",
           "34.245.82.234/32",
           "34.245.82.236/32",
           "34.245.82.237/32",
           "34.245.82.244/32",
           "34.245.82.246/32",
           "34.245.82.247/32",
           "34.245.82.248/32",
           "35.153.84.250/32",
           "50.19.198.209/32",
           "50.56.240.150/32",
           "52.0.251.22/32",
           "52.0.56.158/32",
           "52.1.57.9/32",
           "52.1.99.254/32",
           "52.201.178.193/32",
           "52.204.236.101/32",
           "52.208.21.200/32",
           "52.21.252.120/32",
           "52.2.154.228/32",
           "52.21.93.98/32",
           "52.5.100.202/32",
           "52.7.119.14/32",
           "54.165.140.21/32",
           "54.173.254.154/32",
           "54.175.238.172/32",
           "54.208.127.76/32",
           "54.208.164.47/32",
           "54.208.99.126/32",
           "54.209.202.108/32",
           "54.209.204.31/32",
           "54.209.205.54/32",
           "54.209.208.240/32",
           "54.209.210.149/32",
           "54.209.213.207/32",
           "54.209.232.207/32",
           "54.209.238.30/32",
           "54.209.247.123/32",
           "54.209.247.137/32",
           "54.209.252.68/32",
           "54.209.253.24/32",
           "54.209.253.50/32",
           "54.236.65.189/32",
           "54.236.73.137/32",
           "54.236.83.142/32",
           "54.86.137.29/32",
           "54.88.127.35/32",
           "5.79.106.181/32",
           "69.28.92.114/32",
           "69.28.92.155/32",
           "69.28.93.182/32",
           "69.28.94.194/32",
           "69.28.94.223/32",
           "69.28.95.55/32",
           "69.28.95.62/32",
           "81.171.19.60/32",
           "95.85.17.120/32"
         ]
       }
     }
   }
 ]
}

```




- Where to get the key?

I mean the secret key? Where is that?

https://ongage.atlassian.net/wiki/spaces/HELP/pages/2968584193/Validation+API#API-Request
```
POST https://api.ongage.io/email-validation/api/v1/realtime-validation
Header: 
x-api-key: THE_SECRET_KEY_HERE
Body: 
{ “email”@”address.com”}
```


Yeah I mean awesome, it replces the user password, but where is the SECRET KEYYY

This is the new API Authentication, and replaces the Username Password authentication described in our [API Getting Started](https://ongage.atlassian.net/wiki/spaces/HELP/pages/70418454 "/wiki/spaces/HELP/pages/70418454") guide.


Here you have a way to do it, but is likely outdated":


```
X_USERNAME: your_ongage_username
X_PASSWORD: your_ongage_password
X_ACCOUNT_CODE: your_ongage_account_code
```


```
X_USERNAME: nwang@platinumfilings.com
X_PASSWORD: 4hP&seVu4lFBPL&S
X_ACCOUNT_CODE: 18748
```


List ID: 232244


POST URL: https://api.ongage.net/<list_id>/api/contact_counts

![[Pasted image 20240626113953.png]]


```

POST URL: https://api.ongage.net/232244/api/contact_counts
```


```json

{
    "criteria": {
      "field_name": "name",
      "type": "string",
      "operator": "LIKE",
      "operand": [ "Nelson" ],
      "case_sensitive": "0"
    }
}
```







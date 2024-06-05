

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








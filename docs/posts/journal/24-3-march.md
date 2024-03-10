---
title: 2024 March
---


## 5 Tuesday


### Some notes regarding the idea of dev. And how to enforce such:

- 48 Hours policy for all getbacks. 24 Hours Policy for sms replies.

With this type of policy you should be able to keep up with work.

- In New York locations allow also: Visits and Monthly Photoshoot Sessions to keep Media upkeep.

How to enforce such? Using the Focusmate strategy and just blocking the hours expected during the week immediatelly upon having a task received.

Also how do you keep track of clients?

How about the hours credit proposal?


Wait how am I handling the Interactions again?
Does it make sense to hae the event start and end, and not keep track of all interactions?
My guess is that I can avoid creating the timeslots. And if the end one (The latest one records everyting as expected)



## 7 Thursday


### Where is the error?

```bash
Processing ID fetched: [246]
Processing Status Changed to: PROCESSING
Processing Started for: 6c9a5500-00f0-4a26-a1b6-efd5c7eba828
ERROR:ERROR: current transaction is aborted, commands ignored until end of transaction block
```


This occurs before:

```py
class ConnectorBasedIntegrationAdapter(IntegrationDataAdapter):
    integration_name = 'connector_based_adapter'
    def retrieveOrganizationData(self, jobService: JobService) -> dict:
        """
        Retrieves in the following format:
        Since the same user is guaranteed for this entire data cluster. Expect only a single requirement.
        {
            organization_guid: str,
            organization_id: int,
            timezone: str,
            user_id: int
        }
        """
        
        cursor = jobService.cursor
        res = {
            "organization_guid": jobService.organization_guid,

        } # nod to leetcode xd


        
        # Retrieve organization_id 
        cursor.execute(
            f"SELECT id FROM organization WHERE guid = '{jobService.organization_guid}'"
        )
        cursor_response_organization = cursor.fetchone()
        print('Organization data found for connector:', cursor_response_organization)

        if not cursor_response_organization:
            jobService.addLogMessage(
                log_message=f"Organization not found in the database. from organization {jobService.organization_guid}",
                log_detail="Organization not found in the database. from organization {jobService.organization_guid}\n\
                    using integration_name {self.integration_name} and organization_guid {jobService.organization_guid}",
                log_type="Error"
                )
            # This should be a breaking error
            raise Exception("Organization not found in the database.")
        
        res["organization_id"] = cursor_response_organization[0]

        # Check for the user_id where connector is X
        cursor.execute(
            f"SELECT c.user_id, u.timezone FROM connector AS c JOIN users AS u ON u.id = c.user_id WHERE c.guid = '{jobService.connector_guid}';"
        )
        cursor_response = cursor.fetchone()  
```

## 8 Friday

- [x] 8.1 Allowing Errors Report to be also on the end message.
- [x] 8.2 Add some design considerations
- [x] 8.3 Deploy a Staging Equivalent? (This is required first for the migration of data models to be run first.)
- [x] 8.4 Update Model's username to be included.
- [ ] 8.5 Send the correct model and the right snapshot.
- [ ] 8.6 Continue working first on the Data Science Project: Get started with it!
- [ ] 8.7 Fix Nancy Site, issue with the images.
- [ ] 8.8 Drafting a General Business Proposal as for how the business works. 
- [ ] 8.12 Work on Music Assignment
- [ ] 8.13 Work on IOS App Dev Assigmnet.
- [ ] 8.9 Drafting a simple logistics way to have the prciing for each feature and estimated rates for different common services.
- [x] 8.10 Draft a way to logically divide distinct work.
- [ ] 8.11 Add that feature to your website (Anvil Tech).


### 8.1 Allowing Errors Report to be also on the end message.

It looks as if the error report does indeed make sense.

### 8.2 Adding Design Considerations

- models `username`
- Update layout screens with the ts1, etc configurations


### 8.6 Continue working first on the Data Science Project: Get started with it!

- [ ] Show the data
- [ ] Work on Shwoing the basics of the dataset illustrating the distributions? 


### 8.7 Fix Nancy Site, issue with the images.

> Done


### 10 Sunday

Objectives:

- Study Notes.
















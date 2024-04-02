---
title: 2024 March
tags:
  - journal
---


## 5 Tuesday


### Some notes regarding the idea of dev. And how to enforce such:

- 48 Hours policy for all get backs. 24 Hours Policy for SMS replies.

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
- [x] 8.5 Send the correct model and the right snapshot.
- [x] 8.6 Continue working first on the Data Science Project: Get started with it!
- [x] 8.7 Fix Nancy Site, issue with the images.
- [x] 8.8 Drafting a General Business Proposal as for how the business works. 
- [x] 8.12 Work on Music Assignment
- [x] 8.13 Work on IOS App Dev Assignment.
- [x] 8.9 Drafting a simple logistics way to have the pricing for each feature and estimated rates for different common services.
- [x] 8.10 Draft a way to logically divide distinct work.
- [x] 8.11 Add that feature to your website (Anvil Tech).


### 8.1 Allowing Errors Report to be also on the end message.

It looks as if the error report does indeed make sense.

### 8.2 Adding Design Considerations

- models `username`
- Update layout screens with the ts1, etc. configurations


### 8.6 Continue working first on the Data Science Project: Get started with it!

- [x] Show the data
- [x] Work on Showing the basics of the dataset illustrating the distributions? 



## 12 Tuesday

### 12.todo

- [x] 12.1 Create Mockup Cards
	- [x] Document the Creation of mockup cards
- [ ] 12.2 Chrome Extension
- [x] 12.3 Checking Antonio's Latest Release
- [ ] 12.4 Exploring Future Cookbook integrations (Soon) regex, sql, react
	- [ ] Second tier: Math, Stats, Discrete (From the practice book)


### 12.1 Create Mockup Cards

- [x] Document the creation  of Mockup Cards

- Ensure new model related to suer is documented in summary:

newest changes:
- Added username


- [x] Feature Request?

### 12.2 Continue Working On Chrome Extension


- [x] Modify Link to update to newest endpoint.
[https://in.api.loading.win/dev/incoming](https://in.api.loading.win/dev/incoming "https://in.api.loading.win/dev/incoming")
- [ ] Update Chrome documentation to reflect recent changes.
- [ ] Changing body to suit latest staging event structure.
- [ ] Use Chrome Connector Credential Associated.
- [ ] Update to 1 minute instead of whatever it is right now.


### 12.3 Checking Antonio's latest release. 


Make sure to check the following is working properly:

- [x] Does it send events correctly?


> Lets explore the tracking?

![](../../../img/Pasted%20image%2020240312112552.png)

It doesn't seem to be sending events that are being accepted

> is it sending towards `localhost`?

```cs
#if false    
                // SettingsService.SetRestApiEndpoint("http://localhost:3000/staging_events");
                SettingsService.SetRestApiEndpoint("http://stage.api.loading.win/staging_events");
#else
                SettingsService.SetRestApiEndpoint("https://in.api.loading.win/dev/incoming");
#endif
```

Doesn't seem to, not the `false`

> Let's see what happens on the Lambda logs + Dynamo for any error logs.

![](../../../img/Pasted%20image%2020240312112450.png)

We can see here that it all matches:

![[../../../img/Pasted image 20240312111010.png]]

And the connector is matching

> Checking for error marked in dynamo table?

![](../../../img/Pasted%20image%2020240312112501.png)

Can be seen that no `total_errors` neither `total_connects` were updated, is this because the lambda didn't implement it?

#### Talking to fix the Dev code:

![](../../../img/Pasted%20image%2020240312131849.png)

> Seems that Anthony didn't push the last version:
> 
![](../../../img/Pasted%20image%2020240312132008.png)
Fixed.

> When sending to in.api:

![](../../../img/Pasted%20image%2020240312131813.png)


However doesn't seem to be inserting the right values.

> Does it post locally?

![](../../../img/Pasted%20image%2020240312132135.png)

Yes, The fields also looks correct

> So lets see if the problem is in the cloud:


```json
{
  guid: '4572d2c4-973e-4796-9015-44236457fcbc',
  date: '2024-03-12T17:05:33.5990383Z',
  connector: '4c374db5-8e37-428e-b988-92ce9879165b',
  version: '1.0',
  organization: '0238bfa6-2a89-42fe-8a67-fde4c80391ea',
  signature_1: '884493dcf2f03089f9c63b196808b0fd5300db0e9887783da94223c4ca4ab1c6',
  signature_2: 'a248fe59218c37ea2a841ec57a76fd8d43e0693a8ef34f5115c51ade1f0d03b4',
  details: [
    '{"event_date":"2024-03-12T15:40:50.601812Z","event_end_date":"2024-03-12T15:40:52.0441286Z","window_title":null,"name":"explorer","span_guid":"a88c04b7-0f54-440c-bc13-982b9be4cad8","description":null,"keypresses":0,"mouseclicks":1,"windows_pid":"6724","id":0,"guid":"483849fe-8a29-4a15-ae3e-d37a24f24db5","event_type":"WIN_APP_ACTIVE","actor":"AzureAD\\\\NelsonWang"}',
    '{"event_date":"2024-03-12T15:40:52.0603322Z","event_end_date":"0001-01-01T00:00:00","window_title":null,"name":"explorer","span_guid":"e59fcf70-e84b-470d-823e-69ab062e9714","description":null,"keypresses":0,"mouseclicks":0,"windows_pid":"6724","id":0,"guid":"a29d1293-d7ed-468e-a74d-00709f02f69c","event_type":"WIN_APP_ACTIVE","actor":"AzureAD\\\\NelsonWang"}'
  ]
}
```

There are more events, but I am hiding them.


So lets review postman:
![](../../../img/Pasted%20image%2020240312133334.png)

There were no logs in the CloudWatch

But if I use the old link:
![](../../../img/Pasted%20image%2020240312133433.png)

Does that even make sense? They are pointing to the same lambda in the end.
But in this case I am at least getting some logs:
![](../../../img/Pasted%20image%2020240312133513.png)

```bash
2024-03-12T13:14:53.373-04:00

[ERROR] Runtime.UserCodeSyntaxError: Syntax error in module 'lambda_function': invalid syntax. Perhaps you forgot a comma? (lambda_function.py, line 110)  
Traceback (most recent call last):  
  File "/var/task/lambda_function.py" Line 110  
                'organization': {
```

It was missing a comma:

```py

            'organization': {
                'DataType': 'String',
                'StringValue': d['organization']
            }
            'connector': {
                'DataType': 'String',
                'StringValue': d['connector']
            },
```

Fixed to:

```

            'organization': {
                'DataType': 'String',
                'StringValue': d['organization']
            },
            'connector': {
                'DataType': 'String',
                'StringValue': d['connector']
            },
```

Lets deploy and test:

Fixed:
![](../../../img/Pasted%20image%2020240312133752.png)

??

![](../../../img/Pasted%20image%2020240312133809.png)
Not fixed on in.api...

After searching: https://stackoverflow.com/questions/57168148/unable-to-resolve-not-a-valid-key-value-pair-missing-equal-sign-in-authoriza



> [](https://stackoverflow.com/posts/57172027/timeline)
 I resolved it. I changed my method to come from the root resource (instead of the unnecessary {proxy+}, and also noticed that my python method was incorrect. I had `response = requests.post(url, headers=headers, data=my_json)`, but data only accepts a string. I have to use either `requests.post(url, headers=headers, json=my_json)` or `requests.post(url, headers=headers,data=json.dumps(my_json))`



Lets make a temporary fix and make a note for it:

```cs
#if false
                SettingsService.SetRestApiEndpoint("http://localhost:3000/staging_events");
#else
                // SettingsService.SetRestApiEndpoint("https://in.api.loading.win/dev/incoming");
                SettingsService.SetRestApiEndpoint("https://c27bsii3c1.execute-api.us-east-1.amazonaws.com/dev/incoming");
#endif
```

![](../../../img/Pasted%20image%2020240312134958.png)
One windows log is being processed at least.

- [x] How about if a user is active in a site for more than 1 minute?
- [x] How about Admin install permissions?

![](../../../img/Pasted%20image%2020240312135113.png)


#### Inspecting the Staging Event

![](../../../img/Pasted%20image%2020240312135318.png)

You can see here there is an issue or potential issue. Is details being sent as a string for each row?

Lets check the S3


Hm, not event accepting it huh?

Only this was sent that is correct:

![](../../../img/Pasted%20image%2020240312135602.png)

And as seen on sql query figure, there is only one event being processed, which means most sent here fail:

Lets log in `staging_events` local. and save it into json

```js
const express = require('express');

const http = require('http');

const app = express();

const server = http.createServer(app);

const bodyParser = require('body-parser');

  

// Middleware to parse JSON bodies

app.use(bodyParser.json());

  

// Define the POST route for staging_events

app.post('/staging_events', (req, res) => {

  console.log('Received message:', req.body);

  console.log("----------------------------------------------------------------------------");

  // Save as new event.json

  var fs = require('fs');

  fs.writeFile('event.json', JSON.stringify(req.body), function (err) {

    if (err) throw err;

    console.log('Saved!');

  });

  // You can process the event here as needed

  

  // Send a response back to the client

  res.status(200).send('Event received');

});

  

// Start the server

server.listen(3000, () => {

  console.log('Server started on port 3000');

});

```

That logs the follwoing:

![](../../../img/Pasted%20image%2020240312141020.png)

- You can see that this is a string.
Which wont sent any issues:

![](../../../img/Pasted%20image%2020240312141107.png)

It does get saved here using Postman, but then, why it wasn't being saved before?:

![](../../../img/Pasted%20image%2020240312141221.png)

So lets try sending events to windows. Most likely it doesn't support even fetching it.

> Does Cloudwatch complain anything useful?

Therefore Option 2 Should be set to run:

> Make Lambda resilient by Allowing None. 


Here

![](../../../img/Pasted%20image%2020240312141904.png)

Here a fairly recent error mentioning the following:


2024-03-12T14:17:28.805-04:00

[ERROR] KeyError: 'User-Agent'  
Traceback (most recent call last):  
  File "/var/task/lambda_function.py", line 74, in lambda_handler  
    request_data["user_agent"] = event['headers']['User-Agent']

Oh look:

![](../../../img/Pasted%20image%2020240312142027.png)

User-agent is probably not being set at Windows

> Temporary fix making User-Agent: NelsonRuntime


Look at that! We can't force it:

![](../../../img/Pasted%20image%2020240312142443.png)

> Lets make it null safe instead
```python
request_data["user_agent"] = event['headers'].get('User-Agent', '') # None Safe
```

Logs look healthy

![](../../../img/Pasted%20image%2020240312145245.png)

![](../../../img/Pasted%20image%2020240312145422.png)

Looks healthy (except because of the known error of the strings.)


#### Fix notes:

- Is saving detail events as a string
- I don't think is posting it correctly to the endpoint (as can be seen that the postman just works fine while but when we are depending on  )
	- The error doesn't seem to be on the body.
	- It seems that it is because in Headers User-Agent should be set.
	- Solutions: we could either make Lambda more resilient by allowing no user-agent set.
	- Force all connectors to use User Agent
	- Or do both. (At least force it in Windows.)






### 12.4 Auth0

https://manage.auth0.com/dashboard/us/dev-vobjs07lab7w5wgx/apis

Api Audience: https://dev-vobjs07lab7w5wgx.us.auth0.com/api/v2/

- [ ] Plan some ideas regarding discussions with Ashraf into how to integrate the userbase.


https://developer.chrome.com/docs/extensions/reference/api/enterprise/deviceAttributes
!! **Important:** This API works **only on ChromeOS**.


Is this the same for Force Install?

Here Some [promising attributes](https://developer.chrome.com/docs/extensions/reference/api/enterprise/deviceAttributes):

! But they only work for Chrome OS.

```
chrome.enterprise.deviceAttributes.getDeviceHostname(  callback?: function,  
)

```

```
chrome.enterprise.deviceAttributes.getDeviceSerialNumber(  callback?: function,  
)
```

```
chrome.enterprise.deviceAttributes.getDeviceAssetId(  callback?: function,  
)
```


Fetches the administrator-annotated Asset Id. If the current user is not affiliated or no Asset Id has been set by the administrator, returns an empty string.


**Looking at Identity**

Fetches the administrator-annotated Asset Id. If the current user is not affiliated or no Asset Id has been set by the administrator, returns an empty string.

- These are all related to the user Logged Identity

### Chrome Instance ID

Use `chrome.instanceID` to access the Instance ID service.

> Instance ID provides a unique ID per instance of your apps. You can implement Instance ID for [Android](https://developers.google.com/instance-id/guides/android-implementation) and [iOS](https://developers.google.com/instance-id/guides/ios-implementation) apps as well as [Chrome apps/extensions](https://developer.chrome.com/apps/instanceID).

Pass Instance ID tokens to your server and use the Instance ID service to verify the app package name and check if it has a valid signature. Verifying tokens with the Instance ID Cloud Service helps identify known apps. To reduce cost and redundant round trip communications, configure your server to store these tokens so the check is needed only once. In the event of a security concern, your app can delete tokens, or Instance ID itself, and generate new ones. In addition, the Instance ID server initiates token or Instance ID refresh if it detects bugs or security issues.



Search Scope Hypothesis:

- If it exists is an enterprise feature
- Wouldn't make sense for Chrome to somehow detect your unique pc id.
- Neither to have an identifier of your laptop unless is a Chromebook.

- You need to fix that SLC site thing.
- You need to allow option for Local Edit.
- You need to allow option to eras images in favor of local edit? How about images? I am not sure neither.


Negotiations

- What are we offering to clubs? 
	- Enhancing club members experience
	- Allow Users the option to opt out and anonymously share their transaction data for product improvement/feedback and personal report.
	- Offer API and Dataset and Customers Data 
	- Data and Data Historical Data Inference Course and Talks
	- Build Relations with Investment Clubs (Starting from CUNY and immediate NYC Schools)
	- Instant access to our private network of industry connections.
- Making an offer they cant afford to lose.
- Why build customer relationships?
- Being able to market locally in person is a huge advantage. And me and Armando are graduating this semester which means no more in campus advantage. Building relationships with Clubs, will however allow us to bypass our school timeframe, and as long as these clubs exists we have word to word marketing done by someone else.
- As long as any of these two products have some success, we can retarget the same audience with the interviewing tool.



## 14 Thursday


### 14.todo

### 14.1 Fixing the Issue with the Local Timeslot


> Why is `timestamp_local` the same as timestamp after processing?

![[Pasted image 20240314110612.png]]

How is this even possible?

This part is correct:

```python
  

        events_list: List[Event] = []
        timeslots_lists: List[Timeslot] = []  

        for eventData in eventDataList:

            event: Event = Event(

                guid = eventData.event_guid,
                organization_guid = eventData.organization_guid,
                organization_id = eventData.organization_id,
                user_id = eventData.user_id,
                application = eventData.application,
                app = eventData.app,
                app_type = eventData.app_type,
                operation = eventData.operation,
                operation_type = eventData.operation_type,
                integration_name = eventData.integration_name,
                local_timezone= eventData.local_timezone,
                timestamp = eventData.timestamp,
                end_time = eventData.end_time,
                timestamp_local = eventData.timestamp_local,
```




This looks correct here?

```python
    def defineTimeslot(self, curr_time: datetime.datetime, eventData: EventData) -> Timeslot:

        # Calulcate the ts1 as the minute of the day. e.g. 00:00:00 -> 0, 00:01:00 -> 1, 00:02:00 -> 2
        timestamp_datetime: datetime.datetime = curr_time
        timestamp_local_datetime: datetime.datetime = timestamp_datetime.astimezone(pytz.timezone(eventData.local_timezone))
  

        # Extract UTC Date Time Components
        hour = timestamp_datetime.hour
        minute = timestamp_datetime.minute
        day = timestamp_datetime.day
        month = timestamp_datetime.month
        year = timestamp_datetime.year

  
        timestamp_isocalendar = timestamp_datetime.isocalendar()
        week =  timestamp_isocalendar[1]
        weekday = timestamp_datetime.weekday()


        hour_local = timestamp_local_datetime.hour
        minute_local = timestamp_local_datetime.minute
        day_local = timestamp_local_datetime.day
        month_local = timestamp_local_datetime.month
        year_local = timestamp_local_datetime.year
  

        timestamp_local_isocalendar = timestamp_local_datetime.isocalendar()
        week_local =  timestamp_local_isocalendar[1]
        weekday_local = timestamp_local_datetime.weekday()


        ts1 = timestamp_datetime.hour * 60 + timestamp_datetime.minute
        ts5 = ts1 // 5
        ts10 = ts1 // 10
        ts15 = ts1 // 15 

        tl1 = timestamp_local_datetime.hour * 60 + timestamp_local_datetime.minute
        tl5 = tl1 // 5
        tl10 = tl1 // 10
        tl15 = tl1 // 15
```

Look, so the timestamp local datetime is redefined wow! Which means that it is actually incorrect!!

## 15 Friday

### 15.todo

- [ ] 15.1 Continue Working On Chrome Extension
- [ ] 15.2 Ensure that newest Chrome details work Prestine
- [ ] 15.3 Would it be of service to offer a "Code Review" every end of the week?


### 15.1 Continue Working On Chrome Extension

- [x] Refresh the System design of Chrome Extension to the current one.

It seems that the latest documentation can be found in the following [lucid](https://lucid.app/lucidchart/e68b9b43-3567-4cad-973f-59841167076d/edit?page=fIXUVjumr6Eu&invitationId=inv_b33787b6-e58a-471a-a000-680093c7a60b#) chart

Fixed Chrome Connector:

![](../../../img/Pasted%20image%2020240315115553.png)

Way more simple than before.

> Before was: more messy.

- [ ] Let's see and check that all methods don't break the flow logic.



Note the following:

```js
     */

    async checkAndNavigateIfNewDomain(current_domain_name, old_record_domain) {

        if (Constants.DEBUG) console.log("Current Domain: " + current_domain_name);

        if (Constants.DEBUG) console.log("Previous Domain: " + old_record_domain);

        if (old_record_domain !== current_domain_name) {

            if (Constants.DEBUG) console.log('Navigated to a new domain: ' + current_domain_name);

            await this.wrapNewTabFocusLog();

            await this.startNewFocusTabLog({ isEventComplete: true });

            return true;

        } else {

            if (Constants.DEBUG) console.log("Domain is the same");

            return false;

        }

    }
```

You can see that the `current` and `previous domain` is checked which is not needed on this model. Also they  shouldn't be wrapped inside a single function. But run straight from the listeners (Can be simplified.)


- [ ] Update the latest specs for windows as well.


## 16 Saturday

### 16.1 Fixing Known Errors

- [ ] Quality Fixing errors
Here we have some errors being fixed:

Lets see how to fix the following issue
![[Pasted image 20240316182600.png]]


```
number of children (3) present in TabBarView's children property. (3) present in Tawas thrown: Controller's length property (5) does not match thebBarView's childre (3) present in TabBarView's children property.
```

This seems to be the issue:

```dart
body: TabBarView(

        physics: const NeverScrollableScrollPhysics(),

        controller: myTabController.controller4,

        children: [

          RankingScreenTab(),

          UserPortfolio(),

          const CompetitionScreenTab()

        ],
```


Ok, fixed it by removing all other options:

```dart
  Container(

        height: Get.height / 5,

        child: tabAssetsView(db.userData["cash"]?.toStringAsFixed(2) ?? "0",

            db.userData["papel_asset_worth"]?.toStringAsFixed(2) ?? "0"),

      ),
```



Now lets see how we can reset this update quickly,

So this is the competition data being provided:

```json
{competition_id: 7bc69deb-b1b4-4d45-aab1-43ce2d9caf8a, competition_name: Internal Competition A, competition_description: Internal A, competition_initial_cash: 10000.0, competition_start_date: 2023-07-12T19:09:56.652866, competition_end_date: null, competition_participants: [Nelson, Jonathan Colon, Demo1 User, Armando Morel, Demo2 User, LauraMcLaughlin], competition_participants_count: 6, user_is_participant: true, competition_has_key: false}
```


Now we can see that the id is correct:

Is the API perhaps incorrect?

Lets see the join competition:


```dart
  Future<bool> joinCompetition(String competitionUuid, {String? userId}) async {

    userId ??= userData["user_id"];

  

    final joinCompetitionURL =

        "$backendAPI/api/join/$competitionUuid/$userId"; // Replace with actual API URL

  

    final response = await http.get(

      Uri.parse(joinCompetitionURL),

      headers: <String, String>{

        'Content-Type': 'application/json',

      },

    );

    if (response.statusCode == 200) {

      userData["current_competition"] = competitionUuid;

      _myBox.put("userData", userData);

      Get.snackbar(

        "Success",

        "Successfully joined competition",

        backgroundColor: green219653,

        colorText: white,

        duration: const Duration(seconds: 1),

      );

      return true;

    } else {

      Get.snackbar("Failed", "Failed to join competition",

          backgroundColor: redEB5757,

          colorText: white,

          snackPosition: SnackPosition.BOTTOM);

      return false;

    }

  }
```


```
onous suspension>
E/flutter (31832): #8      _WatchListScreenState.reloadScreen (package:paper_merchant/screen/home/watchlist/watchlist_screen.dart:44:7)
E/flutter (31832): <asynchronous suspension>
E/flutter (31832):
E/flutter (31832): [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: FormatException: Unexpected character (at character 1)
E/flutter (31832): Internal Server Error
E/flutter (31832): ^
E/flutter (31832):
E/flutter (31832): #0      _ChunkedJsonParser.fail (dart:convert-patch/convert_patch.dart:1376:5)
E/flutter (31832): #1      _ChunkedJsonParser.parseNumber (dart:convert-patch/convert_patch.dart:1243:9)
E/flutter (31832): #2      _ChunkedJsonParser.parse (dart:convert-patch/convert_patch.dart:908:22)
E/flutter (31832): #3      _parseJson (dart:convert-patch/convert_patch.dart:35:10)
E/flutter (31832): #4      JsonDecoder.convert (dart:convert/json.dart:610:36)    
E/flutter (31832): #5      JsonCodec.decode (dart:convert/json.dart:216:41)       
E/flutter (31832): #6      jsonDecode (dart:convert/json.dart:155:10)
E/flutter (31832): #7      Database.syncData (package:paper_merchant/data/database.dart:730:30)
E/flutter (31832): <asynchronous suspension>
E/flutter (31832): #8      _WatchListScreenState.reloadScreen (package:paper_merchant/screen/home/watchlist/watchlist_screen.dart:44:7)
```

Where does this error even come from?
![[Pasted image 20240316185314.png]]



Are these 3 indeed:
![[Pasted image 20240316185657.png]]

```
  Future<bool> leaveCompetition(String competitionUuid) async {

    final playerId = userData["player_id"];

    final leaveCompetitionURL =

        "$backendAPI/api/leave_competition/$playerId"; // Replace with actual API URL

  

    final response = await http.get(

      Uri.parse(leaveCompetitionURL),

      headers: <String, String>{

        'Content-Type': 'application/json',

      },

    );
```


> This is correct but lets see.

Hahah that's funny so that is why:

- should update the api to leave the competition using a different post requirement

Lets check the following as well then:

![](Pasted%20image%2020240316191026.png)

> I am guessing that this could be because of dealing with the user report of a competition one just left:

```dart
  

    if player_selected is None:

        return raiseHTTPException(status_code=404, detail="Player not found")

    user_selected = db.query(Users).filter(Users.id == player_selected.user_id).one_or_none()

    if user_selected is None:

        return raiseHTTPException(status_code=404, detail="User not found")

    competition_selected = db.query(Competitions).filter(Competitions.id == player_selected.competition_id).one_or_none()

    if competition_selected is None:

        return raiseHTTPException(status_code=404, detail="Competition not found")
```

I think the default option should be to instead, try to create a user from the missing player id.

Lets check;

- [x] How is this being solved in login? Should I create instead a player? The problem is that also no player is available.
- [x] Make a default in which you can't leave your current competition


### Make the secondary loading silent.

> Done.

> also made the logarithmic immediate which is damn beautiful


![](Pasted%20image%2020240316194047.png)
![](Pasted%20image%2020240316194117.png)

> Fixed that by adding some issues.


Now lets see here:

```yaml

            
  build_and_deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - run: npm ci && npm run build
      - uses: FirebaseExtended/action-hosting-deploy@v0
        with:
          repoToken: '${{ secrets.GITHUB_TOKEN }}'
          firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT_DESCARTABLE_SERVER }}'
          channelId: live
          projectId: descartable-server
      
```
Replaced for `yaml`:

```
# This file was auto-generated by the Firebase CLI
# https://github.com/firebase/firebase-tools

name: Deploy to Firebase Hosting on merge
'on':
  push:
    branches:
      - master
jobs:
  deploy_web:
      name: Deploy Web to Firebase Hosting
      needs: build_web
      runs-on: ubuntu-latest
      steps:
        - name: Checkout Repo
          uses: actions/checkout@master
        - name: Download Artifact
          uses: actions/download-artifact@master
          with:
            name: web-build
            path: web-build
        - name: Deploy to Firebase
          uses: w9jds/firebase-action@master
          with:
            args: deploy --only hosting --public web-build
          env:
            FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
            PROJECT_ID: descartable-server

```



## 19 Tuesday

### 19.1 Fixing Windows Parsing

### 1. Panda Plus

- [ ] Add the notes on the Development Page.

![](Pasted%20image%2020240317195019.png)

Now




Reviewing Error at Windows parsing:


![](Pasted%20image%2020240319101310.png)



So lets review what's wrong here:

```
 "event_end_date": "0001-01-01T00:00:00",
```

This is the problem as well.



![](Pasted%20image%2020240319103704.png)

> I can see some strange events: (Where it starts with Spanguid and or event_date as 0001-01T00:000)

![](Pasted%20image%2020240319103846.png)


Okay, as expected timestamp local is:

![](Pasted%20image%2020240319104149.png)


Which means is just a problem of attempting to deploy?

```
local timess 2024-03-19T11:27:37.612397-04:00 2024-03-19T11:27:37.612397-04:00
local timess 2024-03-19T11:27:37.582304-04:00 2024-03-19 11:27:47.582304-04:00
local timess 2024-03-19T11:27:46.855603-04:00 2024-03-19T11:27:46.855603-04:00
local timess 2024-03-19T11:27:46.827838-04:00 2024-03-19 11:27:47.827838-04:00
local timess 2024-03-19T11:27:47.300720-04:00 2024-03-19T11:27:47.300720-04:00
local timess 2024-03-19T11:27:47.141750-04:00 2024-03-19 11:27:48.141750-04:00
local timess 2024-03-19T11:27:47.605814-04:00 2024-03-19T11:27:47.605814-04:00
```



```
024-03-19 14:55:30.634503+00:00 ||| 0001-01-01 00:00:00
--- Logging error ---
Traceback (most recent call last):
  File "C:\github\event-processor-latest\JobListener\processing_engine\processing_abstract.py", line 198, in checkConsistency
    duration = (end_time - timestamp).total_seconds()
TypeError: can't subtract offset-naive and offset-aware datetimes

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "C:\Users\NelsonWang\anaconda3\lib\logging\__init__.py", line 1083, in emit
    msg = self.format(record)
  File "C:\Users\NelsonWang\anaconda3\lib\logging\__init__.py", line 927, in format
    return fmt.format(record)
  File "C:\Users\NelsonWang\anaconda3\lib\logging\__init__.py", line 663, in format
    record.message = record.getMessage()
  File "C:\Users\NelsonWang\anaconda3\lib\logging\__init__.py", line 367, in getMessage       
    msg = msg % self.args
TypeError: not all arguments converted during string formatting
Call stack:
  File "C:\github\event-processor-latest\JobListener\main.py", line 273, in <module>
    process_messages()
  File "C:\github\event-processor-latest\JobListener\main.py", line 207, in process_messages  
    res_service: JobService = processFromJobParameter(job_parameter)
  File "C:\github\event-processor-latest\JobListener\main.py", line 143, in processFromJobParameter
    adapted_events: List[EventData] = integration_adapter.adapt(job_parameters['details'], job_service)
  File "C:\github\event-processor-latest\JobListener\processing_engine\adapters.py", line 138, in adapt
    event_data = self.checkConsistency(event_data, jobService)
  File "C:\github\event-processor-latest\JobListener\processing_engine\processing_abstract.py", line 202, in checkConsistency
    jobService.addLogMessage(
  File "C:\github\event-processor-latest\JobListener\processing_engine\job_service.py", line 105, in addLogMessage
    logging.error(log_message, log_detail)
Message: 'Something went wrong while figuring duration.'
Arguments: ('Duration not in the right format.\n                        using integration_name {self.integration_name} and organization_guid {jobService.organization_guid}\n               
             processing_guid {event.processing_guid}, Obtained: timestamp {jobService.timestamp} and end_time {jobService.end_time}',)
```


This is the thing:

```
datetime.datetime(2024, 3, 19, 13, 36, 24, 950651, tzinfo=tzoffset(None, -14400))
```
 

What it seems to be doing is that there is a problem with this. It shouldn't have the offset. So lets review how local_timestamp solves that?

## 22 Friday

### 22.1  Debugging Bulk Upload

> 'authkey': 'cguid0358402024', 'connector': '4c374db5-8e37-428e-b988-92ce9879165b'


![](Pasted%20image%2020240322121227.png)



![](Pasted%20image%2020240322121249.png)

> It looks as if no errors were registered

![](Pasted%20image%2020240322121416.png)


It seems that I just had to reload the `s3`.

![](Pasted%20image%2020240322121652.png)

Now what needs to be done is the staging processing:


![](Pasted%20image%2020240322122913.png)

> Wow! It did really process it!

I think it must be because I didn't update the models to the one documented on the documentation.

![](Pasted%20image%2020240322123033.png)

> Wait does it even make sense to have that long lasting events?

Also the interactions could been shortened in a way.

![](Pasted%20image%2020240322142031.png)

Looks good to me.

![](Pasted%20image%2020240322142200.png)

Deployment is up. 

![](Pasted%20image%2020240322154531.png)


### 22.2 Debugging Windows Connector.

Here is what I have to ensure that is working. I will outline as well my plan into how to test them. Rank my tests by priority in an excel and send it as report to Danny.


- [ ] Create Excel
- [x] Close down all Applications


What are the key things to test?
How about testing also background items?


**Testing Results Test 1 & 2

![](Pasted%20image%2020240322160630.png)

Case can be found here:

![](Pasted%20image%2020240322160646.png)


As you can see here 8 events:

|1|Test if it sends an event at least once a minute This can be tested starting||Starting 4:02 - 4:11ish it should at least have 8 events|

![](Pasted%20image%2020240322161157.png)

|2|Testing whereas an event is In other Desktops|||4:04 I opened an Word. I expect not to see that word from 4:05 onwards upon revision PASS|

This being the latest event in Windows related to word:

![](Pasted%20image%2020240322161439.png)

All events seems to be things that I had seen or been using before:

![](Pasted%20image%2020240322161632.png)

Windows Processing:


![](Pasted%20image%2020240322162040.png)

My fav query here

```
SELECT id, user_id, organization_guid, application, app, local_timezone, "timestamp", timestamp_local FROM public.event ORDER BY ID desc LIMIT 100;
```

Correct amount o timeslots are created in proportional to the duration:

![](Pasted%20image%2020240322162524.png)

> "9c969c55-3b50-44e6-be29-097af7472e6c" Should have the 2-3 timeslots of different tsl1

![](Pasted%20image%2020240322163334.png)


All events are marked with no Mouseclicks and keystrokes

![](Pasted%20image%2020240322163552.png)

![](Pasted%20image%2020240322164823.png)

Lets see why is it failing the following: `Receives events with proper clicks.`


```
arn:aws:rds:us-east-1:796522278827:db:test-ddanalytics-rds-v2
```

test-ddanalytics-rds-v2

![](Pasted%20image%2020240322165344.png)





![](Pasted%20image%2020240322165825.png)

![](Pasted%20image%2020240322170033.png)





```
db.t3.micro
```

![](Pasted%20image%2020240322170242.png)



Removing:

![](Pasted%20image%2020240322171315.png)


Query to test the keystrokes

```

SELECT 
    t.id, t.event_guid, t.organization_guid, t.hour, t.minute, t.day, t.month, t.year, 
    t.week, t.weekday, t.hour_local, t.minute_local, t.day_local, t.month_local, 
    t.year_local, t.week_local, t.weekday_local, t.mouse_clicks, t.keystrokes, 
    t.created_time, t.updated_time, t.guid, t.ts1, t.ts5, t.ts10, t.ts15, t.tl1, 
    t.tl5, t.tl10, t.tl15, t.processing_guid, e.integration_name
FROM 
    public.timeslot t
JOIN 
    public.event e ON t.event_guid = e.guid
WHERE integration_name = 'Windows' and keystrokes != 0
ORDER BY 
    t.id DESC
LIMIT 100;
```



![](Pasted%20image%2020240322172306.png)



## 25 Monday


### 25.todo

- [ ] 25.1 Finish Submit assignment that's due 31.
- [ ] 25.2 Finish and Submit assignment about History
- [x] 25.3 Get latest Data Science paper and do some progress on them.
- [ ] 25.4 Get the latest Graph Algo assignment and start working on them.



### 25.3 Get latest Data Science Paper and do some progress with them.

Get the data installed:

https://huggingface.co/spaces/Kamand/Movie_Recommendation/blob/main/movies_metadata.csv

- [x] Go over all the notebooks for the Hands ON -Refer to the book to understand if needed.
- [ ] Write down a small text on the hands-on-machine-learning-report.md understanding the idea behind each notebook.
- [ ] For the Recommendation System make sure you explore it using the Book Notebooks
- [x] Explore how to separate test and demo data.


  
Write down a small text on the hands-on-machine-learning-report.md understanding the idea behind each notebook.

Enrich each notebooks with images.

- [x] Chapter 1
- [x] Chapter 3a: Simple Recommender System
- [x] Chapter 3b: Knowledge-Based Recommender System
- [x] Chapter 4: Content-Based Recommender System
- [x] Chapter 5: Getting Started with Data mIning Techniques
  - [x] Similarity Measures
  - [x] Clustering
  - [x] Dimensionality Reduction
  - [x] Evaluation Metrics
- [ ] Chapter 6: Building Collaborative Filtering Recommender System
  - [ ] User-Based Collaborative Filtering
  - [ ] Item-Based Collaborative Filtering
  - [ ] Model-Based Collaborative Filtering

### 25.4 Get latest Graph Algo 



## 26 Tuesday

### 26.todo

- [x] 26.1 Updating Security Rules. Checking Integration
- [x] 26.2 Checking Integration Chrome.
- [ ] 26.3 Finish Chapter 5
- [ ] 26.4 Finish Chapter 6


### 26.1 Updating Security Rules. Checking Integration


![](Pasted%20image%2020240326102058.png)

- [x] Checking and Updating Inbounds so the processor works fine. 
- [x] Make sure that all the due logs in Cloudwatch are there.
- [x] Check that Chrome Is Continuous Spanning Event works fine.
- [x] Check that Windows Continuous Spanning Event works fine as well (Also the SpanGUID)
- [x] Design Migration Protocol.
- [x] Refactoring Data models and check database


#### **Make sure and updating the Cloudwatch**

![](Pasted%20image%2020240326103007.png)
![](Pasted%20image%2020240326103131.png)

- Here it seems that the events Job Parameters are only dotted as that way as starting. Also it has the problem in which:


```py
res_service: JobService = processFromJobParameter(job_parameter)
processing_report(f"SUCCESS: Job Completed for: {job_parameter[EVENT_GUID]}", jobService=res_service)
```

I can see that it is reflected when running Main:

![](Pasted%20image%2020240326105024.png)

Now with more descriptive error logs:

![](Pasted%20image%2020240326114831.png)

This is how it looks like:

![](Pasted%20image%2020240326115334.png)

> Whenever it sends an event, if you don't switch to a different screen, it doesnt' create a new record


![](Pasted%20image%2020240326115419.png)


![](Pasted%20image%2020240326120635.png)


![](Pasted%20image%2020240326120655.png)

```js
else if (isFocused) {

	console.log("The windows is focused => Wrap log + start new log")

	utils.wrapNewTabFocusLog();

	utils.startNewFocusTabLog({ isEventComplete: false });

}
```


**Let's Aim to to Log Object**

![](Pasted%20image%2020240326121426.png)

```json
{
    "guid": "614de65c-153b-cf94-cdaa-a615e2ab6896",
    "event_date": "2024-03-26T16:11:42.310Z",
    "title": "Best Practices in API Design",
    "url": "https://swagger.io/resources/articles/best-practices-in-api-design/",
    "domain": "swagger.io",
    "params": {},
    "incognito": false,
    "spanGUID": "614de65c-153b-cf94-cdaa-a615e2ab6896",
    "isEventComplete": false,
    "activity": "tab-focus",
    "spanStartTime": null,
    "spanSequence": 2
}
```


![](Pasted%20image%2020240326121452.png)

```json
[
    {
        "activity": "tab-focus",
        "domain": "swagger.io",
        "duration": 59.98,
        "event_date": "2024-03-26T16:11:42.310Z",
        "event_end_date": "2024-03-26T16:12:42.295Z",
        "guid": "614de65c-153b-cf94-cdaa-a615e2ab6896",
        "incognito": false,
        "interactions": {
            "click": 11,
            "dbclick": 3,
            "scroll": 4
        },
        "isEventComplete": false,
        "params": {},
        "spanGUID": "614de65c-153b-cf94-cdaa-a615e2ab6896",
        "spanSequence": 2,
        "spanStartTime": null,
        "title": "Best Practices in API Design",
        "url": "https://swagger.io/resources/articles/best-practices-in-api-design/"
    },
    {
        "activity": "tab-focus",
        "domain": "swagger.io",
        "event_date": "2024-03-26T16:12:42.294Z",
        "guid": "614de65c-153b-cf94-cdaa-a615e2ab6896",
        "incognito": false,
        "isEventComplete": false,
        "params": {},
        "spanGUID": "614de65c-153b-cf94-cdaa-a615e2ab6896",
        "spanSequence": 3,
        "spanStartTime": null,
        "title": "Best Practices in API Design",
        "url": "https://swagger.io/resources/articles/best-practices-in-api-design/",
        "interactions": {
            "click": 3,
            "scroll": 6
        },
        "event_end_date": "2024-03-26T16:13:42.302Z",
        "duration": 60.01
    }
]
```



Lets see how that translates to the database:

-  "event_date": "2024-03-26T16:11:42.310Z",
-  "event_end_date": "2024-03-26T16:12:42.295Z",

11:42 - 12:42


- "event_date": "2024-03-26T16:12:42.294Z",
- "event_end_date": "2024-03-26T16:13:42.302Z",


12:42-13:42

The following is executed:

```js
{

// Otherwise if is not complete then get the last timestamp_startTime

// timestamp_startTime = await this.getSpanStartTime();



currentSpanId = await this.getCurrentSpanGUID();

spanSequence = await this.getSpanSequence();



// And receive the last spanSequence and reset that for the last one

this.increaseSpanSequence(); // So that on the next not complete log it should be 1

        }
```


I think the problem is here:

```js
console.log("The windows is focused => Wrap log + start new log")

utils.wrapNewTabFocusLog();

utils.startNewFocusTabLog({ isEventComplete: false });
```

Whereas the event focus Log is wrapped (Thus creating a new event.)

Here you can see the new log:

```js
async wrapNewTabFocusLog() {

const endTime = new Date();
let [recordObject, duration] = [null, 0];
let recordedInteractions = await this.getInteractions();
this.resetInteractions();
let recordObjectRes = await this.getFromLocalStorage([Constants.CONSTANTS.CURRENT_RECORD]);

if (recordObjectRes.currentRecord === null) {
	if (Constants.DEBUG) console.log("wrapNewLog | No current record found, recordObjectiveRes", recordObjectRes);
	// Save this on the database as the current record then log.
	return;

}

recordObject = recordObjectRes.currentRecord;
recordObject.interactions = recordedInteractions;

// calculate the duration

if (Constants.DEBUG) console.log("wrapNewLog| recordedObject in the database was")
const datetimeNumberAtStart = Date.parse(recordObject.event_date);




// update the record object with the isoString of the timestamp

recordObject.event_end_date = new Date().toISOString();
recordObject.duration = this.getDuration(datetimeNumberAtStart, endTime);

// recordObject.spanId = currentSpanId
if (Constants.DEBUG) console.log("Duration: ", recordObject.duration, "Run using", datetimeNumberAtStart, " and ", endTime);
const records = await this.addRecordToDatabase(recordObject);
chrome.storage.local.set({

	currentRecord: null

});



// retirm all records on the database

return { records, wrapped_object: recordObject };



}
```





#### **Designing Migration Protocol**

- This could be by providing:
	- sql file
	- Some markdown explaining the potential changes.



```json
{
    "process": "Bulk Upload initiated",
    "date": "2024-03-26T17:16:44.805Z",
    "guid": "5c1d7d96-b3cf-ef72-649d-c3660e709325",
    "last_guid": "71cff4bc-26a5-b2a8-73bb-c90d7475662e",
    "count_of_records": 1,
    "upload_success": true,
    "upload_result": "OK Root=1-660302fc-6434e78f60b9db86175d6b19",
    "signature_1": "",
    "signature_2": "",
    "stackoverflow.blog_0": 60
}
```




```json
[
    {
        "activity": "tab-focus",
        "domain": "swagger.io",
        "duration": 60.01,
        "event_date": "2024-03-26T17:23:01.978Z",
        "event_end_date": "2024-03-26T17:24:01.985Z",
        "guid": "39d135bb-fdc8-4d9f-3296-2c946dcaf7d0",
        "incognito": false,
        "interactions": {},
        "isEventComplete": true,
        "params": {},
        "spanGUID": "39d135bb-fdc8-4d9f-3296-2c946dcaf7d0",
        "spanSequence": 0,
        "spanStartTime": "2024-03-26T17:23:01.979Z",
        "title": "OpenAPI Specification - Version 3.1.0 | Swagger",
        "url": "https://swagger.io/specification/"
    },
    {
        "activity": "tab-focus",
        "domain": "swagger.io",
        "duration": 68.31,
        "event_date": "2024-03-26T17:23:01.978Z",
        "event_end_date": "2024-03-26T17:24:10.304Z",
        "guid": "39d135bb-fdc8-4d9f-3296-2c946dcaf7d0",
        "incognito": false,
        "interactions": {},
        "isEventComplete": true,
        "params": {},
        "spanGUID": "39d135bb-fdc8-4d9f-3296-2c946dcaf7d0",
        "spanSequence": 0,
        "spanStartTime": "2024-03-26T17:23:01.979Z",
        "title": "OpenAPI Specification - Version 3.1.0 | Swagger",
        "url": "https://swagger.io/specification/"
    },
    {
        "activity": "tab-focus",
        "domain": "stackoverflow.blog",
        "duration": 0.41,
        "event_date": "2024-03-26T17:24:10.306Z",
        "event_end_date": "2024-03-26T17:24:10.715Z",
        "guid": "82117ae0-5f34-6258-cc5e-d3c861e016c3",
        "incognito": false,
        "interactions": {},
        "isEventComplete": true,
        "params": {},
        "spanGUID": "82117ae0-5f34-6258-cc5e-d3c861e016c3",
        "spanSequence": 0,
        "spanStartTime": "2024-03-26T17:24:10.306Z",
        "title": "Best practices for REST API design - Stack Overflow",
        "url": "https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/"
    },
    {
        "activity": "tab-focus",
        "domain": "swagger.io",
        "duration": 51.28,
        "event_date": "2024-03-26T17:24:10.717Z",
        "event_end_date": "2024-03-26T17:25:01.995Z",
        "guid": "1cbe1810-fc46-f999-9104-3e3ad1d1301c",
        "incognito": false,
        "interactions": {},
        "isEventComplete": true,
        "params": {},
        "spanGUID": "1cbe1810-fc46-f999-9104-3e3ad1d1301c",
        "spanSequence": 0,
        "spanStartTime": "2024-03-26T17:24:10.717Z",
        "title": "OpenAPI Specification - Version 3.1.0 | Swagger",
        "url": "https://swagger.io/specification/"
    }
]
```

```json
{
    "activity": "tab-focus",
    "domain": "swagger.io",
    "duration": 111.27,
    "event_date": "2024-03-26T17:24:10.717Z",
    "event_end_date": "2024-03-26T17:26:01.992Z",
    "guid": "1cbe1810-fc46-f999-9104-3e3ad1d1301c",
    "incognito": false,
    "interactions": {},
    "isEventComplete": true,
    "params": {},
    "spanGUID": "1cbe1810-fc46-f999-9104-3e3ad1d1301c",
    "spanSequence": 0,
    "spanStartTime": "2024-03-26T17:24:10.717Z",
    "title": "OpenAPI Specification - Version 3.1.0 | Swagger",
    "url": "https://swagger.io/specification/"
}
```


Fail scenario would show "any" events on the events table where duration is 52secs

However, it can be seen here that: 

![](Pasted%20image%2020240326133044.png)


Things to keep that makes sense to keep:

```json
{
	"activity":
	"domain":,
	"duration",
	"event_date",
	"event_end_Date",
	"guid",
	"incognito",
	"interactions",
	"status",
	"title",
	""
}

```


As it can be seen here: 

![](Pasted%20image%2020240326133140.png)

> No mention of any events of `52` seconds. Thus it succeeded with an 112 seconds event.

![](Pasted%20image%2020240326151420.png)


## 28 Thursday



### 28.todo

- [x] Checking for Windows and Timeslots production consistency

### 28.1 Checking for Windows and Timeslots production consistency



![](Pasted%20image%2020240328132809.png)

> This seems correct and is a singular guid..

```
2e8f9a8c-16b5-4a25-acbb-529485f7879d
```


It would make sense for such event to be:

![](Pasted%20image%2020240328133410.png)


As can be seen here, there is no repeated timeslots (which is correct)

![](Pasted%20image%2020240328133658.png)

> It should have no repeated timeslots, what bothers me is that the ide are consecutive, which doesn't make sense:  ![](Pasted%20image%2020240328133825.png)



![](Pasted%20image%2020240328133410.png)


**12:47**

![](Pasted%20image%2020240328134124.png)

Here you can see the event that is spanned from 42:00

**12:46**
![](Pasted%20image%2020240328134319.png)

> not here


**12:45**

![](Pasted%20image%2020240328134417.png)

> Strange, why there is a WIN App null window title and name everywhere? Are those windows Chrome events that couldn't be interpreted??


**12:44**
![](Pasted%20image%2020240328134525.png)


Lets try again solely with pgAdmin

![](Pasted%20image%2020240328135142.png)


![](Pasted%20image%2020240328135631.png)

> There seems to be an explorations of multiple pgAdmins and explorers

**Test:  Test using pgAdmin for more than 2 minutes and check if it is reported correctly**

> Strange that the duration is on the null but not on pgAdmin 

![](Pasted%20image%2020240328135838.png)

Am I processing things incorrectly?

**Lets check the s3**

Things doesn't seem right:

file:///C:/Users/NelsonWang/Downloads/48d840e7-14f0-491c-aa9e-aab5fbf6324d.json

![](Pasted%20image%2020240328140740.png)


Ok so it seems that the reason they would last that much, was just a WIN HEARTBEAT:

c7f6027c-a461-4c0e-ad0c-c1e1aef9d1a2


![](Pasted%20image%2020240328140918.png)

Which shouldn't be mapped as ACTIVITY:

![](Pasted%20image%2020240328141021.png)

- [ ] Lets fix that mapping. So that the Activity is only mapped whenever the application is not NULL:

![](Pasted%20image%2020240328141135.png)

```pyhon
  

event_type = Utils.SafeParse(event_raw, "event_type")

def clasifyEventTypeToActionType(event_type):

	if event_type == "WIN_APP_ACTIVE":

		return "ACTIVE"

	if event_type == "WIN_HEARTBEAT":

		return "HEARTBEAT"

	return ""
```



**Test 2: Check using pgadmin for 2 minutes and then switch application**

(Perhaps it does log but only once it is done with the application?)

Test timestamp:

1. 2:23 | Using pgAdmin
2. 2:25 | Using Pg Admin
3. 2:27 | Swap to a different application.

![](Pasted%20image%2020240328143009.png)

It is correctly sending at least once every minute:

![](Pasted%20image%2020240328143157.png)

![](Pasted%20image%2020240328143557.png)

- Why there are 2 events for a singular event? One with duration and another one without? How about the `span_guid`?
![](Pasted%20image%2020240328143851.png)

- All timestamps seems to be different (thus they must not come from the same `s3 row`)

![](Pasted%20image%2020240328143952.png)

- Why although there are new events, every one minute

![](Pasted%20image%2020240328144431.png)

![](Pasted%20image%2020240328144701.png)

> It seems that for each new event, it sends an event when started and another one once it is finished. Which is passable.

- Another thing is that the `span_guid` of both are distinct although, is clear that `one is the extension` of another.

Lets check if the event_end_date was an intended documented feature.

![](Pasted%20image%2020240328150203.png)

Which is not. It must be a `legacy feature` that has to be removed: But it IS in the documentation:


![](Pasted%20image%2020240328150253.png)

- Which should be **removed**.
> To talk with Danny.

Also is the code even more than 60seconds possible? Does it reset every time it sends an event Do they perhaps share the same same SPANGUID but not guid?


**Lets test this with Obsidian**
Should have an event at 3:13 where is using Obsidian

- 3:13 -> Obsidian Event.
- 3:15 -> Continue typing around in Obsidian.
- 3:16 -> Change in the Middle of the event to pgAdmin.
- 3:18 -> Check and determine if the event is available correctly.

If there is two events check if the SPANGUID at least is the same. (And guid, it could be that it is not picking such)

This makes no sense:

![](Pasted%20image%2020240328151918.png)
It seems that after I switch to pgadmin, the events gets mapped to pgAdmin instead of Obsidian.
Lets review s3:

Event sent at 15:15:04:
file:///C:/Users/NelsonWang/Downloads/28fb3938-cebc-437e-803b-b4bef5f3c05c%20(1).json

(19:14) UTC Event Sent Timestamp

![](Pasted%20image%2020240328153010.png)

T19:13 UTC

![](Pasted%20image%2020240328153041.png)

Recorded at: 15:16
file:///C:/Users/NelsonWang/Downloads/28fb3938-cebc-437e-803b-b4bef5f3c05c%20(2).json

![](Pasted%20image%2020240328153158.png)


First event UTC timestamped  at "2024-03-28T19:16" for pgAdmin

![](Pasted%20image%2020240328153426.png)
But I do know for sure this are not the correct updates:

![](Pasted%20image%2020240328153508.png)

This interactions as well makes only sense for 


I am also receiving a lots of events with no windows title and no windows name with the same SpanGUID that I can't make much sense of why
![](Pasted%20image%2020240328162049.png)


**Also other questions to ask**
- Is it possible to detect if a windows is a modal?
- Is it possible to detect which is the size of the windows being focused on?




### Testing LIA - FastAPI

*Abandoned: Reason: Bit relevant, I should start with I have with the actual data first*

- [x] Clone install requirements
- [x] Add Database to..

#### Start with the Model.

- [ ] Implement The following on Books (Basic Recommendation with KNN) Try to then have it and storing KNN for later.
- [ ] Split the data correctly.


Designing the split data


- Consider that title etc, might make sense for 
- Each model and training might use a different database?
- How to create such that it stores the code for latter use?




### Chrome Download Uploads


![](Pasted%20image%2020240328184541.png)




- [ ] Add the right operation depending on the type of action: visit?

## 29 Friday

### 29.todo

- [ ] 29.1 Collab Filtering
- [x] 29.2 A lightweight discussion with the future plan.


**Just a bit of discussion with myself**

Does the numbers make any sense?
- Ability to pay on your own? How much does Industrial Costs? And what do you get out of there? If it is remote, you might as well try the **accounting** first. Event Gam doesn't make sense compared to the understanding that you can be a better **analyst** by using accounting. Game Dev is too much into the passion rather. As a result you should find fun by making sims about Accounting Practices. Perhaps take both of them at the same time. 
- Why not other **Blue Trade** Jobs?
	- Because then you would be privating yourself from a desktop job: Which means: no opportunity to apply your cs knowledge here.
- How about masters role?
	- You mean like 1+2 combo? It could work, no doubt. Perhaps would even make more sense to be good at it by doing extra projects on it to further. My worries is that if this doesn't work...
- Financial Perspective (Individualized Paths)
	- Masters: 10 000 USD
		- I can do this remotely as well.
	- Accounting: Estimate 2-3 Semesters: 10 000 USD as well.
		- This could work entirely remotely and burn cash while in Argentina trying to pick up lower wage experience in Computing.
	- Game Dev: Estimate as well around 2000 USD per Year
		- This could work entirely remotely and burn less cash.
		- I can practice and try to get better.
	- Blue Collar: e.g. Police
		- Nah, you can wait on this. no prob.

| Path                   | Details                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Prospects Rating | Costs (Year) | Costs (Total) |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------- | ------------ | ------------- |
| Accounting             | Estimate around that time to finish the degree.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | 8                | 8 000        | 16 000        |
| Game Dev               | This makes sense if you want to keep grinding at a lower rate.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | 4                | 2 000        | 10 000        |
| Masters in AI          | Yep, this just makes more sense if applicable.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | 8                | 10 000       | 10 000        |
| Industrial Engineering | On second thought. This is an horrible idea. Even if you were working for your father. Accounting makes more sense as you understand better regulations and forecasting rather than the in-detail quality control kind. It is just more applicable. But if you want to improve yourself as an engineer, understand CAD, and other Physics related then this makes sense. But I don't like the fact that it doesn't go in depth with anything, and also that it is not applicable to a job prospect in a ideal locating. Accounting on the other hand, does allow allow experience in US company and grind. | 5                | 4000         | 16 000        |



| April | May  | June                                                                  | July | August |
| ----- | ---- | --------------------------------------------------------------------- | ---- | ------ |
| 1500  | 1500 | 3000                                                                  | 3000 | 3000   |
| 1500  | 3000 | 6000                                                                  | 9000 | 1200   |
|       |      | Try to request higher Salaries. Or quit for a 65k salary to pay rent. |      |        |
|       |      |                                                                       |      |        |


| Net           | 50 000 | 100 000        | 120 000        | 200 000          |
| ------------- | ------ | -------------- | -------------- | ---------------- |
| Yearly        | 2 500  | 5 000          | 6 000          | 10 000           |
| Monthly       | 200    | 400            | 512            | 833              |
| Cheat 50 000  | x      | 10x100 + 5x300 | 10x100 + 9x300 | 10x100 + 20x300  |
| Cheat 100 000 | x      | x              | 10x100         | 10x100 \|  5x300 |
| Kids supp     | x      | 1              | 3              | 5+               |
|               |        |                |                |                  |

Note: You can also cheat the system by increasing the **Yearly** without increasing the cumulative by: working on other peoples project.

- Let say you have around 100 USD per project then tat means just breaching the gap to 100 000 by having 25 additional projects under your hand.


### 29.1 Collab Filtering Using Surprise


- [x] Divide the Books and Users
- [ ] Create common DF

Use the notes from `lectures`































































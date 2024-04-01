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

How to enforce such? Using the Focusmate strategy and just blocking the hours expected during the week immediately upon having a task received.

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


## 17 Sunday



### 1. Panda Plus

- [ ] Add the notes on the Development Page.

![](Pasted%20image%2020240317195019.png)


Lets try with he reset algorithm:

reset Algorithm.

Why it seems ike it takes twice?

```
    const [key, setKey] = useState('Graph');
```


I invited friends and people from my school's investment college clubs who were within the demographic of our application. Additionally, we hired testing providers to gather more feedback

During our closed test, testers actively used all features, participating in multiple competitions and simulating various market scenarios, like purchasing shares before a market split. This matched our expectations for real user behavior, given our app's focus on student investment competitions.

We utilized WhatsApp groups to share insights and conducted in-person reviews to observe how users interacted with our application and to identify common misunderstandings regarding competition mechanics. We tested this by recreating scenarios from multiple competitions.


We're primarily targeting college students who are interested in competing and expanding their knowledge of the stock market. Our initiative involves launching competitions within schools to inspire students to delve into the world of finance. We are starting at CUNY Schools.

Offers users the opportunity to engage in recurring virtual competitions held every 3-4 months cycles. By participating, students can apply and enhance their skills in stock evaluation, finance, and business. They also build a track record of their performance for their portfolio.

Improved server handling during downturns (Users reported sudden login issues).
Fixed share splitting bug that would, for example, triplicate their equity if shares were split by 3.
Implemented the missing "Forgot Password" link.
Fixed competition not displaying all students.

We engaged with users in person to gather feedback and have been addressing major bugs. The app now functions as intended, providing the necessary features for hosting competitions and allowing players to compete.

































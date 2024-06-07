

### Mapping and Remapping Only Useful Events

```python
def join_timeslots(self, stamp_event_list: dict[str, dict[str, List[Timeslot]]], treshhold=1) -> dict[str, List[Timeslot]]:

	"""

	Collapses events on the stamp_event_list format that are the same.

	Joins where the events are the same.

	NOTE: It updates the events such

	INPUT:

	stamp_event_list: {

		[minute_stamp]: {

			[_soup]: ([timeslot, timeslot..], [event, event...])

	OUTPUT:

	unique_timeslots: {

		[_soup_minute_stamp]: aggregated

	}

	Now wha ti tneed

	"""

	unique_timeslots: dict[str, List[Timeslot]] = {} # Becuase it makes sense to easily loop and access each element at the timeslots

	for minutestamp in stamp_event_list:

		for soup in stamp_event_list[minutestamp]:

			key_stamp = soup + str(minutestamp)

			bptimeslot: Timeslot = copy.copy(stamp_event_list[minutestamp][soup][0])

			for timeslot in stamp_event_list[minutestamp][soup]:

				if key_stamp not in unique_timeslots:

					unique_timeslots[key_stamp] = stamp_event_list[minutestamp][soup]

				for sum_feature in self.sum_features:

					setattr(bptimeslot, sum_feature, getattr(bptimeslot, sum_feature) + getattr(timeslot, sum_feature))

				for keep_true_feature in self.keep_true_features:

					if getattr(timeslot, keep_true_feature) == True:

						setattr(bptimeslot, keep_true_feature, True)

			# Don't append the timeslot if it doesnt have a keep true feature as true, and all sum_features are 0.

			if all([getattr(bptimeslot, sum_feature) == 0 for sum_feature in self.sum_features]) and all([getattr(bptimeslot, keep_true_feature) == False for keep_true_feature in self.keep_true_features]):

				continue    

			unique_timeslots[key_stamp] = bptimeslot

	return unique_timeslots
```


```py
"""

Concrete implementations of the abstract classes in processing_abstract.py.

  

2024-02-08 14:40:25

- Added Concrete implementation of SalesforceIntegrationAdapter

  

"""

  

import pprint

from processing_engine.dda_constants import *

from processing_engine.dda_models import *

from processing_engine.processing_abstract import *

from processing_engine.job_service import JobService

from processing_engine.class_helpers import Utils

  

import re

import copy

  
  
  

from typing import List, Dict

import json

import datetime

import pytz

from datetime import timedelta

  

ACTIVITY = 'ACTIVITY'

  
  
  
  

class TimeslotProcessing(ProcessingStrategy):

    """

    Basic enhancement strategy, simply returns the dataframe as is.

  
  

    Stages and models the data to be published to the database.:

  

    1. Receives: List[EventData] with organization data embued in it.

    3. [x] Collapse events with similar span_guid events (local)

    4. [x] Timeslots Creation

    5. Categorization jobs (if needed) NOT required as for 2024-02-08 16:34:38

    6. PUBLISH EVENTS: Check if there is the same events

    7. PUBLISH TIMESLOTS: Check if there are the same timeslots, filter out the ones that are already present.

  
  

    """

  

    def __init__(self, job_service: JobService):

        self.job_service = job_service

  

    def enhance(self, eventDataList: List[EventData]):

        """Enhances the events in the following ways:

        - Populates local time related columns

        - splitEvents: List[Event]

        - Creates timeslots for the events.

        - Filters or Updates which timeslots are to be published.

        - Updates the events end_time if an earlier one was present on the database.

  

        """

  

        # Graving an EventDataList Picks the Jobs

        collapsedEvents: List[EventData] = self.collapseEventsSimilarEventGUID(eventDataList)

        print('Collapsed Events', len(collapsedEvents))

        events, timeslots = self.splitEvents(collapsedEvents)

        print('Publishing timeslots', len(timeslots), 'events', len(events))

        self.publishTimeslots(timeslots)

        self.publishEvents(events)

    def collapseEventsSimilarEventGUID(self, eventDataList: List[EventData]) -> List[EventData]:

        """Collapses the events with similar span_guid events.

        Non-Method intended to be used for collapsing the correct events.

        Modifies the eventDataList in place given the first clicks, keystrokes when ocllapsing.

  

        2024-02-08 16:19:37

        - Make sure to collapse clicks and keystrokes as well.

        Which come with the following format:

        NOTE:

        Mouseclicks and keystrokes are expected to have the following format:

        Separated in minutes.

        {

            %Y-%m-%d %H:%M:: [count],

            2024-02-08 16:19: 1,

            2024-02-08 16:20: 2,

            ...

            [minute]: [count]

        }

  

        """

        event_guid_min_max_memory = {}

        collapsed_events: List[EventData] = []

  
  

        def addClicksAndKeystrokes(collapsedEvent: EventData, idx: int, eventDataList: List[EventData]) -> None:

            """

            Adds the clicks and keystrokes to the reference event.

            NOTE: This is an impure function, it modifies the eventDataList in place.

  

            """

  

            ref_event = eventDataList[idx]

            if ref_event is None:

                return

  
  

            if collapsedEvent.mouse_clicks != {} and ref_event.mouse_clicks != {} and ref_event.mouse_clicks is not None:

                for unique_minutestamp, clicks in collapsedEvent.mouse_clicks.items():

                    ref_event.mouse_clicks[unique_minutestamp] = ref_event.mouse_clicks[unique_minutestamp] + clicks if unique_minutestamp in ref_event.mouse_clicks else clicks

            if collapsedEvent.keystrokes != {} and ref_event.keystrokes != {} and ref_event.keystrokes is not None:

                for unique_minutestamp, keystrokes in collapsedEvent.keystrokes.items():

                    ref_event.keystrokes[unique_minutestamp] = ref_event.keystrokes[unique_minutestamp] + keystrokes if unique_minutestamp in ref_event.keystrokes else keystrokes

  

        for idx, collapsedEvent in enumerate(eventDataList):

            if collapsedEvent.event_guid not in event_guid_min_max_memory:

                min_max_event_data = {

                    "min": collapsedEvent.timestamp,

                    "max": collapsedEvent.end_time,

                    "idx": idx # keeps track and updates the first time reference.

                }

                event_guid_min_max_memory[collapsedEvent.event_guid] = min_max_event_data

            else:

                min_max_event_data = event_guid_min_max_memory[collapsedEvent.event_guid]

                if collapsedEvent.end_time > min_max_event_data["max"]:

                    min_max_event_data["max"] = collapsedEvent.end_time

                    reference_id = min_max_event_data["idx"]

                    addClicksAndKeystrokes(collapsedEvent, reference_id, eventDataList)

        # Now, lets add the collapsed events.

        collapsed_events: List[EventData] = []

        for min_max_event_data in event_guid_min_max_memory.values():

            collapsedEvent: EventData = eventDataList[min_max_event_data["idx"]]

            collapsedEvent.timestamp = min_max_event_data["min"]

            collapsedEvent.end_time = min_max_event_data["max"]

            collapsed_events.append(collapsedEvent)

  
  

        return collapsed_events

    def appendTags(self, eventDataList: List[EventData]) -> List[EventData]:

        """

        Appends the tags to the eventDataList.

        """

        modifiedEventDataList: List[EventData] = []

        for eventData in eventDataList:

            site = eventData.site

            url = eventData.url

            tagsDerived = []

  

            # Parse the url and site to infer the following tags.

            URL_TAGS_MATCH = {

                'www.google.com': {

                    'search?q=': ['Google Search', 'Search'],

                },

                'mail.google.com': {

                    'compose=new': ['Gmail Compose', 'Email'],

                    'inbox': ['Gmail Inbox', 'Email'],

                },

                'outlook.office365.com': {

                    'mail': ['Outlook Mail', 'Email'],

                    'calendar': ['Outlook Calendar', 'Calendar'],

                },

                'atlassian.net': {

                    'selectedIssue=': ['Jira Issue', 'Jira'],

  

                }

            }

  

            def get_tags(url):

                for site, tagsDict in URL_TAGS_MATCH.items():

                    if site in url:

                        for tag, tag_values in tagsDict.items():

                            if tag in url:

                                print("==> Tag values obtained", tag, tag_values)

                                return tag_values

                return []

            tagsDerived = get_tags(url)

            eventData.tags.extend(tagsDerived)

            modifiedEventDataList.append(eventData)

        return modifiedEventDataList

  
  

  

    def createMinuteTimestamp(self, timestamp_utc, timestamp_local)-> tuple[datetime.datetime, datetime.datetime]:

        """

        Creates the minute timestamp for the UTC and Local time.

        """

        timestamp_utc = timestamp_utc.replace(second=0, microsecond=0)

        timestamp_local.replace(tzinfo=pytz.utc)

        timestamp_local = timestamp_local.replace(second=0, microsecond=0)

        return timestamp_utc, timestamp_local

  
  

    def defineTimeslot(self, curr_time: datetime.datetime, eventData: EventData) -> Timeslot:

        """

        Compute the following specfics for the timeslot:

        - ts1, ts5... ts15

        - tl1, tl5... tl15

        - keystrokes, mouseclicks

        2024-05-09 10:11:12

        - Add timestamp_minute and timestamp_local_minute to the timeslot.

        """

        # Calulcate the ts1 as the minute of the day. e.g. 00:00:00 -> 0, 00:01:00 -> 1, 00:02:00 -> 2

        timestamp_datetime: datetime.datetime = curr_time

        timestamp_local_datetime: datetime.datetime = timestamp_datetime.astimezone(pytz.timezone(eventData.local_timezone))

        # remove timestamp_local_datetime timzone mark for insertion to avoid confusions.

        timestamp_local_datetime = timestamp_local_datetime.replace(tzinfo=None)

        minute_timestamp_utc, minute_timestamp_local = self.createMinuteTimestamp(timestamp_datetime, timestamp_local_datetime)

  

        # Extract UTC Date Time Components

        hour = timestamp_datetime.hour

        minute = timestamp_datetime.minute

        day = timestamp_datetime.day

        month = timestamp_datetime.month

        year = timestamp_datetime.year

  

        timestamp_isocalendar = timestamp_datetime.isocalendar()

        week =  timestamp_isocalendar[1]

        weekday = timestamp_datetime.weekday()

  

        # Extract Local Date Time Components

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

  
  

        # Find mouseclicks and keyboard strokes at this specific time.

        year_month_day_minute = Utils.datetimeToYearMonthDayMinute(timestamp_datetime)

  

        # Keystrokes or mouseclicks not being populated? Uncomment the following:

        # print("Searching for year_month_day_minute", year_month_day_minute)

        # print("Mouse Clicks", eventData.mouse_clicks)

        # print("Keystrokes", eventData.keystrokes)

        return Timeslot(

            event_guid = eventData.event_guid,

            organization_guid = eventData.organization_guid,

  

            hour = hour,

            minute = minute,

            day = day,

            month = month,

            year = year,

            week = week,

            weekday = weekday,

  

            hour_local = hour_local,

            minute_local = minute_local,

            day_local = day_local,

            month_local = month_local,

            year_local = year_local,

            week_local = week_local,

            weekday_local = weekday_local,

            mouse_clicks= eventData.mouse_clicks[year_month_day_minute] if eventData.mouse_clicks is not None and year_month_day_minute in eventData.mouse_clicks else 0,

            keystrokes = eventData.keystrokes[year_month_day_minute] if eventData.keystrokes is not None and year_month_day_minute in eventData.keystrokes else 0,

            processing_guid= eventData.processing_guid,

  

            ts1= ts1,

            ts5= ts5,

            ts10= ts10,

            ts15= ts15,

  

            tl1= tl1,

            tl5= tl5,

            tl10= tl10,

            tl15= tl15,

  

            event_end_time= eventData.end_time,

            timestamp=minute_timestamp_utc,

            timestamp_local=minute_timestamp_local,

        )

  

    def splitEvents(self, eventDataList: List[EventData]) -> (List[Event], List[Timeslot]): # type: ignore

        """Creates the timeslots from the events.

        - The timeslots are created from the events.

        - The timeslots are assumed to be in the same timezone.

  

        @return: List[Event], List[Timeslot]  # The events and the timeslots created from the eventDatas.

  

        """

  

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

                end_time_local = eventData.end_time_local,

                duration = eventData.duration,

                description = eventData.description,

                url = eventData.url,

                site = eventData.site,

                files = eventData.files,

                file_count = eventData.file_count,

                size = eventData.size,

  

                action_type = eventData.action_type,

                geolocation= eventData.geolocation,

                ipv4 = eventData.ipv4,

                local_ipv4= eventData.local_ipv4,

                email_subject= eventData.email_subject,

                from_address= eventData.from_address,

                to_address= eventData.to_address,

                email_cc = eventData.email_cc,

                email_bcc = eventData.email_bcc,

                email_imid = eventData.email_imid,

                phone_result = eventData.phone_result,

                record_url = eventData.record_url,

                recording_url = eventData.recording_url,

                record_id = eventData.record_id,

  

                tags = eventData.tags,

            )

            events_list.append(event)

            # Dont create the events if they are not marked as action_type = 'ACTIVITY'

            if eventData.action_type != ACTIVITY or eventData.app == "" or eventData.app is None:

                continue

  

            # now, for every 1 minute, compute the required timeslots.

            timeslots = self.createTimeslots(eventData)

            if timeslots is not None and timeslots != []:

                timeslots_lists.extend(timeslots)

        return events_list, timeslots_lists

  

    def createTimeslots(self, eventData: EventData) -> List[Timeslot]:

        """

        Creates timeslots for the events, Splits every 1 minute to find the timeslots.

        """

        if eventData.end_time is None or eventData.duration is None:

            return None

        timeslots: List[Timeslot] = []

        curr_time = Utils.parseDate(eventData.timestamp)

        end_time = Utils.parseDate(eventData.end_time)

  

        # TODO calculate the minute timestamp | Calculate the local minute timestamp

  

        if eventData.end_time is not None and eventData.duration is not None and eventData.duration > 0:

            while curr_time <= end_time:

                timeslot = self.defineTimeslot(curr_time, eventData)

                timeslots.append(timeslot)

                curr_time = curr_time + timedelta(minutes=1)

  

        else:

            # If the end_time is not present, then we can only create the timeslots for the duration of the event.

            timeslot = self.defineTimeslot(curr_time, eventData)

            timeslots.append(timeslot)

        return timeslots

  

    def publishTimeslots(self, timeslots: List[Timeslot], autocorrection = True) -> bool:

        """

        Publishes the timeslots to the database.

  

        2024-02-15 16:24:26

        - The following procedure was skipped, as it is irrrelevant for ANY front end application using the timeslots. AS the only thing that matters is that there is ONE timeslot with the correct keystrokes, and the second, that even if they are duplicated, they have the same event_guid. Which means

        When fetching and running unique(event_guids), the events related will actually be correct.

        Fetches all the timeslots with the organization_guid catching where the event_guid IN (unique event_guids).

        If the timeslots are not present, it

        - This will produce a KNOWN bug, which doesnt matter for the front end application, as the timeslots are only used for the timeslot data, and the events are used for the events data.

        Instead the prodcedure will only used to INSERT ALL times.

  

        2024-04-04 15:30:17

        - [x] Check if the timeslots are already present in the database using: , if they are, remove from insertion list.

        - [x] Make sure that the right tiemslots clicks and keys are separated.

  
  

        @return bool: True if the timeslots were published successfully, False otherwise.

        """

  

        column_names_timeslots = Timeslot.get_publishing_keys()

        insert_sql = f"INSERT INTO timeslot ({', '.join(column_names_timeslots)}) VALUES ({', '.join(['%s'] * len(column_names_timeslots))})"

        jobService = self.job_service

  

        def cleanQueryArgument(queryArgument):

            # If the queryArg is a list or dict, format it into a way that is query insertable

            if isinstance(queryArgument, (dict)):

                # If the is List and the first element is a dict, then it is a list of objects

                return json.dumps(queryArgument)

            if isinstance(queryArgument, List) and len(queryArgument) >0 and isinstance(queryArgument[0], dict):

                # return an array of strings of the json

                for(i, item) in enumerate(queryArgument):

                    queryArgument[i] = cleanQueryArgument(item)

            return queryArgument

        timeslots_guids = [timeslot.event_guid for timeslot in timeslots]

        if len(timeslots_guids) == 0:

            return True

        placeholders = ', '.join(['%s'] * len(timeslots_guids))

        select_sql = f"SELECT ts1, event_guid FROM timeslot WHERE event_guid IN ({placeholders})"

        jobService.cursor.execute(select_sql, timeslots_guids)

        existing_timeslots = jobService.cursor.fetchall()

        existing_timeslots_set = set([(existing_timeslot['ts1'], existing_timeslot['event_guid']) for existing_timeslot in existing_timeslots])

  

        # Not Unique GUID Errors? Uncomment the following:

        # print("Existing Timeslots fetch from db", existing_timeslots)

        # print("Querying for existing timeslots", select_sql, timeslots_guids)

  

        # Clean the query arguments

        for timeslot in timeslots:

            if (timeslot.ts1, timeslot.event_guid) in existing_timeslots_set:

                # print("Skipped", timeslot.ts1, timeslot.event_guid)

                continue

            values = []

            for column_name in column_names_timeslots:

                values.append(cleanQueryArgument(getattr(timeslot, column_name)))

            try:

                jobService.cursor.execute(insert_sql, values)

            except Exception as e:

                print(f"Error inserting timeslot: {e}")

                jobService.addLogMessage(jobService, f"Error inserting timeslot: {e}", f"Error inserting timeslot: {e}", "Error")

                return False

            jobService.connection.commit()

  

        return True

  

    def deleteEvents(self, datesAgo: int):

        """

        Deletes the events that are newer than the 4/9/2024

        """

        print("DEleteing")

        delete_sql = "DELETE FROM event WHERE end_time > '2024-4-4'"

        jobService = self.job_service

        date = datetime.datetime.now() - timedelta(days=datesAgo)

        jobService.cursor.execute(delete_sql)

        jobService.connection.commit()

    def publishEvents(self, events: List[Event]) -> bool:

        """

        Fetch if there are the same events, creates two lists:

        - if they don't exist, then insert them.

        - if they exist, then ONLY update their end_time.

        """

        events_guids = [event.guid for event in events]

        if len(events_guids) == 0:

            return True

        placeholders = ', '.join(['%s'] * len(events_guids))

        select_sql = f"SELECT guid, end_time, end_time_local FROM event WHERE guid IN ({placeholders})"

        self.job_service.cursor.execute(select_sql, events_guids)

  
  

        existing_events = self.job_service.cursor.fetchall()

        mockEvents:  Dict[str, DatabaseEvent] = {} # Data structure containing only {guid, end_time, end_time_local}

  

        # Not Unique GUID Errors? Uncomment the following:

        # print("Existing Events fetch from db", existing_events)

        # print("Querying for existing events", select_sql, events_guids)

  

        for existing_event in existing_events:

            mockEvent = DatabaseEvent()

            mockEvent.guid = existing_event['guid']

            mockEvent.end_time = existing_event['end_time']

            mockEvent.end_time_local = existing_event['end_time_local']

            mockEvents[mockEvent.guid] = mockEvent

        eventsToInsert: List[Event] = []

        eventsToUpdate: List[DatabaseEvent] = []

  

        for event in events:

            # print('Publishing with Endtime local of', event.end_time_local)

            if event.guid in mockEvents:

                event_end_time = event.end_time.replace(tzinfo=pytz.UTC)

                mock_event_end_time = mockEvents[event.guid].end_time.replace(tzinfo=pytz.UTC)

                if event_end_time > mock_event_end_time:

                    databaseEvent = DatabaseEvent()

                    databaseEvent.guid = event.guid

                    databaseEvent.end_time = event.end_time

                    databaseEvent.end_time_local = event.end_time_local

                    # Update duration if end_time is not null.

                    if event.end_time is not None and event.timestamp is not None:

                        durationInSeconds = Utils.parseDate(event.end_time) - Utils.parseDate(event.timestamp)

                        databaseEvent.duration = durationInSeconds.total_seconds()

                        print('timestmap', event.timestamp, 'end_time', event.end_time, 'duration', databaseEvent.duration)

                    eventsToUpdate.append(

                        databaseEvent

                    )

            else:

                eventsToInsert.append(event)

        self.updateEvents(eventsToUpdate)

        self.insertEvents(eventsToInsert)

  

    def updateEvents(self, events: List[DatabaseEvent]) -> bool:

        """

        Updates the the endtimes to the database.

  

        @return bool: True if the events were published successfully, False otherwise.

        """

  

        if len(events) == 0:

            return True

  

        print(f"Updating {len(events)} events")

  

        update_sql = "UPDATE event SET end_time = %s, end_time_local = %s, duration = %s WHERE guid = %s"

        jobService = self.job_service

        for event in events:

            values = (event.end_time, event.end_time_local, event.duration, event.guid)

            try:

                self.job_service.addLogMessage(

                    log_message="Updating event at guid {}".format(event.guid),

                    log_detail="Updating event: {}".format(values),

                    log_type="Info"

                )

                jobService.cursor.execute(update_sql, values)

  
  

            except Exception as e:

                self.job_service.addLogMessage(

                    log_message = f"Error updating event at guid {event.guid}",

                    log_detail = f"Error updating event: {e}",

                    log_type = "Error"

                )

                return False

            jobService.connection.commit()

        return True

    def insertEvents(self, events: List[Event]) -> bool:

        """

        Inserts the events to the database.

  

        @return bool: True if the events were published successfully, False otherwise.

        """

        if len(events) == 0:

            return True

  

        print(f"Inserting {len(events)} events")

  

        column_names_events = Event.get_publishing_keys()

        insert_sql = "INSERT INTO event ({}) VALUES ({})".format(', '.join(column_names_events), ', '.join(['%s'] * len(column_names_events)))

  

        def cleanQueryArgument(queryArgument):

            # If the queryArg is a list or dict, format it into a way that is query insertable

            if isinstance(queryArgument, dict):

                # If it's a dictionary, convert it to a JSON string

                return json.dumps(queryArgument)

            elif isinstance(queryArgument, list):

                # If it's a list, check its elements

                for i, item in enumerate(queryArgument):

                    queryArgument[i] = cleanQueryArgument(item)

                return json.dumps(queryArgument)

            else:

                return queryArgument

  

        # Clean the query arguments

        jobService = self.job_service

        for event in events:

            values = [cleanQueryArgument(getattr(event, column_name)) for column_name in column_names_events]

            try:

                jobService.cursor.execute(insert_sql, values)

  

            except Exception as e:

                print(f"Error inserting event: {e}")

                print('event')

                pprint.pprint(event.__dict__)

                jobService.addLogMessage(jobService, f"Error inserting event: {e}", f"Error inserting event: {e}", "Error")

                raise e

            jobService = self.job_service

            jobService.connection.commit()

            jobService.connection.commit()

  

        return True

  
  

class SignificanceProcesssing(ProcessingStrategy):

    """

    INPUT: Takes events and Timeslot's

  
  

    NOTE: Doesn't Update the events and removes all previous this responsibility lays in the Job manager.

    OUTPUT: Returns Meaningful* Events Spans and Meaningful* Timeslots

    Class UML: https://devcooks.atlassian.net/wiki/spaces/DDEngine/pages/104267777/Processing+Engine

    Logic and Documentaiton: https://devcooks.atlassian.net/wiki/spaces/DDEngine/pages/edit-v2/130187271

    """

    sum_features = ['mouse_clicks', 'keystrokes']

    keep_true_features=['is_start']

    distinction_features = ['organization_guid', 'app', 'operation', 'site', 'action_type']

    def __init__(self, job_service: JobService):

        self.job_service = job_service

    def enhance(self, eventDataList: List[Event], timeslots: List[Timeslot]):

        """Enhances the events in the following ways:

        1. Map last and End times and create soups that are intended to be used as identifiers (Preprocessing)

        2. Collapse Tiemslots events that are similar

        3. Split Events given Tresholds

        3. Join Events given treshholds

  

        """

        pass

    def get_event_soup(self, event):

        """

        Returns the soup for the event.

        """

        def safe_get_attr(event, attr):

            if hasattr(event, attr):

                return getattr(event, attr)

            return ""

        soup = ""

        for feature in self.distinction_features:

            soup += str(safe_get_attr(event, feature))+"|"

        return soup

    def preprocess(self, eventDataList: List[Event], timeslots: List[Timeslot]) -> tuple[dict[str, dict[str, List[Timeslot]]], dict[str, Event]]:

        """

        Preprocesses the data to be used for the significance processing.

        OUTPUT:

        This would be a variant of the timeslot merged with the events.

        This is the format intednded to make things easier

        stamp_event_list: {

            [minute_stamp]: {

                [_soup]: List[timeslot]

            }

        },

        souped_events: {

            [_soup]: Event

        }

        """

        guid_events: dict[str, Event] = {}

        souped_events: dict[str, Event] = {}

        for event in eventDataList:

            guid_events[event.guid] = event

        stamp_event_dict:  dict[str, dict[str, List[Timeslot]]]= {}

        for timeslot in timeslots:

            if timeslot.event_guid in guid_events:

                if timeslot.timestamp not in stamp_event_dict:

                    stamp_event_dict[timeslot.timestamp] = {}

                unique_soup = self.get_event_soup(guid_events[timeslot.event_guid])

                if unique_soup not in stamp_event_dict[timeslot.timestamp]:

                    stamp_event_dict[timeslot.timestamp][unique_soup] = []

                if unique_soup not in souped_events:

                    souped_events[unique_soup] = guid_events[timeslot.event_guid]

                stamp_event_dict[timeslot.timestamp][unique_soup].append(timeslot)

        return stamp_event_dict, souped_events

    def join_timeslots(self, stamp_event_list: dict[str, dict[str, List[Timeslot]]], treshhold=1) -> dict[str, List[Timeslot]]:

        """

        Collapses events on the stamp_event_list format that are the same.

        Joins where the events are the same.

        NOTE: It updates the events such

        INPUT:

        stamp_event_list: {

            [minute_stamp]: {

                [_soup]: ([timeslot, timeslot..], [event, event...])

        OUTPUT:

        unique_timeslots: {

            [_soup_minute_stamp]: aggregated

        }

        Now wha ti tneed

        """

        unique_timeslots: dict[str, List[Timeslot]] = {} # Becuase it makes sense to easily loop and access each element at the timeslots

        for minutestamp in stamp_event_list:

            for soup in stamp_event_list[minutestamp]:

                key_stamp = soup + str(minutestamp)

                bptimeslot: Timeslot = copy.copy(stamp_event_list[minutestamp][soup][0])

                for timeslot in stamp_event_list[minutestamp][soup]:

                    if key_stamp not in unique_timeslots:

                        unique_timeslots[key_stamp] = stamp_event_list[minutestamp][soup]

                    for sum_feature in self.sum_features:

                        setattr(bptimeslot, sum_feature, getattr(bptimeslot, sum_feature) + getattr(timeslot, sum_feature))

                    for keep_true_feature in self.keep_true_features:

                        if getattr(timeslot, keep_true_feature) == True:

                            setattr(bptimeslot, keep_true_feature, True)

                # Don't append the timeslot if it doesnt have a keep true feature as true, and all sum_features are 0.

                if all([getattr(bptimeslot, sum_feature) == 0 for sum_feature in self.sum_features]) and all([getattr(bptimeslot, keep_true_feature) == False for keep_true_feature in self.keep_true_features]):

                    continue    

                unique_timeslots[key_stamp] = bptimeslot

        return unique_timeslots

    def unique_timeslots_to_all_timeslots(self, unique_timeslots: dict[str, Timeslot]) -> List[Timeslot]:

        all_timeslots: List[Timeslot] = []

        for unique in unique_timeslots:

            timeslot = unique_timeslots[unique]

            all_timeslots.append(timeslot)

        return all_timeslots

    def transform_events(self, unique_timeslots: dict[str, Timeslot], guid_event: dict[str, Event], treshold_minutes=3) -> List[Event]:

        """

        Goes for each unique_timeslots and and recreates the events length and span based on the closeness of each timeslots

        The way it should work isntead

        """

        output_events: List[Event] = [] # dict continas utc_timestamp_start, utc_timestamp_end unique_soup_key

        for soup_key_stamp in unique_timeslots:

            # We know that all following events should be the same.

            current_timestamp_utc_start = None

            current_timestamp_utc_end = None

            start_event_guid = None

            end_event_guid = None

            eventsStartEndTimeEventGuids: List[dict[str, str]] = (None, None)

            # sort unique_timeslots[soup_key] by timestamp ascending.

            timeslot = unique_timeslots[soup_key_stamp]

            # use nurse scheduling like algorithm. Checking if the timeslot is wihtin treshhold_minutes away.

            if timeslot.timestamp is None or timeslot.timestamp_local is None:

                continue

            if current_timestamp_utc_end is None or current_timestamp_utc_start is None:

                current_timestamp_utc_start = timeslot.timestamp

                current_timestamp_utc_end = timeslot.timestamp

                start_event_guid = timeslot.event_guid

                end_event_guid = timeslot.event_guid

                continue

            if (timeslot.timestamp < current_timestamp_utc_end + timedelta(minutes=treshold_minutes)):

                # Update current. There is no requirement for splitting. As it will only join whnever they are relevant. (only relevant timeslots should be here. )

                if timeslot.timestamp < current_timestamp_utc_start:

                    current_timestamp_utc_start = timeslot.timestampu

                    start_event_guid = timeslot.event_guid

                if timeslot.timestamp > current_timestamp_utc_end:

                    current_timestamp_utc_end = timeslot.timestamp

                    end_event_guid = timeslot.event_guid

            else:

                eventsStartEndTimeEventGuids.append({

                    "start": current_timestamp_utc_start,

                    "end": current_timestamp_utc_end,

                    "start_event_guid": start_event_guid

                })

                current_timestamp_utc_start = timeslot.timestamp

                current_timestamp_utc_end = timeslot.timestamp

            eventsStartEndTimeEventGuids.append({

                "start": current_timestamp_utc_start,

                "end": current_timestamp_utc_end,

                "start_event_guid": start_event_guid

            })

        for eventStartEndTimeEventGuid in eventsStartEndTimeEventGuids:

            event_data: Event = guid_event[eventStartEndTimeEventGuid["event_guid"]].copy()

            event_data.timestamp = eventStartEndTimeEventGuid["start"]

            event_data.end_time = eventStartEndTimeEventGuid["end"]

            output_events.append(event_data)

            # The idea here is that it picks

        return output_events

    def publish_events(self, all_valid_timeslots: List[Timeslot], all_valid_events: List[Event]):

        """

        Inserts the newest eents valid outputs

        """

        insert_events_sql = "INSERT INTO event ({}) VALUES ({})".format(', '.join(Event.get_publishing_keys()), ', '.join(['%s'] * len(Event.get_publishing_keys())))

        print(insert_events_sql)

        # Now with timeslots.

        insert_timeslots_sql = "INSERT INTO timeslot ({}) VALUES ({})".format(', '.join(Timeslot.get_publishing_keys()), ', '.join(['%s'] * len(Timeslot.get_publishing_keys())))

        print(insert_timeslots_sql)

  
  

class JobManager():

    """Management of the enhancement process.

    - In charge of posting processingTracker once the job is handled at start.

  

    - Once processing is processed (including errors), it should post the processingTracker with the error count, endtime.

    - In charge of Updating processingTracker to Error.

  

   """

```


```python
for timeslot in stamp_event_list[minutestamp][soup]:

	for sum_feature in self.sum_features:

		# bptimeslot[sum_feature] += getattr(timeslot, sum_feature)

		setattr(bptimeslot, sum_feature, getattr(bptimeslot, sum_feature) + getattr(timeslot, sum_feature))

	for keep_true_feature in self.keep_true_features:

		if getattr(timeslot, keep_true_feature) == True:

			setattr(bptimeslot, keep_true_feature, True)

	if soup not in unique_timeslots:

		unique_timeslots[soup] = {}

	# Don't append the timeslot if it doesnt have a keep true feature as true, and all sum_features are 0.

	if all([getattr(bptimeslot, sum_feature) == 0 for sum_feature in self.sum_features]) and all([getattr(bptimeslot, keep_true_feature) == False for keep_true_feature in self.keep_true_features]):

		continue    

	unique_timeslots[soup].append(bptimeslot)
```


### What's needed to be connected?
#2024-06-03

- preprocess
- join_timeslots
- transform events

We do need to test thing heavier. Lets see the examples and get inspired on the test cases. (Or just create a large relevant test case)


Lets create first a one-to-one test for the following:

![](../img/Pasted%20image%2020240603091442.png)

Lets create using this examples:


Development question:

- Can this be calculated before the time processing is performed? As part internally of the enhancer?

and then work on the same logic again?



- How does the regular connection work?
	-  It separates n things with the `event _guid`


![](../img/Pasted%20image%2020240603100313.png)


What if we separate things sing the same content? The problem here is that then the same actions by applications such as salesforce would result in the same output. When it was mean to be just different events. (Because it is assuming that where all is just the same.)

Can this be done instead on the platform adaptor?

What I was thinking here is that perhaps they can be joined (or skipped) in the adaptor if it  figures out with a "cache system."


Where am I transforming everything into 


Other conclusions:
- There should be a start calculated already from the 
- And there should be a new field in the column just for `is_start`.

How about `is_start` does it make any difference?


Op1: is start to be calculated on query e.g. This is the extension or not of something else. Or this is to be calculated from inferring the evets? How does it know if is start or not. How about when there is a `span_guid`?

This here should be the same:
What sstrange is that I hould have 2 there
as this one here:

![](../img/Pasted%20image%2020240603150243.png)




![](../img/Pasted%20image%2020240603150227.png)



This is right here:

![](../img/Pasted%20image%2020240603150936.png)

> There should be 3 & 5 as expected




![](../img/Pasted%20image%2020240603151528.png)


![](../img/Pasted%20image%2020240603152206.png)

> This are `2` keystrokes & `2` clicks as expected.



![](../img/Pasted%20image%2020240603153033.png)

> How is guid_event even calculated as from?

And  can't I used `souped_event` in order to get the event here?

Now is this even part of the event:



![](../img/Pasted%20image%2020240603154422.png)

This is correct:


![](../img/Pasted%20image%2020240603154435.png)

However it passes from a large minute problems,. Where the events are too far apart. 

![](../img/Pasted%20image%2020240603155726.png)

```

[{'end': datetime.datetime(2024, 6, 3, 15, 9),
  'start': datetime.datetime(2024, 6, 3, 15, 0),
  'start_event_guid': '1'},
 {'end': datetime.datetime(2024, 6, 3, 15, 14),
  'start': datetime.datetime(2024, 6, 3, 15, 13),
  'start_event_guid': '1'},
 {'end': datetime.datetime(2024, 6, 3, 15, 9),
  'start': datetime.datetime(2024, 6, 3, 15, 6),
  'start_event_guid': '6'}]
```




Now start what's the next step which should be

- [ ] Find all unique events
- [ ] Remove all prints inside the actual code
- [ ] Inject code as part or module inside



Now how can I have it there with the processing engine?

- This should be done by having such in the 

Now there is a problem. The timeslots should be with that same random guid.  The things such as rights, etc.


Why is 8?

![](../img/Pasted%20image%2020240604104356.png)

![](../img/Pasted%20image%2020240604155354.png)

> How come first name be something while the other not?


```sql

MERGE INTO CORPORATION AS corp
    USING (       
        SELECT
        *
    FROM (
      SELECT
        UUID_STRING() AS pf_id,
        
    
    CONCAT('FL', '_', TRIM(SUBSTR($1, 1, 12))) AS pf_state_corpid,
    'FL' AS pf_state,
    METADATA$FILENAME AS pf_source,
    CURRENT_TIMESTAMP() AS pf_loaded_date,
    TRUE AS pf_is_active,
    TRIM(SUBSTR($1, 1, 12)) AS corporation_id,
    TRIM(SUBSTR($1, 13, 192)) AS corporation_name,
    TRY_TO_DATE(TRIM(SUBSTR($1, 473, 8)), 'MMDDYYYY') AS creation_date,
    TRIM(SUBSTR($1, 221, 42)) AS entity_address_1,
    TRIM(SUBSTR($1, 263, 42)) AS entity_address_2,
    TRIM(SUBSTR($1, 305, 28)) AS entity_city,
    TRIM(SUBSTR($1, 333, 2)) AS entity_state,
    TRIM(SUBSTR($1, 335, 10)) AS entity_zip,
    TRIM(SUBSTR($1, 345, 2)) AS entity_country,
    TRIM(SUBSTR($1, 205, 1)) AS status,
    TRIM(SUBSTR($1, 545, 42)) AS registered_agent_name,
    TRIM(SUBSTR($1, 587, 1)) AS registered_agent_type,
    TRIM(SUBSTR($1, 588, 42)) AS registered_agent_address_1,
    TRIM(SUBSTR($1, 630, 28)) AS registered_agent_city,
    TRIM(SUBSTR($1, 658, 2)) AS registered_agent_state,
    TRIM(SUBSTR($1, 660, 9)) AS registered_agent_zip,
    TRIM(SUBSTR($1, 206, 15)) AS corporation_type,
    TRIM(SUBSTR($1, 669, 4)) AS officer_1_title,
    TRIM(SUBSTR($1, 673, 1)) AS officer_1_type,
    TRIM(SUBSTR($1, 674, 42)) AS officer_1_last_name,
    TRIM(SUBSTR($1, 716, 42)) AS officer_1_address_1,
    TRIM(SUBSTR($1, 758, 28)) AS officer_1_city,
    TRIM(SUBSTR($1, 786, 2)) AS officer_1_state,
    TRIM(SUBSTR($1, 788, 9)) AS officer_1_zip,
    TRIM(SUBSTR($1, 797, 4)) AS officer_2_title,
    TRIM(SUBSTR($1, 801, 1)) AS officer_2_type,
    TRIM(SUBSTR($1, 802, 42)) AS officer_2_last_name,
    TRIM(SUBSTR($1, 844, 42)) AS officer_2_address_1,
    TRIM(SUBSTR($1, 886, 28)) AS officer_2_city,
    TRIM(SUBSTR($1, 914, 2)) AS officer_2_state,
    TRIM(SUBSTR($1, 916, 9)) AS officer_2_zip,
    TRIM(SUBSTR($1, 925, 4)) AS officer_3_title,
    TRIM(SUBSTR($1, 929, 1)) AS officer_3_type,
    TRIM(SUBSTR($1, 930, 42)) AS officer_3_last_name,
    TRIM(SUBSTR($1, 972, 42)) AS officer_3_address_1,
    TRIM(SUBSTR($1, 1014, 28)) AS officer_3_city,
    TRIM(SUBSTR($1, 1042, 2)) AS officer_3_state,
    TRIM(SUBSTR($1, 1044, 9)) AS officer_3_zip,
    TRIM(SUBSTR($1, 1053, 4)) AS officer_4_title,
    TRIM(SUBSTR($1, 1057, 1)) AS officer_4_type,
    TRIM(SUBSTR($1, 1058, 42)) AS officer_4_last_name,
    TRIM(SUBSTR($1, 1100, 42)) AS officer_4_address_1,
    TRIM(SUBSTR($1, 1142, 28)) AS officer_4_city,
    TRIM(SUBSTR($1, 1170, 2)) AS officer_4_state,
    TRIM(SUBSTR($1, 1172, 9)) AS officer_4_zip,
    TRIM(SUBSTR($1, 1181, 4)) AS officer_5_title,
    TRIM(SUBSTR($1, 1185, 1)) AS oofficer_5_type,
    TRIM(SUBSTR($1, 1186, 46)) AS officer_5_last_name,
    TRIM(SUBSTR($1, 1228, 42)) AS officer_5_address_1,
    TRIM(SUBSTR($1, 1270, 28)) AS officer_5_city,
    TRIM(SUBSTR($1, 1298, 2)) AS officer_5_state,
    TRIM(SUBSTR($1, 1300, 9)) AS officer_5_zip,
    TRIM(SUBSTR($1, 1309, 4)) AS officer_6_title,
    TRIM(SUBSTR($1, 1313, 1)) AS officer_6_type,
    TRIM(SUBSTR($1, 1314, 42)) AS officer_6_last_name,
    TRIM(SUBSTR($1, 1356, 42)) AS officer_6_address_1,
    TRIM(SUBSTR($1, 1398, 28)) AS officer_6_city,
    TRIM(SUBSTR($1, 1426, 2)) AS officer_6_state,
    TRIM(SUBSTR($1, 1428, 9)) AS officer_6_zip,
    TRIM(SUBSTR($1, 347, 42)) AS entity_mailing_address_1,
    TRIM(SUBSTR($1, 389, 42)) AS entity_mailing_address_2,
    TRIM(SUBSTR($1, 431, 28)) AS entity_mailing_city,
    TRIM(SUBSTR($1, 459, 2)) AS entity_mailing_state,
    TRIM(SUBSTR($1, 461, 10)) AS entity_mailing_zip,
    TRIM(SUBSTR($1, 471, 2)) AS entity_mailing_country,
    TRIM(SUBSTR($1, 481, 14)) AS ein,
    TRY_TO_DATE(TRIM(SUBSTR($1, 496, 8))) AS last_transaction_date,
    TRY_TO_BOOLEAN(TRIM(SUBSTR($1, 495, 1))) AS is_there_more_than_6_officers,
    TRY_TO_NUMBER(TRIM(SUBSTR($1, 506, 4))) AS report_year_1,
    TRY_TO_DATE(TRIM(SUBSTR($1, 511, 8)), 'MMDDYYYY') AS report_date_1,
    TRY_TO_NUMBER(TRIM(SUBSTR($1, 519, 4))) AS report_year_2,
    TRY_TO_DATE(TRIM(SUBSTR($1, 524, 8)), 'MMDDYYYY') AS report_date_2,
    TRY_TO_NUMBER(TRIM(SUBSTR($1, 532, 4))) AS report_year_3,
    TRY_TO_DATE(TRIM(SUBSTR($1, 537, 8)), 'MMDDYYYY') AS report_date_3,
    ROW_NUMBER() OVER (PARTITION BY TRIM(SUBSTR($1, 1, 12)) ORDER BY METADATA$FILE_ROW_NUMBER DESC) AS row_num,
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
    OFFICER_1_LAST_NAME AS full_name,
    FirstName AS officer_1_first_name, 
    BASE64_ENCODE(CORPORATION_NAME) AS pf_corporation_encoded,
    BASE64_ENCODE(PF_STATE_CORPID) AS pf_state_corpid_encoded
  FROM @FL (FILE_FORMAT => PLAIN_TEXT, PATTERN =>  '.*cordata.*.*txt.*')
) t
WHERE t.row_num = 1
) AS src
ON corp.pf_state_corpid = src.pf_state_corpid
WHEN MATCHED THEN
    UPDATE SET
        firstname_mailing = src.firstname_mailing,
        pf_corporation_encoded = src.pf_corporation_encoded,
        pf_state_corpid_encoded = src.pf_state_corpid_encoded,
        corporation_id = src.corporation_id,
        corporation_name = src.corporation_name,
        pf_state = src.pf_state,
        creation_date = src.creation_date,
        entity_address_1 = src.entity_address_1,
        entity_address_2 = src.entity_address_2,
        entity_city = src.entity_city,
        entity_state = src.entity_state,
        entity_zip = src.entity_zip,
        entity_country = src.entity_country,
        status = src.status,
        entity_mailing_address_1 = src.entity_mailing_address_1,
        entity_mailing_address_2 = src.entity_mailing_address_2,
        entity_mailing_city = src.entity_mailing_city,
        entity_mailing_state = src.entity_mailing_state,
        entity_mailing_zip = src.entity_mailing_zip,
        entity_mailing_country = src.entity_mailing_country,
        ein = src.ein,
        last_transaction_date = src.last_transaction_date,
        is_there_more_than_6_officers = src.is_there_more_than_6_officers,
        report_year_1 = src.report_year_1,
        report_date_1 = src.report_date_1,
        report_year_2 = src.report_year_2,
        report_date_2 = src.report_date_2,
        report_year_3 = src.report_year_3,
        report_date_3 = src.report_date_3,
        pf_source = src.pf_source,
        pf_loaded_date = src.pf_loaded_date,
        pf_is_active = src.pf_is_active,
        officer_1_title = src.officer_1_title,
        officer_1_type = src.officer_1_type,
        officer_1_first_name = src.officer_1_first_name,
        officer_1_last_name = src.officer_1_last_name,
        officer_1_address_1 = src.officer_1_address_1,
        officer_1_city = src.officer_1_city,
        officer_1_state = src.officer_1_state,
        officer_1_zip = src.officer_1_zip,
        officer_2_title = src.officer_2_title,
        officer_2_type = src.officer_2_type,
        officer_2_last_name = src.officer_2_last_name,
        officer_2_address_1 = src.officer_2_address_1,
        officer_2_city = src.officer_2_city,
        officer_2_state = src.officer_2_state,
        officer_2_zip = src.officer_2_zip,
        officer_3_title = src.officer_3_title,
        officer_3_type = src.officer_3_type,
        officer_3_last_name = src.officer_3_last_name,
        officer_3_address_1 = src.officer_3_address_1,
        officer_3_city = src.officer_3_city,
        officer_3_state = src.officer_3_state,
        officer_3_zip = src.officer_3_zip,
        officer_4_title = src.officer_4_title,
        officer_4_type = src.officer_4_type,
        officer_4_last_name = src.officer_4_last_name,
        officer_4_address_1 = src.officer_4_address_1,
        officer_4_city = src.officer_4_city
WHEN NOT MATCHED THEN
    INSERT (pf_id, pf_state_corpid, pf_state, pf_source, pf_loaded_date, pf_is_active, corporation_id, corporation_name, creation_date, entity_address_1, entity_address_2, entity_city, entity_state, entity_zip, entity_country, status, entity_mailing_address_1, entity_mailing_address_2, entity_mailing_city, entity_mailing_state, entity_mailing_zip, entity_mailing_country, ein, last_transaction_date, is_there_more_than_6_officers, report_year_1, report_date_1, report_year_2, report_date_2, report_year_3, report_date_3, officer_1_title, officer_1_type, officer_1_first_name, officer_1_last_name, officer_1_address_1, officer_1_city, officer_1_state, officer_1_zip, officer_2_title, officer_2_type, officer_2_last_name, officer_2_address_1, officer_2_city, officer_2_state, officer_2_zip, officer_3_title, officer_3_type, officer_3_last_name, officer_3_address_1, officer_3_city, officer_3_state, officer_3_zip, officer_4_title, officer_4_type, officer_4_last_name, officer_4_address_1, officer_4_city, officer_4_state, officer_4_zip, pf_corporation_encoded, pf_state_corpid_encoded)
    VALUES (src.pf_id, src.pf_state_corpid, src.pf_state, src.pf_source, src.pf_loaded_date, src.pf_is_active, src.corporation_id, src.corporation_name, src.creation_date, src.entity_address_1, src.entity_address_2, src.entity_city, src.entity_state, src.entity_zip, src.entity_country, src.status, src.entity_mailing_address_1, src.entity_mailing_address_2, src.entity_mailing_city, src.entity_mailing_state, src.entity_mailing_zip, src.entity_mailing_country, src.ein, src.last_transaction_date, src.is_there_more_than_6_officers, src.report_year_1, src.report_date_1, src.report_year_2, src.report_date_2, src.report_year_3, src.report_date_3, src.officer_1_title, src.officer_1_type, src.officer_1_first_name, src.officer_1_last_name, src.officer_1_address_1, src.officer_1_city, src.officer_1_state, src.officer_1_zip, src.officer_2_title, src.officer_2_type, src.officer_2_last_name, src.officer_2_address_1, src.officer_2_city, src.officer_2_state, src.officer_2_zip, src.officer_3_title, src.officer_3_type, src.officer_3_last_name, src.officer_3_address_1, src.officer_3_city, src.officer_3_state, src.officer_3_zip, src.officer_4_title, src.officer_4_type, src.officer_4_last_name, src.officer_4_address_1, src.officer_4_city, src.officer_4_state, src.officer_4_zip, src.pf_corporation_encoded, src.pf_state_corpid_encoded);

```



### Deploy Enhancement

It looks to be working fine:

- [ ] Double check that things are working as expected.
- [x] Ensure that the `is_start` is mapped by `infering` if the end and start on the Event Data Check.
	- [ ] This is specifically on some adapters only: Windows & Chrome


- Crete the `auto_is_start` method on parent methods.
- Then also auto `is_start` has to be trickled down into remainder of checking for Timeslots. so that the timeslot knows if itself is a start. 
- All salesforce and emails integrations are `technically` starts. 
- Also check if by recreating the timeslots there is an `uppend` method ~ That would be incorrect. 

In summary:

- [x] Check for Timeslot creation how is it inferring the `is_start`
	- [x] if it is start then mark the first 
	- [x] Modify is start as the is start optional
	- [x] Allow timeslots for offering is start

- [x] Mark `is_start` = True for all Salesforce and Email


Conceptually, the logic should be right here.

```
  

        if eventData.end_time is not None and eventData.duration is not None and eventData.duration > 0:

            while curr_time <= end_time:

                timeslot = self.defineTimeslot(curr_time, eventData)

                timeslots.append(timeslot)

                curr_time = curr_time + timedelta(minutes=1)

  

        else:

            # If the end_time is not present, then we can only create the timeslots for the duration of the event.

            timeslot = self.defineTimeslot(curr_time, eventData)

            timeslots.append(timeslot)
```


Debugging Idea:

- [ ] Make it so that there is an option for testing, to publish everything on test only. Not really needed.

---
After testing, make sure that:

- ALLOW_ERROR_BREAK is False


Future:
- [ ] Design also that it works outside of Timeslot Processing. Similar to an End of day or hourly reprocessing of starting from 7 days ago.
- [ ] 



![[Pasted image 20240606123414.png]]


- [ ] Check what's with that 
- [ ] Check what's with 

In many events you even end up with more timeslots that even possible:
![[Pasted image 20240606123725.png]]



![[Pasted image 20240606124128.png]]
> Why is all ts0?


![[Pasted image 20240606134631.png]]

Here is working fine. I wonder how about the others?




Is it even updating the right table?

2024-06-06: 67234



SELECT COUNT(*) FROM public.event;
2024-06-06

63867


![[Pasted image 20240606140703.png]]



I can clearly see the timeslots here:

![[Pasted image 20240606142100.png]]



Critical Success!!

![[Pasted image 20240606143226.png]]

You can clearly see the bunch of keystrokes that I started accumulating in devcooks instead of the multiples. 



![[Pasted image 20240606143842.png]]

Here I can see timeslots that basically shouldn't exist.


```python
# if all sumfeatures are 0 and all keep_true_features are False, then it is not relevant.

is_relevant = False

for sum_feature in self.sum_features:
	if timeslot.__dict__[sum_feature] > 0:
		is_relevant = True
		break

if not is_relevant:
	for keep_true_feature in self.keep_true_features:
		if timeslot.__dict__[keep_true_feature]:
			is_relevant = True
			break

if not is_relevant:
	continue
```


this is to be added straight into before calling transform _events_

```python
def transform_events(self, unique_timeslots: dict[str, List[Timeslot]], guid_event: dict[str, Event], treshold_minutes=4) -> Tuple[List[Event], List[Timeslot]]:
```

Which is called here:


```python
significance_testing_timeslots: dict[str, dict[datetime.datetime, Timeslot]] = self.join_timeslots(timeslots_pre)

transformed_events, unique_timelsots_mapped = self.transform_events(significance_testing_timeslots, guid_to_event)

checked_events: List[Event] = []

for event in transformed_events:

	checked_events.append(event)

return checked_events, unique_timelsots_mapped
```


Why did it breakout and count them as 2 clicks?

![[Pasted image 20240606150915.png]]

Is this a processing error?
Is this something to do with the s3?



This should be clicking event:

![[Pasted image 20240606151627.png]]


```js
const handleSync = async () => {

    utils.updateFocusStatus().then((isFocused) => {

        (async () => {
            if (!isFocused) {
                // Not to continue further.
                if (Constants.DEBUG) console.log("is not focused", isFocused, "Wrapping the log (If any)");

                utils.wrapNewTabFocusLog();

            }

            else if (isFocused) {
                // Continues from before.
                const wrapResults = await utils.wrapNewTabFocusLog({ removeCurrentLog: false });
                if (Constants.DEBUG) console.log("wrapResults", wrapResults);
            }
            // Remove following line, if not expected to run bulk upload every minute.
            await utils.bulkUpload();
        })();

    }

    )

}


...

// getInteractions

    getInteractions = async () => {

        let interactions = await this.getFromLocalStorage(INTERACTION_TYPES);

        return interactions;

    }

```



How does obsidian map the activity? 
- You should probably force taht specific timeslot? Like in Windows?



Right, this has to be updated likely:

```python
  

mouse_clicks={

	unique_minutestamp: getSumFeats(event_raw, "interactions", "auxclick", "click", "dblclick", "mousedown", "mouseup", "mouseover", "mouseout", "contextmenu")},

keystrokes={

	unique_minutestamp: getSumFeats(event_raw, "interactions", "keyboard")},

)
```


This is correct (surprisingly):

```python
unique_minutestamp = Utils.datetimeToYearMonthDayMinute(collected_date)



end_time = Utils.parseDate(Utils.SafeParse(event_raw, 'event_end_date'))

if end_time is not None:

	unique_minutestamp = Utils.datetimeToYearMonthDayMinute(end_time)
```


- But is a hack. It should be and can be done better.

### Fixing Repeated on long lasting events.

```python
    def publishEvents(self, events: List[Event]) -> bool:

        """

        Fetch if there are the same events, creates two lists:

        - if they don't exist, then insert them.

        - if they exist, then ONLY update their end_time.

        """

        events_guids = [event.guid for event in events]

        if len(events_guids) == 0:

            return True

        placeholders = ', '.join(['%s'] * len(events_guids))

        select_sql = f"SELECT guid, end_time, end_time_local FROM event WHERE guid IN ({placeholders})"

        self.job_service.cursor.execute(select_sql, events_guids)
```

> Here you can see that this is based on the guid. Which should be based on the span_guid


![[Pasted image 20240607165135.png]]


![[Pasted image 20240607165143.png]]


> Note how they have the same span_guid



Some hypothesis:
- I am not inserting the guid?
- Theory 2: I am randomizing the guid instead on adapter - DIS
- Am I randomizing the guid at a different place?


```js
event_data = EventData(
event_guid = Utils.SafeParse(event_raw, 'span_guid'),
```

> Proves that the `event_guid` is retrieved from `span_guid` 


- Am I randomizing the guid at a different place?

```python
At the adapter... for EventData

self.event_guid = event_guid if event_guid is not None else str(uuid.uuid4())
```

this could occur only if not shown.

What is staging_guid used here at Event:

```python
  

self.staging_guid = str(uuid.uuid4()) # GUID Will be used to populate the Timeslots on creation.
# Id is generated automatically at creation (cannot be assigned).

self.guid = guid # Should be mapped from event_guid

self.organization_guid = organization_guid
```

No one seems to be referring to it:

![[Pasted image 20240607170141.png]]
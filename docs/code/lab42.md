# Lab 4.2 - API


- [Lab 4.2 - API](#lab-42---api)
- [Introduction](#introduction)
- [Schemas](#schemas)
    - [User Schema](#user-schema)
    - [Quest Schema](#quest-schema)
- [Endpoints](#endpoints)
  - [User](#user)
    - [Get all users](#get-all-users)
    - [Create new user](#create-new-user)
    - [Update User](#update-user)
    - [Get Specific user](#get-specific-user)
  - [Quest](#quest)
    - [Get all Quests](#get-all-quests)
    - [Create a quest](#create-a-quest)
    - [Updating a quest](#updating-a-quest)
    - [Get Specific Quest](#get-specific-quest)
    - [Delete Specific Quest](#delete-specific-quest)
    - [Completing Specific Quest](#completing-specific-quest)

# Introduction

Links

- [Github Repo](https://github.com/NeneWang/lab4.2)
- [API](https://simplenodeserver2.herokuapp.com/)
- [Notion Documentation]()

This API emulates the classical RPG's Questboard system. You can create quests, aventurers, update and manage quest's or aventurer's information. 

![Lab%204%202%20-%20API%20fb4a8b1f41154b05a0646e2cc3821bca/Untitled.png](/Lab%204%202%20-%20API%20fb4a8b1f41154b05a0646e2cc3821bca/Untitled.png)

Image from: [https://forum.novelupdates.com/threads/d-i-c-e-au-quest-board.76794/](/https://forum.novelupdates.com/threads/d-i-c-e-au-quest-board.76794/)

# Schemas

### User Schema

```jsx
const userSchema = new mongoose.Schema({
    username: String,
    tags: String,
    questsCompleted: Number,

});
```

- username: string type, aventurer username e.g "KonanWild"
- tags: string type, tags attached to the aventurer e.g "Rank-Diamond, Class-Mage"
- questCompleted: Amount of quests completed by the aventurer e.g: "questsCompleted": 125

### Quest Schema

```jsx
const questSchema = new mongoose.Schema({
    questName: String,
    completed: Boolean,
    description: String,
    tags: String,
    questBoard: Number
});
```

- questName: string type, quest title, e.g "Find my cat"
- completed: boolean type, attribute records if the quest had been completed e.g true
- description: string type, records the description of the quest e.g "I last found my cat at the Plaza, now is no more!, help!"
- tags: string type. Records tags given to the quest, separated by commas e.g: "difficulty-Easy, location-Mondstadt"

# Endpoints

## User

### Get all users

Get Request for all users in the database

```jsx
GET https://simplenodeserver2.herokuapp.com/users
```

- Response

    ```jsx
    [
      {
        "_id": "610b5cce9f2082d3a8bcd874",
        "username": "Merlin",
        "tags": "Rank-Diamond, Class-Mage",
        "questsCompleted": 4,
        "__v": 0
      },
      {
        "_id": "610b85923d629fcc5824416c",
        "username": "Arthur",
        "tags": "Rank-Porcelain, Class-Paladin",
        "questsCompleted": 10,
        "__v": 0
      }
    ]
    ```

### Create new user

POST Request to create new user record. In this case we want to create an user named Merlin, a Diamond ranked aventurer class Mage. who completed 123 quests. Responds with a message and the new user created.

```jsx
POST https://simplenodeserver2.herokuapp.com/users
content-type: application/json

{
    "username": "Merlin",
    "tags": "Rank-Diamond, Class-Mage",
    "questsCompleted": 123
}
```

- Response

    ```json
    {
      "message": "user created",
      "user": {
        "_id": "610be9406a2f790004121ee3",
        "username": "Merlin",
        "tags": "Rank-Diamond, Class-Mage",
        "questsCompleted": 123,
        "__v": 0
      }
    }
    ```

### Update User

POST Request to create new user record. In this case we want to create update our previously created user named Merlin, into a Gold ranked aventurer class Mage. now completing 150 quests. Responds with a message stating that the user had been updated and the new user created. YOU CAN'T CHANGE the username (username must match existent user, or it will create a new user)

```jsx
GET https://simplenodeserver2.herokuapp.com/users
```

- Response

    ```json
    {
      "message": "User updated",
      "user": {
        "_id": "610be9406a2f790004121ee3",
        "username": "Merlin",
        "tags": "Rank-Gold, Class-Mage",
        "questsCompleted": 150,
        "__v": 0
      }
    }
    ```

### Get Specific user

In this example I am looking for Merlin information. The name is case-sensitive. Failure will return a error message and a 404 status.

```jsx
GET https://simplenodeserver2.herokuapp.com/users/:username

GET https://simplenodeserver2.herokuapp.com/users/Merlin
```

- Response

    ```json
    {
      "_id": "610be9406a2f790004121ee3",
      "username": "Merlin",
      "tags": "Rank-Diamond, Class-Mage",
      "questsCompleted": 123,
      "__v": 0
    }
    ```

- Failure response

    ```json
    {
      "message": "User Goku not found"
    }
    ```

## Quest

### Get all Quests

Get Request for all users in the database

```jsx
GET https://simplenodeserver2.herokuapp.com/users
```

- Response

    ```json
    [
      {
        "_id": "610b949372945e000433ca1f",
        "questName": "Finish the school",
        "description": "Yeah",
        "tags": "Difficulty-Easy, Location-LiyueHarbor,",
        "questBoard": 1,
        "__v": 0,
        "completed": true
      },
      {
        "_id": "610bee87d2cc930004bf9dbf",
        "questName": "Ghostly Waves",
        "completed": false,
        "description": "There are some weird waves moving around, I think they are ghosts..",
        "tags": "difficulty-Medium, location-Mondstadt",
        "questBoard": 1,
        "__v": 0
      }
    ]
    ```

### Create a quest

Get Request for all users in the database

```jsx
POST https://simplenodeserver2.herokuapp.com/new-quest
content-type: application/json

{
    "questName": "Ghostly Waves",
    "description": "There are some weird waves moving around, I think they are ghosts..",
    "tags": "difficulty-Medium, location-Mondstadt",
    "questBoard": 1

}
```

- Response

    ```json
    {
      "message": "quest created",
      "quest": {
        "_id": "610bf0ebd2cc930004bf9dc7",
        "questName": "Ghostly Waves",
        "completed": false,
        "description": "There are some weird waves moving around, I think they are ghosts..",
        "tags": "difficulty-Medium, location-Mondstadt",
        "questBoard": 1,
        "__v": 0
      }
    }
    ```

### Updating a quest

To update a quest, make sure you have the the o_id of the 

```jsx
POST https://simplenodeserver2.herokuapp.com/quests
content-type: application/json

{
    "o_id": "610bf0ebd2cc930004bf9dc7",
    "questName": "[update] Ghostly Waves...",
    "completed": false,
    "description": "Now that I remember it was near the town plaza... I lost my cat when I got back tomy home it wasn't there hep",
    "tags": "difficulty-Easy, location-Mondstadt",
    "questBoard": 1

}
```

- Response

    ```json
    {
      "message": "Quest updated",
      "quest": {
        "_id": "610bf0ebd2cc930004bf9dc7",
        "questName": "[update] Ghostly Waves...",
        "completed": false,
        "description": "Now that I remember it was near the town plaza... I lost my cat when I got back tomy home it wasn't there hep",
        "tags": "difficulty-Easy, location-Mondstadt",
        "questBoard": 1,
        "__v": 0
      }
    }
    ```

### Get Specific Quest

Get the specific Quest using a GET request to /quests/o_id The o_id as a parameter after /quests/ of the quest you are looking for.

```jsx
GET https://simplenodeserver2.herokuapp.com/quests/:o_id

GET https://simplenodeserver2.herokuapp.com/quests/610bf0ebd2cc930004bf9dc7
```

- Response

    ```json
    {
      "_id": "610bf0ebd2cc930004bf9dc7",
      "questName": "[update] Ghostly Waves...",
      "completed": false,
      "description": "Now that I remember it was near the town plaza... I lost my cat when I got back tomy home it wasn't there hep",
      "tags": "difficulty-Easy, location-Mondstadt",
      "questBoard": 1,
      "__v": 0
    }
    ```

### Delete Specific Quest

DELETE resquest to /quests/:o_id o_id: The object ID of the quest intended to be removed. Failure will return a error message and a 404 status.

```jsx
DELETE https://simplenodeserver2.herokuapp.com/quests/610b58868c0d60bdc0f61939
```

- Response (Success)

    ```json
    {
      "message": "Deleted quest with ID: 610bf0ebd2cc930004bf9dc7"
    }
    ```

- Failure Response

    ```json
    HTTP/1.1 404 Not Found
    Server: Cowboy
    Connection: close
    X-Powered-By: Express
    Access-Control-Allow-Origin: *
    Content-Type: application/json; charset=utf-8
    Content-Length: 34
    Etag: W/"22-aIXPu1F/uQzvqOvnqWdszElyKBQ"
    Date: Thu, 05 Aug 2021 14:22:02 GMT
    Via: 1.1 vegur

    {
      "message": "Error deleting quest"
    }
    ```

### Completing Specific Quest

Completing a quest requires the username of the user/aventurer that completed the quest and the quest ID. Completing a quest will increase by one the amount of quest completed for the aventurer and also mark the quest as completed=true. Requires a POST request with a request body format JSON containing: o_id: the quest ID; username: aventurer username. The API returns a (upon a successful update) a success message containing the user and quest updated data. Failure will return a error message and a 404 status.

```jsx
POST https://simplenodeserver2.herokuapp.com/complete-quest
content-type: application/json

{
    "o_id":"610bf56ad2cc930004bf9dd7",
    "username":"Merlin"

}
```

- Response (Success)

    ```json
    {
      "message": "Quest id: 610bf56ad2cc930004bf9dd7 Completed by Merlin",
      "user": {
        "_id": "610be9406a2f790004121ee3",
        "username": "Merlin",
        "tags": "Rank-Diamond, Class-Mage",
        "questsCompleted": 124,
        "__v": 0
      },
      "quest": {
        "_id": "610bf56ad2cc930004bf9dd7",
        "questName": "Ghostly Waves",
        "completed": true,
        "description": "There are some weird waves moving around, I think they are ghosts..",
        "tags": "difficulty-Medium, location-Mondstadt",
        "questBoard": 1,
        "__v": 0
      }
    }
    ```

- Failure Reponse

    ```json
    {
      "message": "Quest with id: 610bf56ad2cc930004bf9dd7 or User with username: Merl2in not found"
    }
    ```
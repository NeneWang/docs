---
title: September 23
---


## 1 Fri

### 1.todo

- [ ] 1.1 Fix The SlC broken page.

Tried fixing but still:


```bash
<?php

namespace TCG\Voyager\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Route;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class MenuItem extends Model
{
    use Translatable;

    protected $translatorMethods = [
        'link' => 'translatorLink',
    ];

    protected $table = 'menu_items';

    protected $guarded = [];

    protected $translatable = ['title'];

    public static function boot()
    {
        parent::boot();

        static::created(function ($model) {
            $model->menu->removeMenuFromCache();
        });

        static::saved(function ($model) {
            $model->menu->removeMenuFromCache();
        });

        static::deleted(function ($model) {
            $model->menu->removeMenuFromCache();
        });
    }

    public function children()
    {
        return $this->hasMany(Voyager::modelClass('MenuItem'), 'parent_id')
            ->with('children');
    }

    public function menu()
    {
        return $this->belongsTo(Voyager::modelClass('Menu'));
    }

    public function link($absolute = false)
    {
        return $this->prepareLink($absolute, $this->route, $this->parameters, $this->url);
    }

    public function translatorLink($translator, $absolute = false)
    {
        return $this->prepareLink($absolute, $translator->route, $translator->parameters, $translator->url);
    }

    protected function prepareLink($absolute, $route, $parameters, $url)
    {
        if (is_null($parameters)) {
            $parameters = [];
        }

        if (is_string($parameters)) {
            $parameters = json_decode($parameters, true);
        } elseif (is_array($parameters)) {
            $parameters = $parameters;
        } elseif (is_object($parameters)) {
            $parameters = json_decode(json_encode($parameters), true);
        }

        if (!is_null($route)) {
            if (!Route::has($route)) {
                return '#';
            }

            return route($route, $parameters, $absolute);
        }

        if ($absolute) {
            return url($url);
        }

        return $url;
    }

    public function getParametersAttribute($value)
{
    return $value ? json_decode($value, true) : [];
}

    public function setParametersAttribute($value)
    {
        if (is_array($value)) {
            $value = json_encode($value);
        }

        $this->attributes['parameters'] = $value;
    }

    public function setUrlAttribute($value)
    {
        if (is_null($value)) {
            $value = '';
        }

        $this->attributes['url'] = $value;
    }

    /**
     * Return the Highest Order Menu Item.
     *
     * @param number $parent (Optional) Parent id. Default null
     *
     * @return number Order number
     */
    public function highestOrderMenuItem($parent = null)
    {
        $order = 1;S

        $item = $this->where('parent_id', '=', $parent)
            ->orderBy('order', 'DESC')
            ->first();

        if (!is_null($item)) {
            $order = intval($item->order) + 1;
        }

        return $order;
    }
}
```


## 11 Mon

### 11.todo

- [x] 11.1 Work on the AspNet
- [x] 11.2 Get started with Coderhouse.


I think today's coderhouse will be just basic, 

### 11.1 Work on the AspNet


## 15 Fri


### 15.todo

- [x] 15.1 Creating a Sell Buy Button
- [ ] 15.2 Bookmarks Show all 

### 15.1 Creating a Sell Buy Button

<!-- ![](./../../img/2023-09-15-08-35-21.png) 

Now we need to match the integer

![](./../../img/2023-09-15-10-06-55.png) -->


Attempting to fix:

```
 profit_color: Color(0xffeb5757)}
I/flutter ( 4593): _totalCostController.text
I/flutter ( 4593): Invalid input. Not a valid integer.
I/flutter ( 4593): 184.12
```

So its an actual Float:

```

// Check if the input string is a valid integer
if (RegExp(r'^[0-9]+$').hasMatch(totalCostString)) {
double totalCost = double.parse(totalCostString);
print("totalCost" + totalCost.toString());
int count = (totalCost / double.parse(price)).round();

print('price: ${price.toString()}, symbol: $symbol');
purchaseMethod(symbol, count: count, price: price);
} else {
print('Invalid input. Not a valid integer.');
print(totalCostString);
}
```

```dart

    if (response.statusCode == 200) {
      print("Purchase stock success");
      print(response.body);
      await syncData();
      // return;
    } else {
```

By the way this might be breaking the code.


- [x] Sell Button.


- [x] Today I am hoping to fix SLC Website as well. Try once again, otherwise move the domain to one of your owns.


- [ ] Get the Portfolio correctly with the count and stuff.

```bash
85b0ecf8-4ea7-4ad2-a388-30df41971095
```

There are couples of things to do on the API:

- [x] Modify the the API to at least create some fake bookmarks if there is empty or <= 1 bookmrks.
- [x] Include Cash

```json
{
  "stocks_names": [
    "ACN",
    "AAPL"
  ],
  "bookmarks_names": [
    "META",
    "AAPL"
  ],
  "bookmarks": {
    "META": {
      "Adj Close": 300.30999755859375,
      "Close": 300.30999755859375,
      "High": 312,
      "Low": 298.75,
      "Open": 311.6099853515625,
      "Volume": 26470820
    },
    "AAPL": {
      "Adj Close": 175.00999450683594,
      "Close": 175.00999450683594,
      "High": 176.4949951171875,
      "Low": 173.82000732421875,
      "Open": 174,
      "Volume": 109062327
    }
  },
  "stocks": {
    "ACN": {
      "Adj Close": 312.5299987792969,
      "Close": 312.5299987792969,
      "High": 316.67498779296875,
      "Low": 311.4599914550781,
      "Open": 316.2300109863281,
      "Volume": 3334512
    },
    "AAPL": {
      "Adj Close": 175.00999450683594,
      "Close": 175.00999450683594,
      "High": 176.4949951171875,
      "Low": 173.82000732421875,
      "Open": 174,
      "Volume": 109062327
    }
  },
  "papel_asset_worth": 837.5599822998047
}
```


Now lets grab the API.


### 15.2 Bookmarks Show all

 - [ ] Get all the bookmark.


Get all the bookmark and use that data. Whereas you want to write 

```dart

final stockList = convertToListingFormat(watchListPageBuildStocks);
```
This is still using the data on the 

```json
const Map<String, Map<String, dynamic>> watchListPageBuildStocks = {
  "AAPL": {
    "Adj Close": 184.1199951171875,
    "Close": 184.1199951171875,
    "High": 184.89999389648438,
    "Low": 179.5,
    "Open": 179.6999969482422,
    "Volume": 52365100
  },
  "ACN": {
    "Adj Close": 323.45001220703125,
    "Close": 323.45001220703125,
    "High": 324.3699951171875,
    "Low": 319.55999755859375,
    "Open": 320.3900146484375,
    "Volume": 1525000
  }
};
```

```json
 "stocks": {
    "ACN": {
      "Adj Close": 312.5299987792969,
      "Close": 312.5299987792969,
      "High": 316.67498779296875,
      "Low": 311.4599914550781,
      "Open": 316.2300109863281,
      "Volume": 3334512
    },
    "AAPL": {
      "Adj Close": 175.00999450683594,
      "Close": 175.00999450683594,
      "High": 176.4949951171875,
      "Low": 173.82000732421875,
      "Open": 174,
      "Volume": 109062327
    }
  },
```

```
So lets see 175:
```

WHERE you have the kson like this, now the question is if you have the data like that? On the backend?

Here being how

```dart
print(responseData);
userBookmarkPrices = responseData["bookmarks"];
userStockPrices = responseData["stocks"];
```

Now lets see if thats on the dashboard?


Show Cash Left:

- [x] Show the cash left when buying.
- [x] Create a Force Reload.

### Fix the problem with removign into stateful

The solution was having

```dart

```

In the declaration fothe stateful

### Create a dictionary to store the formatted data
    formatted_data_key = {}
    print(ticket_data.columns.levels[0])
    for column in ticket_data.columns.levels[0]:
        column_data = {}
        for ticker in selected_ticket_names:
            ticker_value = list(ticket_data[(column, ticker)].to_dict().values())[0]
            column_data[ticker] = ticker_value 
            # if value is none or nan, then skip
            if(ticker_value is None or ticker_value is pd.NaT or pd.isna(ticker_value)):
                print("ticker_value is None", ticker_value, ticker, column)
                continue
            if(ticker not in formatted_data_key):
                formatted_data_key[ticker] = {}
            formatted_data_key[ticker][column] = ticker_value 
    print(formatted_data_key)




### Creating a search button for the stocks around.


For now it can just be a list filter.

```dart
Get.snackbar(
    "Refreshed",
    "Portfolio refreshed",
    backgroundColor: green219653,
    colorText: white,
    );
```

## 16 Sat

### Creating the login



```py

@router.post('/get_highlight_today', status_code=200)
async def get_user_report(
    player_id: str,
    selected_ticket_names: List[str] = Query([]),):
    """Return all data including stocks, bookmarks and papel asset worth
    Try with player_id: 85b0ecf8-4ea7-4ad2-a388-30df41971095

    Args:
        player_id (str): The user id of the user
        selected_ticket_names (List[str]): The ticket names of the bookmarked ticket names

    Returns a dict of:
        stocks: List[{'stock_name': str, 'stock_price': float}]
        bookmarks: List[{'stock_name': str, 'stock_price': float}]
        papel_asset_worth: float
    """
    assets = await getAssets(player_id=player_id)
    assets_name = [asset.symbol for asset in assets]
    

    if(len(selected_ticket_names) <= 1):
        for stock in ["TSLA", "ABNB", "AMD"]:
            if(stock not in selected_ticket_names):
                selected_ticket_names.append(stock)
    
    selected_ticket_data = get_stock_data_multiple(selected_ticket_names)

    assets_data = get_stock_data_multiple(assets_name)
    player_selected = db.query(Player).filter(Player.id == player_id).one_or_none()

    user_selected = db.query(Users).filter(Users.id == player_selected.user_id).one_or_none()

    # Calculate the papel asset worth
    papel_asset_worth = 0
    for asset in assets:
        stock_price = assets_data[asset.symbol]['Close']
        papel_asset_worth += stock_price * asset.count

    print("assets", assets)
    return {
        'stocks_names': assets_name,
        'bookmarks_names': selected_ticket_names,
        "bookmarks": selected_ticket_data,
        "stocks": assets_data,
        'papel_asset_worth': papel_asset_worth,
        'user_cash': player_selected.cash,
        'user_total_worth': player_selected.cash + papel_asset_worth,
        'player_id': player_id.id,
        'competition_id': player_selected.competition_id,
        'user_id': user_selected.id,
        'user_name': user_selected.name,
        'user_email': user_selected.email
    }
```


Now once it has been deployed, my guess:

1. Create the api for logging in.
   1. This could be just a verification of the email and password.
   2. It would return the player_id. {As well as the whole data for the day report.}
   3. There should be a log off button to log off.
2. Or choose to use the demo player.
3. Also create the API for resetting
4. As well as logging in and etc.
5. Signing Up
   1. Ability to register new emails
   2. By default joints you to the recommended competition.
   3. Ass well as a pass code


## 16 Sat

- [x] 16.1 Create the API for logging in


### 16.1 Create the API for logging in.

 1. [x] This could be just a verification of the email and password.
 2. [x] It would return the player_id. {As well as the whole data for the day report.}
 3. [ ] There should be a log off button to log off.

Had some errors, but it was because of the wrong input 

- SO tried using cypher to check, and that was it!

```py

def caesar_cipher(text: str, shift: int = 3) -> str:
    """Caesar cipher implementation.

    Args:
        text (str): text to be encrypted
        shift (int, optional): shift amount. Defaults to 3.

    Returns:
        str: encrypted text
    """
    cipher = ""
    for char in text:
        char_code = ord(char)
        shifted_char_code = (char_code + shift) % 128
        cipher += chr(shifted_char_code)
    return cipher

def get_hashed_password(password: str) -> str:
    return caesar_cipher(password)


def verify_password(password: str, hashed_pass: str) -> bool:
    print("comparing", caesar_cipher(password), hashed_pass)
    return caesar_cipher(password) == hashed_pass
```


Now with the actual correct passwd + registration logic:


```py
import re
from bcrypt import checkpw, gensalt, hashpw
from pydantic import BaseModel
from pyparsing import Optional
import uvicorn
from fastapi import FastAPI, Depends, File, UploadFile, Path, status, BackgroundTasks, HTTPException

from passlib.context import CryptContext
# from http.client import HTTPException
from fastapi.encoders import jsonable_encoder
from fastapi.middleware.cors import CORSMiddleware
from database import SessionLocal, engine
import models
import os, json
from dotenv import load_dotenv
from routes import utils, api

import models

from sqlalchemy.ext.declarative import declarative_base
from fastapi.openapi.docs import get_swagger_ui_html
from models import Users

import re

def validateEmail(email: str):
    """Returns True if the email is valid, False otherwise.

    Args:
        email (str): email string

    Returns:
        bool: Whether the email is valid or not
    """
    if len(email) > 3:
        if re.match(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$", email) is not None:
            return True
    return False

db = SessionLocal()




load_dotenv()

dotusername = os.getenv("USER")

app = FastAPI(
    docs_url=None,
    title="DD API",
    description='Bla description',
    )

app.include_router(models.playerRoutes)
app.include_router(models.userRoutes)
app.include_router(models.assetRoutes)
app.include_router(models.competitionRoutes)
app.include_router(models.transactionRoutes)

app.include_router(api.router)







@app.get("/docs", include_in_schema=False)
async def swagger_ui_html():
    return get_swagger_ui_html(
        openapi_url="/openapi.json",
        title="DD API",
    )

Base = declarative_base()

def get_db():
    session = SessionLocal()
    try:
        yield session
        session.commit()
    finally:
        session.close()


origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(utils.router)

models.Base.metadata.create_all(bind=engine)

@app.get("/")
def index():
    return { "message": "hello world This is the Another update version"}

if __name__ == "__main__":
    uvicorn.run(app, port=8080, host='0.0.0.0')



# pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

# def hash_password(password: str):
#     return pwd_context.hash(password)


password_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def get_hashed_password(password: str) -> str:
    return password_context.hash(password)


def verify_password(password: str, hashed_pass: str) -> bool:
    return password_context.verify(password, hashed_pass)



class UserLoginFormat(BaseModel):
    email: str
    password: str

class UserSignUpFormat(BaseModel):
    email: str
    password: str
    name: str
    competition_id: str = ""

@app.delete("/delete_user")
async def delete_user(user_email: str):
    """Using example:
    """

    user = db.query(Users).filter(Users.email == user_email).first()
    if user is None:
        raise HTTPException(status_code=400, detail="Invalid email")
    
    # Remove all players with that user_id
    count_players_deleted = db.query(models.Player).filter(models.Player.user_id == user.id).delete()

    # Now delete the user.
    db.delete(user)
    db.commit()
    return { "detail": "User deleted successfully", "count_players_deleted": count_players_deleted, "user": user.__dict__}


@app.post("/signup")
async def signup(user: UserSignUpFormat):
    """Using example:
    {
    "email": "wangnelson4@gmail.com",
    "password": "test1234",
    "name": "Nelson the Tester",
    "competition_id": ""
    }
    """
    # hashed_password = hashpw(user.password.encode('utf-8'), gensalt()).decode('utf-8')
    hashed_password = get_hashed_password(user.password)
    # new_user = user.copy(update={"password": hashed_password})
    if(validateEmail(email=user.email) == False):
        raise HTTPException(status_code=400, detail="Invalid email")
    
    new_user = Users(
        email=user.email,
        password=hashed_password,
        name=user.name,
    )

    # if email already exists then throw error
    if db.query(Users).filter(Users.email == user.email).first() is not None:
        raise HTTPException(status_code=400, detail="Email already exists")
    
    competition_join = "7bc69deb-b1b4-4d45-aab1-43ce2d9caf8b"
    if user.competition_id == "":
        user.competition_id = competition_join

    # If competition doesnt exist then throw error
    competition = db.query(models.Competitions).filter(models.Competitions.id == user.competition_id).first()
    if competition is None:
        raise HTTPException(status_code=400, detail=f"Invalid competition_id {user.competition_id}")

    new_user.default_competition_id = user.competition_id   

    
    # test verify method
    # if not pwd_context.verify(user.password, hashed_password):
    if not verify_password(user.password, hashed_password):
        raise HTTPException(status_code=400, detail="Invalid password")

    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    

    new_player = models.Player(
        user_id=new_user.id,
        competition_id=user.competition_id,
    )


    db.add(new_player)
    db.commit()

    db.refresh(new_player)
    db.refresh(new_user)
    

    return { "detail": "User created successfully",
            "user": new_user.__dict__,
             "player": new_player.__dict__ }

@app.post("/login")
async def login(user_entry: UserLoginFormat):
    user_db = db.query(Users).filter(Users.email == user_entry.email).first()
    
    if user_db is None:
        raise HTTPException(status_code=400, detail="Invalid email")
    
#    if not checkpw(user_db.password.encode('utf-8'), user_db.password.encode('utf-8')):
    if not verify_password(user_entry.password, user_db.password):
        raise HTTPException(status_code=400, detail="Invalid password")
    return user_db.__dict__


@app.get('/unprotected')
def unprotected():
    return { 'hello': 'world' }


```

### return the player_id. {As well as the whole data for the day report.}


- My guess is to just return the whole data for the day report if flagged.

```py 
@app.post("/login")
async def login(user_entry: UserLoginFormat, report_on_sucess: bool = True):
    user_db = db.query(Users).filter(Users.email == user_entry.email).first()
    
    if user_db is None:
        raise HTTPException(status_code=400, detail="Invalid email")
    if not verify_password(user_entry.password, user_db.password):
        raise HTTPException(status_code=400, detail="Invalid password")

    if(report_on_sucess == True):
        default_competition_id = user_db.default_competition_id
        default_player_id = db.query(models.Player).filter(models.Player.user_id == user_db.id, models.Player.competition_id == default_competition_id).first().id
        return await api.get_user_report(
            player_id=default_player_id,
            selected_ticket_names=constants.BEGINNER_TICKET_LIST
        )

    return user_db.__dict__


```

## 17 Sun

### 17.todo

- [x] 17.1 Fixing retrieval of the current user data.

### Fixing Log int he current

### There should be a log off button to log off.

This is actually something more to be done from the front end whereas:

- [x] The front end should have a log off button.
  - [x] It should take you towards the welcome page.

Makes sense to have a login method that:

- rejects whenever 

- [x] Log off button should also delete the guid and user_data in local_storage.
- [x] Create a demo log in option.
- [x] Crate another Demo Log int to make sure you can also log from a different account
  - [x] BUt this time it should be using an specific password etc to retrieve the player id and etc.


- [x] The front end should have a log in button.



Is this because of:

```dart

db.loadData();
db.syncData();

```

## 18 Mon

### 18.todo

- [x] 18.1 Re Designing a LTS General Documentation Strategy
- [ ] 18.2 Fixing and implementing the `Salaryman's survival guide`


### 18.1 Re Designing a LTS General Documentation Strategy


Which makes it not working right.****

**Documenting**

Some stuff is important to be docuented and have specific projects on them.

At for the current decision is to have all the documentation inside of the `design-docs => Docusaurus.`

### General re-design of algo docs..

- [ ] Having parts of the CV there including GPA etc.
- [ ] Having the projects there.
- [ ] The site could be in the `wangnelson.xyz` main page.


### Project Walkthroughts

- This can be things like Angular, Flutter, React Projects etc.
- Devpost Competitions.
- The idea of walkthroughts is to have a documentation 
- As for plans and the like, having a `Salary man survival guide` would be rather cool in my opinion.

I think it would be rather to focuson developer notes

**Features to Have**

- [ ] Code Documentation Explainaition on the hard things.
- [ ] Link to Github
- [ ] Link to live Demo.
- [ ] Gif recordings of the front end and etc.
- [ ] Youtube video of the project.
- [ ] Template code from that code for the future to be re-utilized


**Projects to document from the past**

- [ ] Maid CLI
- [ ] E-Commerce Website


### Algorithms Documentation



### Cybersecurity

It makes sense to 


### 18.2 Fixing and implementing the `Salaryman's survival guide`


- [ ] Fixing The Image


```
${projectRoot}/docs/.vuepress/public/img
```


![](./../.vuepress/public/img/2023-09-18-12-43-37.png)



### 18.3 Meeting Room

- The idea of the journal is to also be shareable so no shady stuff here please!
- Creates environment
- And comes in place, 
- Minimize the risk factor 
- Visual Processing and the great dizzziness
- Shows that perfect simulation while they are performing 


- Payments to connect up with companies, let those folks pay for the platform.
- Forage virtual internships -> Lulu lemon.
  - Turn in the tasks and get paid.
  - Providing the Analyzis and the company and the ideal hould have in terms of skillsets and virtual work experiences. 


- [ ] I like the idea of sending the what to do and develop strategy.
- [ ] School lessons 
- [ ] Data points and watching someones over time.
- [ ] The environment
  - [ ] What it looks under certain what the job roles are. Kind 
  - [ ] Perform according to those roles and engage through the metrics.
  - [ ] With the culture and the like, have the custom as well. Customer Discovery in the interviews to find the cultures in that place.
  - [ ] Quantify that aspect.
- [ ] -> That could trigger to Facebook buyup.


### 18.4 Reset Portfolio Option.

### 18.5 Buying 0 to 1 update.

- [ ] Venture well put student.
- [ ] Test if you can quickly update the stock lists




Planning to go to this from the next month.

### Random Offline for maid for acceleration

```js
randomOffline = false
getYoungest = async (potential_questions, { limit = 3, account_id = 1, debug = false, randomOffline = false } = {}) => {
}

        potential_questions = await this.getYoungest(potential_questions, { limit: 2, randomOffline: true });
```


Like this is literally bad

```json
[
  {
    "price_average": 149.12,
    "symbol": "JPM",
    "count": 2,
    "updated_time": "2023-09-18T21:13:32.380819",
    "player_id": "92cb1815-bbc7-47aa-aba4-4788425b0524",
    "id": "fbe2136b-ab07-49b8-b1d5-8b24f873ebed",
    "created_time": "2023-09-17T14:50:40.089467",
    "estimated_profit": 0.3100000000000023
  },
  {
    "price_average": 177.97,
    "symbol": "AAPL",
    "count": 1,
    "updated_time": "2023-09-18T21:18:27.730452",
    "player_id": "92cb1815-bbc7-47aa-aba4-4788425b0524",
    "id": "c1dca151-2881-490d-8c78-3f334e516fff",
    "created_time": "2023-09-17T14:34:06.384441",
    "estimated_profit": 5.920000000000016
  },
  {
    "price_average": 329.06,
    "symbol": "MSFT",
    "count": 1,
    "updated_time": "2023-09-18T22:39:22.980889",
    "player_id": "92cb1815-bbc7-47aa-aba4-4788425b0524",
    "id": "6f2a0434-d2f5-4f1b-a7a0-db5e4d8dd81e",
    "created_time": "2023-09-18T21:15:34.560221",
    "estimated_profit": 0
  }
]
```


It should instead be instead the calculation included with the current price, total invested and other while basic, required data.




![](./../.vuepress/public/img/2023-09-19-12-17-27.png)

Credentials for all protected

```
{
    developer
    Dev123
}
```



Here some goals:

- [Python Snake Game](https://www.youtube.com/watch?v=L8ypSXwyBds) 
- [Mario AI Simulations](https://www.youtube.com/watch?v=2eeYqJ0uBKE)
- [Self Driving](https://www.youtube.com/watch?v=Cy155O5R1Oo)
- [Python Ping Poing Tutorial](https://www.youtube.com/watch?v=2f6TmKm7yx0) 
- [Python Chess](https://www.youtube.com/watch?v=ffzvhe97J4Q)


## 22 Fri

### 22.todo

- [ ] 22.1 Making a better decision in where I want to go i life

### 22.1 Making a better decision in where I want to go i life

**Path 1: Continue as Software**

- Continue learning no end
- Just focusing on algorithms 

**Path 2: Becoming a Logistics guy**

- Then you should
  - [x] Continuous Practice of algorithms
    - [x] The DSA CLI is a great integration
  - [x] Is important to master the tools of:
    - [x] Documentation
    - [x] Self Tools Developments. ( I think is good enough )
  - [ ] Slight chance for AI and understanding of algorithms to be in your favor
  - [ ] Data Science
    - [ ] Drill down into Market Analysis is important. => Udemy Course to be checked
    - [ ] Drill down into Data Science is important. => Udemy Course to be checked on Parallel
  - [ ] It would be complementary to understand Factorio and other factory like games.
  - [ ] Social
    - [ ] Getting Buffed up => Required


**Data Science**

- Practice Kaggle on the Daily?
- Working up simulations also on the daily? Using Pygame I mean? WIll that be any use?
  - Just get right the idea 
- 



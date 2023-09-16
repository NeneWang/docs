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

![](./../../img/2023-09-15-08-35-21.png) 

Now we need to match the integer

![](./../../img/2023-09-15-10-06-55.png)


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
2. Or choose to use the demo player.
3. Also create the API for resetting
4. As well as logging in and etc.










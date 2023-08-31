---
title: August
---



### 30.todo

- [x]  30.1 Deciding to document things
- [x]  30.2 Installing WikiMedia
- [x]  30.3 Changing Wiki Medias Icons.
- [ ]  30.4 Setting up the Algorithmic registrations of things done from the API.
- [ ]  30.4 Deleting a certain server or merging them together (ecommerce ctp.)


### 30.1 Deciding to document things

Getting all started again with documentation.

Here the things I want to get started on documentation:

- Algorithms. 

Automatic documentation for Clozing. and comments and suggestions from the creaion of them.

ITs beeen more than a month since I stopped documenting, I wonder if I can get started agian with all the documentation I want to have.


So what were my summer projects that I wanted to do?

Right, I believe this might be because I started working on these apps.  And just trainning my algorithmic thinking. 


So here the Wikis I would be doing with X framework:


| domain            | Framework  | About               |
| ----------------- | ---------- | ------------------- |
| wiki.anviltech    | Wikimedia  | Marketing and UX/UI |
| code.wangnelson   | Vuepress   | Templates and Code. |
| design.wangnelson | Docusaurus | Algo + Design  + AI      |


Meta: 
1. wiki.anviltech: The idea is to register the techniques used in Marketing and UI/UX. I believe organization planning and culture management should have it's own section, which would make sense. But the problem is that is not something you want to specifically show a hiring manager But it would make sense on the way as it is also the marketing and PR of a company depends much of the organization values and the like.
2. code.wangnelson: This is more of a personal place where I can store both the projects I have done, link them with the Notion api to have all the assets and explaination and blogs of my personal projects.
3. design.wangnelson This is more to show of your research into the improvements of computer Science.


### 30.2  Installing WikiMedia

Now lets install wikimedia on the so wanted page. The installed wikimedia shouldbe there but lets see, because you might have to switch the pointer.

- The problem is with the links, whereas the links desnt seem to be working for transference
- While it says 

So I have no other way than to install it on the wngnelson.xyz folder

Admin Account
```
WikiSysop
wikinel448
```

site Config

```
WikiName
admin@wiki.wangnelson.xyz
```


```
wangnelson2@gmail.com
wangnelson2
AnvilTech448!
```


### 31

### 31.todo

- [ ] 31.1 Showing a list of top 10 stocks 

### 31.1 Showing a list of top 10 stocks

The idea is after the multi, also get the listing of the top 10. And by memory cache it.


- [ ] Fix the storage into a map instead of a list.

```dart
Map<String, dynamic> showStockList = {}; //The stocks being shown in the watchlist
```

Whereas you want to save it there.

```dart
    print("checking the first 10 out of " + ticketNames.length.toString());
    final stocksToLookup = ticketNames.sublist(0, 10);
    print("Researching multiple:");
    print(stocksToLookup);
    showStockData = await researchMultiple(stocksToLookup);
  }
```

And now what we want to isshow it on the screen after logging them.

For that we need to await the population first:

```dart
  Future populateAllStocksScreenData() async {
    // get the top 10 stocks from ticket names and request api to include their data on them.

    if (_myBox.get("ticketNames") == null ||
        _myBox.get("ticketNames").isEmpty) {
      await getStockNames();
    } else {
      ticketNames = _myBox.get("ticketNames");
    }
    print("checking the first 10 out of " + ticketNames.length.toString());
    final stocksToLookup = ticketNames.sublist(0, 10);
    print("Researching multiple:");
    print(stocksToLookup);
    showStockData = await researchMultiple(stocksToLookup);
    return;
  }
```


> So I am converting it inot a future method.

The weird thing is that it requries a specific format but am I even respecting that on watchlist?

```dart
List<Map<String, dynamic>> convertToListingFormat(
    Map<String, Map<String, dynamic>> inputMap) {
  List<Map<String, dynamic>> outputList = [];
```

It seems that it was actually the hardcoded thats why. But now I chnged it

```dart
List<Map<String, dynamic>> convertToListingFormat(

```

With that we have:


```dart
  Future<List<Map<String, dynamic>>> getShowStockAsList() async {
    if (showStockData.isEmpty) {
      await populateAllStocksScreenData();
    }
    return convertToListingFormat(showStockData);
  }
```

Which now shoulkd be used as following:







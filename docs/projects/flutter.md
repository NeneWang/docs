---
title: Flutter
---

## Flutter Meals

This version I am having different cards, whereas you can highlight them. What I want to have it is as a cards sharing tool. Whereas I can send her multiple cards of things she can do.

And then on a button click I just tell her dont to randomly click it, or the purpose is lost. I just trust her on having the cards there unlocking other cards.

https://github.com/NeneWang/cards

- Animations
  - Sliding up categories
  - Heart Movement upon Clicking
- Cards
- Hero Animation



**Categories Sliding Up**

```dart
builder: (ctx, child) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        )),
        child: child,
      ),

```

**Expanding Heart Icon**

```dart 
IconButton(
onPressed: () {
    final wasAdded = ref
        .read(favoriteMealsProvider.notifier)
        .toggleMealFavoriteStatus(meal);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(
            wasAdded ? 'Meal added as a favorite.' : 'Meal removed.'),
    ),
    );
},
icon: AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    transitionBuilder: (child, animation) => ScaleTransition(
    scale: animation,
    child: child,
    ),
    child: Icon(
    isFavorite ? Icons.favorite : Icons.favorite_border,
    key: ValueKey(isFavorite),
    ),
)),
```

**Hero Animation**

To setup Hero Animation
- You have to wrap both the source and destination with a Hero Widget

Here the Destination:

```dart
Hero(
tag: meal.id,
child:
    Image.network(
    meal.imageUrl,
    height: 300,
    width: double.infinity,
    fit: BoxFit.cover,
    )
),
```

And the Source

```dart
  Hero(
    tag: meal.id,
    child: FadeInImage(
        placeholder: MemoryImage(kTransparentImage),
        image: NetworkImage(meal.imageUrl),
        fit: BoxFit.cover,
        height: 200,
        width: double.infinity,
    )),
```





### Without Fancy Animations

https://github.com/NeneWang/cards/releases/tag/v0.1

- Here is the code before animations.
- You can run it on android etc.



## Grocery List

https://github.com/NeneWang/shopping_list/releases/tag/v0.0

- List Builder
- Validation Text Inptus


**Validation Text Inputs**

Having Text Form Fields and Validators:

```dart
TextFormField(
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  },
  decoration: const InputDecoration(
    labelText: 'Name',
  ),
),
```


And creating list of nicely formatted boxes:

```dart
body: ListView.builder(
  itemCount: groceryItems.length,
  itemBuilder: (context, index) {
    final item = groceryItems[index];
    return ListTile(
      title: Text(item.name),
      leading: Container(
        width: 24,
        height: 24,
        color: item.category.color,
      ),
      subtitle: Text(item.category.name),
      trailing: Text(item.quantity.toString()),
    );
  },
),
```


Which is similar for Numbers but we add an int try parse here.

```dart
child: TextFormField(
  validator: (value) {
    if (value == null ||
        value.isEmpty ||
        int.tryParse(value) == null ||
        value.trim().isEmpty) {
      return 'Please enter a name';
    }
    return null;
},
)

```

1. To make sure it validates
2. Adding the Form Key

```dart
  final _formKey = GlobalKey<FormState>();

  void _saveItem() {
    if (_formKey.currentState!.validate()) {}
  }
```


Which is useful for reating resets such as here:

```dart

TextButton(
    onPressed: () {
      _formKey.currentState!.reset();
    },
    child: const Text('Reset')),
    
```



**Adding an Item on a new page:**

```dart

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }
```

Adding Items from the New Item Page:

```dart
  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("_enteredName");
      print(
          "entered_name: ${_enteredName}  quantity: ${_enteredQuantity} | Selected category: ${_selectedCategory!.name}");
      // Navigator.of(context).pop();
      Navigator.of(context).pop(GroceryItem(
          id: DateTime.now().toString(),
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory!));
    }
  }
```


**Swipeable Deletions**

```dart

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items yet'),
    );

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) => {
            _removeItem(_groceryItems[index]),
          },
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
              title: Text(_groceryItems[index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: _groceryItems[index].category.color,
              ),
              trailing: Text(_groceryItems[index].quantity.toString())),
        ),
      );
    }
```

### Grocery List with Firebase


**Adding HTTP**

```
flutter pub add http
```

```dart

import 'package:http/http.dart' as http;


... Whenever you want to add somehting to Firebase...

http.post(
          Uri.parse(
              'https://descartable-server-default-rtdb.firebaseio.com/grocery_items.json'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'name': _enteredName,
            'quantity': _enteredQuantity,
            'category': _selectedCategory!.name,
          }));


```

- Dont need to even create the table.


![](./../../img/2023-07-17-10-50-19.png)









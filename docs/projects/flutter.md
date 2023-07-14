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



Categories Sliding Up

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

Expanding Heart Icon

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

Hero Animation

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











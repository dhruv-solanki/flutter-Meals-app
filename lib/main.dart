import 'package:flutter/material.dart';
import 'package:recipe_app/models/Meal.dart';
import 'package:recipe_app/models/MealsData.dart';

import 'package:recipe_app/screens/CategoryMealsScreen.dart';
import 'package:recipe_app/screens/FilterScreen.dart';
import 'package:recipe_app/screens/MealDetailsScreen.dart';
import 'package:recipe_app/screens/TabsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filteredData) {
    setState(() {
      _filters = filteredData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals App",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.orangeAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline1: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          )
        )
      ),
//      home: MyHomePage(),
      routes: {
        '/': (context) => TabsScreen(favMeals: _favoriteMeals,),
        CategoryMealsScreen.routeId: (context) => CategoryMealsScreen(
          availableMeals: _availableMeals,
        ),
        MealDetailsScreen.routeId: (context) => MealDetailsScreen(
          toggleFavorite: _toggleFavorite,
          isFavorite: _isMealFavorite,
        ),
        FilterScreen.routeId: (context) => FilterScreen(
          currentFilters: _filters,
          saveData: _setFilters,
        ),
      },
    );
  }
}
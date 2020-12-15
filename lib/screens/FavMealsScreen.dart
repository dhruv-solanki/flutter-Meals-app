import 'package:flutter/material.dart';
import 'package:recipe_app/models/Meal.dart';
import 'package:recipe_app/widgets/MealCard.dart';

class FavMealsScreen extends StatefulWidget {
  FavMealsScreen({this.favoriteMeals});
  final List<Meal> favoriteMeals;

  @override
  _FavMealsScreenState createState() => _FavMealsScreenState();
}

class _FavMealsScreenState extends State<FavMealsScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet!'),
      );
    } else {
      return ListView.builder(
        itemCount: widget.favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealCard(
            meal: widget.favoriteMeals[index],
          );
        },
      );
    }
  }
}

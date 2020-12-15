import 'package:flutter/material.dart';
import 'package:recipe_app/models/Meal.dart';

import 'package:recipe_app/widgets/MealCard.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeId = 'CategoryMealsScreen';

  CategoryMealsScreen({this.availableMeals});
  final List<Meal> availableMeals;

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List categoryMeals;
  String categoryTitle;

  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if(!_loadedInitData) {
      final args = ModalRoute.of(context).settings.arguments as Map;
      categoryTitle = args['title'];
      final categoryId = args['id'];

      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      _loadedInitData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealCard(
            meal: categoryMeals[index],
          );
        },
      )
    );
  }
}

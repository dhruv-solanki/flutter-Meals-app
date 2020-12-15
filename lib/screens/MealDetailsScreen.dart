import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/MealsData.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String routeId = 'MealDetailsScreen';

  MealDetailsScreen({this.toggleFavorite, this.isFavorite});
  final Function toggleFavorite;
  final Function isFavorite;

  Widget buildTitle(context, text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer(mediaQuery, child) {
    return Container(
      height: mediaQuery.size.height * 0.38,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildTitle(context, 'Ingredients'),
              buildContainer(
                mediaQuery,
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
                ),
              ),
              buildTitle(context, 'Steps'),
              buildContainer(
                mediaQuery,
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) => Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index+1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          (isFavorite(mealId)) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          toggleFavorite(mealId);
        },
      ),
    );
  }
}

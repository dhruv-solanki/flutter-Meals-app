import 'package:flutter/material.dart';
import 'package:recipe_app/screens/CategoryMealsScreen.dart';

class CategoryCard extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryCard({this.id, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,
          CategoryMealsScreen.routeId,
          arguments: {
            'id': id,
            'title': title,
          }
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/models/Meal.dart';
import 'package:recipe_app/Constants.dart';
import 'package:recipe_app/screens/MealDetailsScreen.dart';

class MealCard extends StatelessWidget {
  MealCard({this.meal});
  final Meal meal;

  String get complexityText {
    switch(meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;

      case Complexity.Hard:
        return 'Hard';
        break;

      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch(meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Pricey:
        return 'Pricey';
        break;

      case Affordability.Luxurious:
        return 'Expensive';
        break;

      default:
        return 'Unknown';
    }
  }

  void selectMeal(context) {
    Navigator.pushNamed(context,
      MealDetailsScreen.routeId,
      arguments: meal.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      splashColor: Colors.black45,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      color: Colors.black45,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: kMealTitle,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconText(
                    icon: Icons.schedule,
                    text: '${meal.duration} min',
                  ),
                  IconText(
                    icon: Icons.work,
                    text: complexityText,
                  ),
                  IconText(
                    icon: Icons.monetization_on,
                    text: affordabilityText,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IconText extends StatelessWidget {
  IconText({this.icon, this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(width: 2,),
        Text(text),
      ],
    );
  }
}

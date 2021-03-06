import 'package:flutter/material.dart';

import 'package:recipe_app/models/CategoryData.dart';
import 'package:recipe_app/widgets/CategoryCard.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20.0),
      children: CATEGORIES.map((catData) => CategoryCard(
        id: catData.id,
        title: catData.title,
        color: catData.color,
      )).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}

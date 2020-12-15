import 'package:flutter/material.dart';
import 'package:recipe_app/Constants.dart';
import 'package:recipe_app/screens/FilterScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: kDrawerListStyle,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: kDrawerTitleStyle,
            ),
          ),
          SizedBox(height: 20,),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.pushReplacementNamed(context, FilterScreen.routeId);
            },
          )
        ],
      ),
    );
  }
}

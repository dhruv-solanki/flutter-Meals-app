import 'package:flutter/material.dart';
import 'package:recipe_app/models/Meal.dart';
import 'package:recipe_app/screens/CategoriesScreen.dart';
import 'package:recipe_app/screens/FavMealsScreen.dart';
import 'package:recipe_app/widgets/MainDrawer.dart';

class TabsScreen extends StatefulWidget {
  static const String id = 'TabsScreen';

  TabsScreen({this.favMeals});
  final List<Meal> favMeals;

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  initState() {
    super.initState();
    _pages = [
      {
        'title': 'Categories',
        'page': CategoriesScreen(),
      },
      {
        'title': 'Your Favorites',
        'page': FavMealsScreen(favoriteMeals: widget.favMeals,),
      },
    ];
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorite'),
          ),
        ],
      ),
    );
  }
}

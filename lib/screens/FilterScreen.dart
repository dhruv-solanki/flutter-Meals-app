import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/MainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeId = 'FilterScreen';

  FilterScreen({this.currentFilters, this.saveData});
  final Function saveData;
  final Map<String, bool> currentFilters;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  initState() {
    super.initState();
    var currentFilter = widget.currentFilters;
    _glutenFree = currentFilter['gluten'];
    _lactoseFree = currentFilter['lactose'];
    _vegetarian = currentFilter['vegetarian'];
    _vegan = currentFilter['vegan'];
  }

  Widget _buildSwitchListTile(String title, String subTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subTitle),
      onChanged: updateValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final filters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveData(filters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'Only include lactose-free meals',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}

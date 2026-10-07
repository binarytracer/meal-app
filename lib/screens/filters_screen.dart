import 'package:material_ui/material_ui.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = true;
  bool _vegetarian = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'meals') {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
          }
        },
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Gluten-free'),
            subtitle: const Text('Only include gluten-free meals'),
            value: _glutenFree,
            onChanged: (isChecked) {
              setState(() {
                _glutenFree = isChecked;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Lactose-free'),
            subtitle: const Text('Only include lactose-free meals'),
            value: _lactoseFree,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFree = isChecked;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Vegan'),
            subtitle: const Text('Only include vegan meals'),
            value: _vegan,
            onChanged: (isChecked) {
              setState(() {
                _vegan = isChecked;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Vegetarian'),
            subtitle: const Text('Only include vegetarian meals'),
            value: _vegetarian,
            onChanged: (isChecked) {
              setState(() {
                _vegetarian = isChecked;
              });
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var selectedIndex = 0;

  void _selectScreen(int index) {
    setState(() => selectedIndex = index);
  }

  void _selectDrawerScreen(String identifier) {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute<void>(builder: (ctx) => const FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFavoritesTab = selectedIndex == 1;

    final filteredMeals = ref.watch(filteredMealsProvider);

    final Widget activePage = isFavoritesTab
        ? MealsScreen(meals: filteredMeals)
        : CategoriesScreen(meals: filteredMeals);

    final activePageTitle = isFavoritesTab ? 'Favorites' : 'Categories';

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      drawer: MainDrawer(onSelectScreen: _selectDrawerScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _selectScreen(index),
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}

import 'package:material_ui/material_ui.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var selectedIndex = 0;
  var favoriteMeals = <Meal>[];

  void _toggleMealFavoriteStatus(Meal meal) {
    setState(() {
      final isExisting = favoriteMeals.contains(meal);

      if (isExisting) {
        favoriteMeals.remove(meal);
        _showFavoriteMessage('Removed from favorites');
      } else {
        favoriteMeals.add(meal);
        _showFavoriteMessage('Added to favorites');
      }
    });
  }

  void _showFavoriteMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _selectScreen(int index) {
    setState(() => selectedIndex = index);
  }

  void _selectDrawerScreen(String identifier) {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFavoritesTab = selectedIndex == 1;
    final Widget activePage = isFavoritesTab
        ? MealsScreen(
            meals: favoriteMeals,
            onToggleFavorite: _toggleMealFavoriteStatus,
          )
        : CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus);
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

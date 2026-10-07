import 'package:material_ui/material_ui.dart';
import 'package:meal_app/data/category_data.dart';
import 'package:meal_app/data/meal_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  final void Function(Meal) onToggleFavorite;
  const CategoriesScreen({super.key, required this.onToggleFavorite});

  void _onCategorySelected(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: dummyMeals
              .where((meal) => meal.categories.contains(category.id))
              .toList(),
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories
          .map(
            (category) => CategoryGridItem(
              category: category,
              onSelectCategory: () => _onCategorySelected(context, category),
            ),
          )
          .toList(),
    );
  }
}

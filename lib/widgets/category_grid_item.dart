import 'package:material_ui/material_ui.dart';
import 'package:meal_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;

  const CategoryGridItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Implement navigation to category meals screen
      },
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: category.color,
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.55),
              category.color.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          // borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

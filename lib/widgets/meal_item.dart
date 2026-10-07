import 'package:material_ui/material_ui.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_detail.dart';
import 'package:meal_app/widgets/meal_image_fallback.dart';
import 'package:meal_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final void Function(Meal) onToggleFavorite;
  const MealItem({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  String get complexityLabel {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityLabel {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) =>
                  MealDetail(meal: meal, onToggleFavorite: onToggleFavorite),
            ),
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              imageErrorBuilder: (context, error, stackTrace) =>
                  const MealImageFallback(),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MealItemTrait(
                      icon: Icons.schedule,
                      label: '${meal.duration}min',
                    ),
                    const SizedBox(width: 12),
                    MealItemTrait(icon: Icons.work, label: complexityLabel),
                    const SizedBox(width: 12),
                    MealItemTrait(
                      icon: Icons.attach_money,
                      label: affordabilityLabel,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

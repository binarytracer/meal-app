import 'package:material_ui/material_ui.dart';

/// Shown in place of a meal photo that failed to load (offline, 404, ...).
class MealImageFallback extends StatelessWidget {
  const MealImageFallback({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Center(
        child: Icon(
          Icons.broken_image_outlined,
          size: 48,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

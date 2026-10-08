import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/data/meal_data.dart';
import 'package:meal_app/providers/favorites_provider.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
    addTearDown(container.dispose);
  });

  group('favoritesProvider', () {
    test('starts empty', () {
      expect(container.read(favoritesProvider), isEmpty);
    });

    test('toggling a meal adds it and returns true', () {
      final meal = dummyMeals.first;

      final added = container
          .read(favoritesProvider.notifier)
          .toggleMealFavoriteStatus(meal);

      expect(added, isTrue);
      expect(container.read(favoritesProvider), [meal]);
    });

    test('toggling a favorite again removes it and returns false', () {
      final meal = dummyMeals.first;
      final notifier = container.read(favoritesProvider.notifier)
        ..toggleMealFavoriteStatus(meal);

      final added = notifier.toggleMealFavoriteStatus(meal);

      expect(added, isFalse);
      expect(container.read(favoritesProvider), isEmpty);
    });

    test('removing one favorite keeps the others', () {
      final first = dummyMeals[0];
      final second = dummyMeals[1];
      container.read(favoritesProvider.notifier)
        ..toggleMealFavoriteStatus(first)
        ..toggleMealFavoriteStatus(second)
        ..toggleMealFavoriteStatus(first);

      expect(container.read(favoritesProvider), [second]);
    });

    test('replaces the list so listeners are notified', () {
      final seen = <int>[];
      container.listen(
        favoritesProvider,
        (previous, next) => seen.add(next.length),
      );

      container.read(favoritesProvider.notifier)
        ..toggleMealFavoriteStatus(dummyMeals[0])
        ..toggleMealFavoriteStatus(dummyMeals[1]);

      expect(seen, [1, 2]);
    });
  });
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/providers/filters_provider.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
    addTearDown(container.dispose);
  });

  group('filtersProvider', () {
    test('starts with every filter off', () {
      final filters = container.read(filtersProvider);

      expect(filters.keys, unorderedEquals(Filter.values));
      expect(filters.values, everyElement(isFalse));
    });

    test('setFilter turns one filter on and leaves the others alone', () {
      container.read(filtersProvider.notifier).setFilter(Filter.vegan, true);

      final filters = container.read(filtersProvider);
      expect(filters[Filter.vegan], isTrue);
      expect(filters[Filter.glutenFree], isFalse);
      expect(filters[Filter.lactoseFree], isFalse);
      expect(filters[Filter.vegetarian], isFalse);
    });

    test('setFilter can turn a filter back off', () {
      container.read(filtersProvider.notifier)
        ..setFilter(Filter.glutenFree, true)
        ..setFilter(Filter.glutenFree, false);

      expect(container.read(filtersProvider)[Filter.glutenFree], isFalse);
    });

    test('replaces the map so listeners are notified', () {
      final before = container.read(filtersProvider);
      var notified = 0;
      container.listen(filtersProvider, (previous, next) => notified++);

      container
          .read(filtersProvider.notifier)
          .setFilter(Filter.vegetarian, true);

      expect(notified, 1);
      expect(identical(container.read(filtersProvider), before), isFalse);
    });
  });
}

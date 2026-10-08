import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:meal_app/core/theme/app_theme.dart';
import 'package:meal_app/screens/tabs_screen.dart';

Widget _app() => ProviderScope(
  child: MaterialApp(theme: appTheme, home: const TabsScreen()),
);

void main() {
  testWidgets('TabsScreen shows the categories tab first', (tester) async {
    await tester.pumpWidget(_app());

    expect(find.text('Categories'), findsWidgets);
    expect(find.text('Italian'), findsOneWidget);
  });

  testWidgets('TabsScreen switches to the favorites tab', (tester) async {
    await tester.pumpWidget(_app());

    await tester.tap(find.text('Favorites'));
    await tester.pump();

    expect(find.text('No meals found.'), findsOneWidget);
  });
}

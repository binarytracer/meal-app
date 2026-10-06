import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/main.dart';

void main() {
  testWidgets('App renders home screen', (tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Meal App'), findsOneWidget);
  });
}

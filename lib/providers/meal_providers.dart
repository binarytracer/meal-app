import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

import '../data/meal_data.dart';

final mealsProvider = Provider<List<Meal>>((ref) {
  return dummyMeals;
});

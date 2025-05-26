
import 'meal.dart';

class MealResponse {
  final List<Meal> meals;

  MealResponse({required this.meals});

  factory MealResponse.fromJson(Map<String, dynamic> json) {
    return MealResponse(
      meals: (json['meals'] as List<dynamic>)
          .map((mealJson) => Meal.fromJson(mealJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meals': meals.map((meal) => meal.toJson()).toList(),
    };
  }
}

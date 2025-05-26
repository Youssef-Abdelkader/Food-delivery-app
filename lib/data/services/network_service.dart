
import 'package:day1ui/utils/api_end_point.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../models/CategoryResponse.dart';
import '../models/MealResponse.dart';
import '../models/meal.dart';



class MealsService{
  static final Dio dio = Dio(
    BaseOptions(baseUrl: "https://www.themealdb.com/api/json/v1/1/",
  connectTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 5),
    ))..interceptors.add(PrettyDioLogger());
   Future<CategoryResponse> getCategories() async {
    try {
      Response response = await dio.get("categories.php");

      if (response.statusCode == 200) {
      // print("in getCategories() service ${response.data}");
       // print("in getCategories() service ${CategoryResponse.fromJson(response.data)}");
        CategoryResponse categories = CategoryResponse.fromJson(response.data);
        return categories;
      } else {
       return CategoryResponse(categories: []);
      }
    } catch (e) {
      print("Error in getCategories(): $e");
      rethrow;
    }
  }
   Future<MealResponse> getMeals(String categoryName) async {
    try {
      Response response = await dio.get("filter.php", queryParameters: { "c": categoryName });
      if (response.statusCode == 200) {
      //  print("in getMeals() service ${response.data}");
        MealResponse mealResponse = MealResponse.fromJson(response.data);
        print("in getMeals() service ${mealResponse}");

        return mealResponse;
      } else {
        return MealResponse(meals: []);
      }
    } catch (e) {
      print("Error in getMeals(): $e");
      rethrow;
    }
  }
    Future<Meal> getMealDetails(String mealId) async {
    try {
      Response response = await dio.get("lookup.php", queryParameters: { "i": mealId });
      if (response.statusCode == 200) {
        Meal meal = Meal.fromJson(response.data['meals'][0]);
        print("in getMealDetails() service ${meal}");
        return meal;
      } else {
        return Meal(idMeal: "", userId: "");
      }
    } catch (e) {
      print("Error in getMealDetails(): $e");
      rethrow;
    }



   }
}

import '../DBHelper/dbhelper.dart';
import '../models/CategoryResponse.dart';
import '../models/MealResponse.dart';
import '../models/meal.dart';
import '../services/network_service.dart';

class Repo {
  MealsService newsService = MealsService();
  DataBaseHelper dbHelper = DataBaseHelper();

  Repo({required this.newsService, required this.dbHelper});

  Future<CategoryResponse> getCategories() async {
    try {
      CategoryResponse categories = await newsService.getCategories();
      return categories;
    } catch (e) {
      print("Error in getCategories(): $e");
      rethrow;
    }
  }

  Future<MealResponse> getMealsRemote(String categoryName) async {
    try {
      MealResponse mealResponse = await newsService.getMeals(categoryName);
      return mealResponse;
    } catch (e) {
      print("Error in getMeals(): $e");
      rethrow;
    }
  }

  Future<Meal> getMealDetails(String mealId) async {
    try {
      Meal meal = await newsService.getMealDetails(mealId);
      return meal;
    } catch (e) {
      print("Error in getMealDetails(): $e");
      rethrow;
    }
  }
  //localll

  Future<int> addMeal(Map<String, dynamic> mealData) async {
    try {
      int result = await dbHelper.addMeal(mealData);
      return result;
    } catch (e) {
      print("Error in addMeal(): $e");
      rethrow;
    }
  }
  Future<List<Map<String, dynamic>>> getMealsLocal() async {
    try {
      List<Map<String, dynamic>> meals = await dbHelper.getMeals();
      return meals;
    } catch (e) {
      print("Error in getMealsLocal(): $e");
      rethrow;
    }

    }
    Future<int> deleteMeal(String mealId) async {
      try {
        int result = await dbHelper.deleteMeal(mealId);
        return result;
      } catch (e) {
        print("Error in deleteMeal(): $e");
        rethrow;
      }
    }
    Future<int> insertUser(Map<String, dynamic> userData) async {
      try {
        int result = await dbHelper.insertUser(userData);
        return result;
      } catch (e) {
        print("Error in insertUser(): $e");
        rethrow;
      }
    }
    Future<List<Map<String, dynamic>>> getUsers() async {
      try {
        List<Map<String, dynamic>> users = await dbHelper.getUsers();
        return users;
      } catch (e) {
        print("Error in getUsers(): $e");
        rethrow;
      }
    }





}
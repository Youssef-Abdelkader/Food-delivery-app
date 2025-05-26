import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper{
  static Database? _database;
  Future<Database>get database async {
    if(_database !=null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'users.db'),
      version: 1,
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)',
          );
        await database.execute(
          'CREATE TABLE meals(idMeal TEXT PRIMARY KEY, strMeal TEXT, strMealThumb TEXT)',
        );
      },
    );
  }
  Future<int> insertUser(Map<String, dynamic> userData) async {
    final db = await database;
    return await db.insert('users', userData);
  }
  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query('users');
  }
  Future<int> addMeal(Map<String, dynamic> mealData) async {
    final db = await database;
    return await db.insert(
      "meals",
        <String, dynamic>{
          'idMeal': mealData['idMeal'],
          'strMeal': mealData['strMeal'],
          'strMealThumb': mealData['strMealThumb'],
        });
  }
  Future<List<Map<String, dynamic>>> getMeals() async {
    final db = await database;
    return await db.query('meals');
  }
  Future<int> deleteMeal(String mealId) async {
    final db = await database;
    return await db.delete('meals', where: 'idMeal = ?', whereArgs: [mealId]);
  }




}
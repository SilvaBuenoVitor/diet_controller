import 'dart:convert';
import 'package:diet_controller/presentation/meal/model/meal.dart';
import 'package:diet_controller/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class MealRepository {
  Future<List<Meal>> fetchMeal(int userId) async {
    final List<Meal> _listMeal = new List<Meal>();
    try {
      final response = await http.get(
        Api.meal+'/'+userId.toString(),
        headers: <String, String>{'Content-Type':'application/json; charset=UTF-8'},
      );
      final it = jsonDecode(utf8.decode(response.bodyBytes)).iterator;
      while(it.moveNext()){
        _listMeal.add(Meal.fromMap(it.current));
      }
      return _listMeal;
    } catch (e) {
      throw e;
    }
  }
}
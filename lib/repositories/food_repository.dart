import 'dart:convert';
import 'package:diet_controller/interface/food.dart';
import 'package:diet_controller/utils/api_constants.dart';
import 'package:http/http.dart' as http;


class FoodRepository{
  Future<List<Food>> fetchFood() async{
    final List<Food> _listFood = new List<Food>();
    try {
      final response = await http.get(
        Api.food+'/0',
        headers: <String, String>{'Content-Type':'application/json; charset=UTF-8'},
      );  
      final it = jsonDecode(response.body).iterator;
      while(it.moveNext()){
        _listFood.add(Food.fromJson(it.current));
      }
      return _listFood;
    } catch(e){
      throw e;
    }

  }

  Future<http.Response> saveFood(Food food) async{
    try
    {
      return http.post(
        Api.food+'/0',
        headers: <String, String>{'Content-Type':'application/json; charset=UTF-8'},
        body: jsonEncode(food.toJson())
      );
    } catch(e){
      throw e;
    }
  }
}
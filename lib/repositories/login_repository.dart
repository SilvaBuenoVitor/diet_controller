import 'dart:convert';
import 'package:diet_controller/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class LoginRepository{
  Future<http.Response> fetchLogin(String email, String password){
    return http.post(
      Api.user,
      headers: <String, String>{'Content-Type':'application/json; charset=UTF-8'},
      body: jsonEncode(<String, String>{
        'email':email,
        'password':password
      })
    );
  }
}
import 'dart:convert';
import 'package:diet_controller/presentation/login/model/login.dart';
import 'package:diet_controller/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class LoginRepository{

  Future<Login> fetchLogin(String email, String password) async{
    try {
      final response = await http.post(
        Api.user,
        headers: <String, String>{'Content-Type':'application/json; charset=UTF-8'},
        body: jsonEncode(<String, String>{
          'email':email,
          'password':password
        })
      );
      if(response.statusCode == 200){
        print(int.parse(jsonDecode(response.body).toString()));
        return Login.fromBody(response.body);
      }
      return Login(-1);
    } on Exception catch (e) {
          print(e);
          throw e;
    }
  }
}
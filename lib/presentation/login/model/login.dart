import 'dart:convert';

class Login {
  final int id;

  Login(this.id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Login(
      map['id'],
    );
  }

  static Login fromBody(String body){
    return Login(int.parse(jsonDecode(body).toString()));
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source));
}

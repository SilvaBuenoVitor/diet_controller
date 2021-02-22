import 'dart:convert';
import 'package:diet_controller/interface/food.dart';
import 'package:flutter/material.dart';

class Meal {
  final int id;
  final int userId;
  final TimeOfDay time;
  final String name;
  final List<Food> foods;
  
  Meal({
    this.id,
    this.userId,
    this.time,
    this.name,
    this.foods,
  });
  
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'time': time.hour.toString()+":"+time.minute.toString()+":00",
      'name': name,
      'foods': foods?.map((x) => x?.toJson())?.toList(),
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Meal(
      id: map['id'],
      userId: map['userId'],
      time: TimeOfDay.fromDateTime(DateTime.parse('2021-10-20 '+map['time'].toString())),
      name: map['name'],
      foods: List<Food>.from(map['foods']?.map((x) => Food.fromJson(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) => Meal.fromMap(json.decode(source));
}

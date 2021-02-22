import 'package:diet_controller/interface/meal.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class MealState {
  const MealState();
}

class MealInitial extends MealState {
  const MealInitial();
}

class MealLoading extends MealState {
  const MealLoading();
}

class MealLoaded extends MealState {
  final List<Meal> meal;
  const MealLoaded(this.meal);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is MealLoaded &&
      listEquals(o.meal, meal);
  }

  @override
  int get hashCode => meal.hashCode;
}

class MealError extends MealState {
  final String message;

  MealError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is MealError &&
      o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

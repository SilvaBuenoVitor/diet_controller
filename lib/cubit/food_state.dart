part of 'food_cubit.dart';

@immutable
abstract class FoodState {
  const FoodState();
}

class FoodInitial extends FoodState {
  const FoodInitial();
}

class FoodLoading extends FoodState {
  const FoodLoading();
}

class FoodLoaded extends FoodState {
  final List<Food> food;
  const FoodLoaded(this.food);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FoodLoaded && o.food == food;
  }

  @override
  int get hashCode => food.hashCode;
}

class FoodError extends FoodState{
  final String message;
  const FoodError(this.message);

   @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FoodError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}


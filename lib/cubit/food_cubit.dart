import 'package:bloc/bloc.dart';
import 'package:diet_controller/interface/food.dart';
import 'package:diet_controller/repositories/food_repository.dart';
import 'package:meta/meta.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  final FoodRepository _repository;
  FoodCubit(this._repository) : super(FoodInitial());

  //add user id later
  Future<void> getFood() async{
    try {
      emit(FoodLoading());
      final list = await _repository.fetchFood();
      emit(FoodLoaded(list));
    } catch (e) {
      emit(FoodError("Num deu bom consagra"));
    }
  }
}

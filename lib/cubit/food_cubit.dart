import 'package:bloc/bloc.dart';
import 'package:diet_controller/presentation/food/food_repository.dart';
import 'package:diet_controller/presentation/food/model/food.dart';
import 'package:meta/meta.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  final FoodRepository _repository;
  FoodCubit(this._repository) : super(FoodInitial());

  Future<void> getFood(int userId) async{
    try {
      emit(FoodLoading());
      final list = await _repository.fetchFood(userId);
      emit(FoodLoaded(list));
    } catch (e) {
      emit(FoodError("Num deu bom consagra"));
    }
  }
}

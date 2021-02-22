import 'package:bloc/bloc.dart';
import 'package:diet_controller/repositories/meal_repository.dart';
import 'package:diet_controller/cubit/meal_state.dart';

class MealCubit extends Cubit<MealState> {
  final MealRepository _repository;
  MealCubit(this._repository) : super(MealInitial());

  Future<void> getMeal(int userId) async{
    try {
      emit(MealLoading());
      final list = await _repository.fetchMeal(userId);
      emit(MealLoaded(list));
    } catch (e) {
      print(e);
      emit(MealError("Num deu bom não consagra"));
    }
  }
}

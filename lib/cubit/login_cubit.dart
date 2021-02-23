import 'package:bloc/bloc.dart';
import 'package:diet_controller/presentation/login/login_repository.dart';
import 'package:diet_controller/presentation/login/model/login.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  LoginCubit(this._loginRepository) : super(LoginInitial());

  Future<void> getLogin(String email, String password) async{
    try {
      emit(LoginLoading());
      final login = await _loginRepository.fetchLogin(email, password);
      if(login.id != -1){
        emit(LoginSuccess(login));
        return;
      }
      emit(LoginFailed());
    } catch (e) {
      emit(LoginError());
    }
  }


}

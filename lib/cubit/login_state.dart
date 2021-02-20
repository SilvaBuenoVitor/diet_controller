part of 'login_cubit.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState{
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final int id;
  const LoginSuccess(this.id);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is LoginSuccess &&
      o.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class LoginFailed extends LoginState{
  const LoginFailed();
}

class LoginError extends LoginState{
  const LoginError();
}

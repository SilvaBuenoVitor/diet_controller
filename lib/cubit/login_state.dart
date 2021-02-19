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

class LoginSuccess extends LoginState{
  const LoginSuccess();
}

class LoginFailed extends LoginState{
  const LoginFailed();
}

class LoginError extends LoginState{
  const LoginError();
}

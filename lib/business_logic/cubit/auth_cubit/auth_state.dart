part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginFailureState extends AuthState {
  final String errorMessage;

  LoginFailureState(this.errorMessage);
}

class RegisterSuccessState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterFailureState extends AuthState {
  final String errorMessage;

  RegisterFailureState(this.errorMessage);
}
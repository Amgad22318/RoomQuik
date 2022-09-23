part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileInfoSuccessState extends ProfileState {}

class GetProfileInfoLoadingState extends ProfileState {}

class GetProfileInfoFailureState extends ProfileState {
  final String? errorMessage;

  GetProfileInfoFailureState([this.errorMessage]);
}

class ChangePasswordSuccessState extends ProfileState {}

class ChangePasswordLoadingState extends ProfileState {}

class ChangePasswordFailureState extends ProfileState {
  final String? errorMessage;

  ChangePasswordFailureState([this.errorMessage]);
}

class UpdateProfileSuccessState extends ProfileState {}

class UpdateProfileLoadingState extends ProfileState {}

class UpdateProfileFailureState extends ProfileState {
  final String? errorMessage;

  UpdateProfileFailureState([this.errorMessage]);
}

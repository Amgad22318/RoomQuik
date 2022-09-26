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


class UpdateProfileSuccessState extends ProfileState {
  final String successMessage;

  UpdateProfileSuccessState(this.successMessage);

}

class UpdateProfileLoadingState extends ProfileState {}

class UpdateProfileFailureState extends ProfileState {
  final String errorMessage;

  UpdateProfileFailureState(this.errorMessage);
}

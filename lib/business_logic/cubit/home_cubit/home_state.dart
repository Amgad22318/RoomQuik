part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetFacilitiesSuccessState extends HomeState {}

class GetFacilitiesLoadingState extends HomeState {}

class GetFacilitiesFailureState extends HomeState {
  final String? errorMessage;

  GetFacilitiesFailureState([this.errorMessage]);
}

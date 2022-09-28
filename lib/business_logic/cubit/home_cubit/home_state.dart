part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetHotelsSuccessState extends HomeState {}

class GetHotelsLoadingState extends HomeState {}

class GetHotelsFailureState extends HomeState {
  final String? errorMessage;

  GetHotelsFailureState([this.errorMessage]);
}

class ShowLoadingState extends HomeState {}

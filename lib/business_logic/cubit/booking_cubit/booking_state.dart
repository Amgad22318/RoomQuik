part of 'booking_cubit.dart';

@immutable
abstract class BookingStates {}

class BookingInitial extends BookingStates {}

class BookingSuccessState extends BookingStates {
  final String msg;

  BookingSuccessState(this.msg);
}

class BookingLoadingState extends BookingStates {}

class BookingFailureState extends BookingStates {
  final String msg;

  BookingFailureState(this.msg);
}

class GetBookingDataSuccessState extends BookingStates {}

class GetBookingDataLoadingState extends BookingStates {}

class GetBookingDataFailureState extends BookingStates {
  final String? errorMessage;

  GetBookingDataFailureState([this.errorMessage]);
}

class ChangeBookingStatusSuccessState extends BookingStates {
  final int bookingId;
  ChangeBookingStatusSuccessState(this.bookingId);
}

class ChangeBookingStatusLoadingState extends BookingStates {
  final int bookingId;
  ChangeBookingStatusLoadingState(this.bookingId);
}

class ChangeBookingStatusFailureState extends BookingStates {
  final String? errorMessage;

  ChangeBookingStatusFailureState([this.errorMessage]);
}

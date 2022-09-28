import 'package:algoriza_team_6_realestate_app/data/models/responses/hotels_model/get_booking_model.dart';
import 'package:algoriza_team_6_realestate_app/data/models/responses/hotels_model/update_create_booking_model.dart';
import 'package:algoriza_team_6_realestate_app/data/repository/booking_repository/booking_repository.dart';
import 'package:algoriza_team_6_realestate_app/data/repository/create_booking_repository/create_booking_repository.dart';
import 'package:algoriza_team_6_realestate_app/data/repository/update_booking_repository/update_booking_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constants.dart';
import '../../../data/source/network/api_result_handler.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingStates> {
  BookingCubit() : super(BookingInitial());
  UpdateCreateBookingModel createBookingModel = UpdateCreateBookingModel();

  void book({
    required int hotelID,
  }) async {
    emit(BookingLoadingState());
    ApiResults apiResults = await CreateBookingRepository().createBooking(
      hotelID,
    );

    if (apiResults is ApiSuccess) {
      handleBookResponse(apiResults.data);
    } else if (apiResults is ApiFailure) {
      emit(BookingFailureState(apiResults.message));
    }
  }

  void handleBookResponse(json) {
    createBookingModel = UpdateCreateBookingModel.fromJson(json);
    if (createBookingModel.status.success) {
      getBookingData(bookingStatus: BookingStatus.upcomming);
      emit(BookingSuccessState(createBookingModel.status.title.en));
    } else {
      emit(BookingFailureState(createBookingModel.status.title.en));
    }
  }

  GetBookingModel upComingBooking = GetBookingModel();
  GetBookingModel cancelledBooking = GetBookingModel();
  GetBookingModel completedBooking = GetBookingModel();

  void getBookingData({
    required BookingStatus bookingStatus,
  }) async {
    ApiResults apiResults =
        await BookingRepository().getBookingData(20, bookingStatus);

    if (apiResults is ApiSuccess) {
      handleGetBookingDataResponse(apiResults.data, bookingStatus);
    } else if (apiResults is ApiFailure) {
      emit(GetBookingDataFailureState(apiResults.message));
    }
  }

  void handleGetBookingDataResponse(json, BookingStatus bookingStatus) {
    switch (bookingStatus) {
      case BookingStatus.upcomming:
        upComingBooking = GetBookingModel.fromJson(json);
        if (upComingBooking.status.success) {
          emit(GetBookingDataSuccessState());
        } else {
          emit(GetBookingDataFailureState());
        }
        break;
      case BookingStatus.cancelled:
        cancelledBooking = GetBookingModel.fromJson(json);
        if (cancelledBooking.status.success) {
          emit(GetBookingDataSuccessState());
        } else {
          emit(GetBookingDataFailureState());
        }
        break;
      case BookingStatus.completed:
        completedBooking = GetBookingModel.fromJson(json);
        if (completedBooking.status.success) {
          emit(GetBookingDataSuccessState());
        } else {
          emit(GetBookingDataFailureState());
        }
        break;
    }
  }

  UpdateCreateBookingModel updateBookingStatusModel =
      UpdateCreateBookingModel();

  void updateBookingStatus({
    required int bookingId,
    required BookingStatus newBookingStatus,
    required BookingStatus oldBookingStatus,
  }) async {
    emit(ChangeBookingStatusLoadingState(bookingId));
    ApiResults apiResults = await UpdateBookingRepository().updateBookingData(
      bookingId,
      newBookingStatus,
    );

    if (apiResults is ApiSuccess) {
      handleChangeBookingStatusResponse(
          apiResults.data, newBookingStatus, bookingId, oldBookingStatus);
    } else if (apiResults is ApiFailure) {
      emit(ChangeBookingStatusFailureState(apiResults.message));
    }
  }

  void handleChangeBookingStatusResponse(json, BookingStatus newBookingStatus,
      int bookingId, BookingStatus oldBookingStatus) {
    updateBookingStatusModel = UpdateCreateBookingModel.fromJson(json);
    if (updateBookingStatusModel.status.success) {
      if (oldBookingStatus == BookingStatus.cancelled) {
        cancelledBooking.data.data
            .removeWhere((element) => element.id == bookingId);
      } else if (oldBookingStatus == BookingStatus.completed) {
        completedBooking.data.data
            .removeWhere((element) => element.id == bookingId);
      } else {
        upComingBooking.data.data
            .removeWhere((element) => element.id == bookingId);
      }
      emit(ChangeBookingStatusItemRemovedState());
      getBookingData(bookingStatus: BookingStatus.upcomming);
      getBookingData(bookingStatus: BookingStatus.completed);
      getBookingData(bookingStatus: BookingStatus.cancelled);
      emit(ChangeBookingStatusSuccessState(bookingId));
    } else {
      emit(ChangeBookingStatusFailureState(
          updateBookingStatusModel.status.title.en));
    }
  }
}

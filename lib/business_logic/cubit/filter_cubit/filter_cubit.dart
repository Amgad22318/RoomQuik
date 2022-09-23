import 'package:algoriza_team_6_realestate_app/data/repository/search_hotlel_repository/search_hotel_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/responses/facilities/facilities.dart';
import '../../../data/models/responses/hotels_model/hotels_model.dart';
import '../../../data/repository/facilities_repository/facilities_repository.dart';
import '../../../data/source/network/api_result_handler.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  Hotels filterHotels = Hotels();

  void getFilterHotels() async {
    emit(GetFilterHotelsLoadingState());
    ApiResults apiResults =
        await SearchRepository().getSearchData(count: 20, page: 1);

    if (apiResults is ApiSuccess) {
      handleFilterHotelsResponse(apiResults.data);
    } else if (apiResults is ApiFailure) {
      emit(GetFilterHotelsFailureState(apiResults.message));
    }
  }

  void handleFilterHotelsResponse(json) {
    filterHotels = Hotels.fromJson(json);
    if (filterHotels.status.success) {
      emit(GetFilterHotelsSuccessState());
    } else {
      emit(GetFilterHotelsFailureState());
    }
  }

  Facilities facilities = Facilities();

  void getFacilities() async {
    emit(GetFacilitiesLoadingState());
    ApiResults apiResults = await FacilitiesRepository().getFacilitiesData();

    if (apiResults is ApiSuccess) {
      handleFacilitiesResponse(apiResults.data);
    } else if (apiResults is ApiFailure) {
      emit(GetFacilitiesFailureState(apiResults.message));
    }
  }

  void handleFacilitiesResponse(json) {
    facilities = Facilities.fromJson(json);
    if (facilities.status.success) {
      emit(GetFacilitiesSuccessState());
    } else {
      emit(GetFacilitiesFailureState());
    }
  }
}

import 'package:algoriza_team_6_realestate_app/data/models/responses/hotels_model/hotels_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/hotlels_repository/hotels_repository.dart';
import '../../../data/source/network/api_result_handler.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Hotels homeHotels = Hotels();
  int nextPage = 1;
  bool isLoading = false;
  void getHotels(int page) async {
    if (nextPage == 1) {
      emit(GetHotelsLoadingState());
    }
    isLoading = true;
    if (isLoading) {
      emit(ShowLoadingState());
    }
    ApiResults apiResults = await HotelsRepository().getHotelsData(2, page);

    if (apiResults is ApiSuccess) {
      handleHotelsResponse(apiResults.data);
    } else if (apiResults is ApiFailure) {
      emit(GetHotelsFailureState(apiResults.message));
    }
  }

  void handleHotelsResponse(json) {
    if (nextPage == 1) {
      homeHotels = Hotels.fromJson(json);
    } else if (nextPage > 1) {
      Hotels tempHotels = Hotels();
      tempHotels = Hotels.fromJson(json);
      homeHotels.data.data.addAll(tempHotels.data.data);
    }
    if (homeHotels.status.success) {
      if (homeHotels.data.lastPage > nextPage) {
        nextPage++;
        isLoading = false;
      }
      emit(GetHotelsSuccessState());
    } else {
      if (homeHotels.data.lastPage > nextPage) {
        isLoading = false;
      }

      emit(GetHotelsFailureState());
    }
  }

  void loadMoreHomeData(int page) {
    if (!isLoading) {
      getHotels(page);
    }
  }
}

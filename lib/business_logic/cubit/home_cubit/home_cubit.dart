import 'package:algoriza_team_6_realestate_app/data/models/responses/facilities/facilities.dart';
import 'package:algoriza_team_6_realestate_app/data/models/responses/hotels_model/hotels_model.dart';
import 'package:algoriza_team_6_realestate_app/data/repository/facilities_repository/facilities_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/hotlels_repository/hotels_repository.dart';
import '../../../data/source/network/api_result_handler.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  Hotels homeHotels = Hotels();

  void getHotels() async {
    emit(GetHotelsLoadingState());
    ApiResults apiResults = await HotelsRepository().getHotelsData(20, 1);

    if (apiResults is ApiSuccess) {
      handleHotelsResponse(apiResults.data);
    } else if (apiResults is ApiFailure) {
      emit(GetHotelsFailureState(apiResults.message));
    }
  }

  void handleHotelsResponse(json) {
    homeHotels = Hotels.fromJson(json);
    if (homeHotels.status.success) {
      emit(GetHotelsSuccessState());
    } else {
      emit(GetHotelsFailureState());
    }
  }
}

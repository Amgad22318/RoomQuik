import 'package:algoriza_team_6_realestate_app/data/models/responses/facilities/facilities.dart';
import 'package:algoriza_team_6_realestate_app/data/repository/facilities_repository/facilities_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/source/network/api_result_handler.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
//
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

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

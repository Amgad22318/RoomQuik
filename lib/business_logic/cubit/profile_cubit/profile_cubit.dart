import 'package:algoriza_team_6_realestate_app/data/models/responses/auth_model/auth_model.dart';
import 'package:algoriza_team_6_realestate_app/data/models/responses/auth_model/update_profile_model.dart';
import 'package:algoriza_team_6_realestate_app/data/repository/Profile_Info_repository/profile_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../data/di/di.dart';
import '../../../data/repository/update_profile_repository/update_profile_repository.dart';
import '../../../data/source/local/my_shared_preferences.dart';
import '../../../data/source/local/my_shared_preferences_keys.dart';
import '../../../data/source/network/api_result_handler.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);

  Auth auth = Auth();
  UpdateProfileModel updateProfileModel = UpdateProfileModel();

  void getProfileInfo() async {
    emit(GetProfileInfoLoadingState());
    ApiResults apiResults = await ProfileInfoRepository().getProfileInfoData();
    if (apiResults is ApiSuccess) {
      handleProfileInfoResponse(apiResults.data);
    } else if (apiResults is ApiFailure) {
      emit(GetProfileInfoFailureState(apiResults.message));
    }
  }

  void handleProfileInfoResponse(json) {
    auth = Auth.fromJson(json);
    if (auth.status.success) {
      emit(GetProfileInfoSuccessState());
    } else {
      emit(GetProfileInfoFailureState());
    }
  }

  void updateProfile({
    required String name,
    required String email,
    String? password,
    String? passwordConfirmation,
    XFile? profilePicture,
  }) async {
    emit(UpdateProfileLoadingState());
    ApiResults apiResults = await UpdateProfileRepository().updateProfileData(
      name,
      email,
      password,
      passwordConfirmation,
      profilePicture,
    );
    if (apiResults is ApiSuccess) {
      handleUpdateProfileResponse(apiResults.data);
    } else if (apiResults is ApiFailure) {
      emit(UpdateProfileFailureState(apiResults.message));
    }
  }

  void handleUpdateProfileResponse(json) {
    updateProfileModel = UpdateProfileModel.fromJson(json);
    if (updateProfileModel.status.success) {
      sl<MySharedPref>()
          .putString(key: MySharedKeys.apiToken, value: auth.data.apiToken);
      emit(UpdateProfileSuccessState(updateProfileModel.status.title.en));
    } else {
      emit(UpdateProfileFailureState(updateProfileModel.status.title.en));
    }
  }
}

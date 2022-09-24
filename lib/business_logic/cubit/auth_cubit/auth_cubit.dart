import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:algoriza_team_6_realestate_app/data/repository/login_repository/login_repository.dart';
import 'package:algoriza_team_6_realestate_app/data/repository/register_repository/register_repository.dart';
import 'package:algoriza_team_6_realestate_app/data/source/local/my_shared_preferences_keys.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/di/di.dart';
import '../../../data/models/responses/auth_model/auth_model.dart';
import '../../../data/source/local/my_shared_preferences.dart';
import '../../../data/source/network/api_result_handler.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  Auth auth = Auth();

  void login({
  required String email,
  required String password,
}) async {
    emit(LoginLoadingState());
    ApiResults apiResults = await LoginRepository().createLoginData(email, password);
    if (apiResults is ApiSuccess) {
      handleLoginResponse(apiResults.data);
    } else if (apiResults is ApiFailure) {
      emit(LoginFailureState(apiResults.message));
    }
  }

  void handleLoginResponse(json) {
    auth = Auth.fromJson(json);
    if (auth.status.success) {
      sl<MySharedPref>().putString(key: MySharedKeys.apiToken, value: auth.data.apiToken);
      emit(LoginSuccessState());
    } else {
      emit(LoginFailureState(auth.status.title.en));
    }
  }

  void register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    printTest(name);
    emit(RegisterLoadingState());
    ApiResults apiResults = await RegisterRepository().createRegisterData(
        name,
        email,
        password,
        passwordConfirmation,
    );
    if (apiResults is ApiSuccess) {
      handleRegisterResponse(apiResults.data);
    } else if (apiResults is ApiFailure) {
      emit(RegisterFailureState(apiResults.message));
    }
  }

  void handleRegisterResponse(json) {
    auth = Auth.fromJson(json);
    if (auth.status.success) {
      sl<MySharedPref>().putString(key: MySharedKeys.apiToken, value: auth.data.apiToken);
      emit(RegisterSuccessState());
    } else {
      emit(RegisterFailureState(auth.status.title.en));
    }
  }

}

import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';

import '../../source/network/endpoints.dart';
import '../../source/network/my_dio.dart';

class PassChangeRepository {

  Future<ApiResults> passChangeData(

    String email,
    String password,
    String passwordConfirmation,
  ) async {

    return await sl<MyDio>().postData(endPoint: passChangeEP, data: {

      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });
  }
}

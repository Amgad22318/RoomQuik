
import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';

import '../../source/network/endpoints.dart';
import '../../source/network/my_dio.dart';

class LoginRepository {
  Future<ApiResults> CreateLoginData(
      String email,
      String password,
      ) async {
    return await sl<MyDio>().postData(endPoint: login, data: {
      'email': email,
      'password':password,
    });
  }
}

import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';

import '../../source/network/endpoints.dart';
import '../../source/network/my_dio.dart';

class RegisterRepository {
  Future<ApiResults> CreateRegisterData(
    String name,
    String email,
    String password,
    String password_confirmation,
  ) async {
    return await sl<MyDio>().postData(endPoint: register, data: {
      'name':name ,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
    });
  }
}

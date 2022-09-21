import 'dart:html';

import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';

import '../../source/network/endpoints.dart';
import '../../source/network/my_dio.dart';

class UpdateProfileRepository {
  Future<ApiResults> updateProfileData(String name, String email,
      String password, String passwordConfirmation, File image) async {
    return await sl<MyDio>().postData(endPoint: updateInfoEP, data: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });
  }
}

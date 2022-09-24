
import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/constant_methods.dart';
import '../../source/network/endpoints.dart';
import '../../source/network/my_dio.dart';

class UpdateProfileRepository {
  Future<ApiResults> updateProfileData(String name, String email,
      String? password, String? passwordConfirmation, XFile? image) async {
    return await sl<MyDio>().postData(endPoint: updateInfoEP, data: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'image': image == null ? null : await multipartConvertImage(image: image),
    });
  }
}

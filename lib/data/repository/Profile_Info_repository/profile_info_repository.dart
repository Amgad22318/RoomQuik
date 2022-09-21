import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';

import '../../source/network/endpoints.dart';
import '../../source/network/my_dio.dart';

class Profile_Info_Repository {
  Future<ApiResults> getProfileInfoData() async {
    return await sl<MyDio>().getData(endPoint: profile_info,);
}
}

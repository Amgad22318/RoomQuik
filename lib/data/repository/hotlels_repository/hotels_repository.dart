import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';

import '../../source/network/endpoints.dart';
import '../../source/network/my_dio.dart';

class Hotels_Repository {
  Future<ApiResults> getHotelsData(
      int count,
      int page,
      ) async {
    return await sl<MyDio>().getData(endPoint: hotels, queryParameters: {
      'count': count,
      'page': page,
    });
  }
}

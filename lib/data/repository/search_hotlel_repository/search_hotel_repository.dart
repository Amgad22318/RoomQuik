import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';

import '../../source/network/endpoints.dart';
import '../../source/network/my_dio.dart';

class Search_Repository {
  Future<ApiResults> getSearchData(
    int count,
    int page,
  ) async {
    return await sl<MyDio>().getData(endPoint: search, queryParameters: {
      'count': count,
      'page': page,
    });
  }
}





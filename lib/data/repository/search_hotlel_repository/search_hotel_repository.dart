import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';

import '../../source/network/endpoints.dart';
import '../../source/network/my_dio.dart';

class SearchRepository {
  Future<ApiResults> getSearchData({
    required int count,
    required int page,
    String? name,
    String? address,
    int? maxPrice,
    int? minPrice,
    double? latitude,
    double? longitude,
    int? distance,
    List<int>? facilities,
  }) async {
    Map<String, dynamic> query = {
      'count': count,
      'page': page,
      'name': name,
      'address': address,
      'max_price': maxPrice,
      'min_price': minPrice,
      'facilities': page,
      'latitude': latitude,
      'longitude': longitude,
      'distance': distance,
    };
    if (facilities != null) {
      facilities.asMap().forEach((index, element) {
        query['facilities[$index]'] = element;
      });
    }
    return await sl<MyDio>()
        .getData(endPoint: searchEP, queryParameters: query);
  }
}

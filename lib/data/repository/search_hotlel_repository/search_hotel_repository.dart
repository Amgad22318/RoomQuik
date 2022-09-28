import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/responses/facilities/facilities.dart';
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
    LatLng? latLng,
    int? distance,
    Facilities? facilities,
  }) async {
    Map<String, dynamic> query = {
      'count': count,
      'page': page,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (maxPrice != null) 'max_price': maxPrice,
      if (minPrice != null) 'min_price': minPrice,
      if (latLng != null) 'latitude': latLng.latitude,
      if (latLng != null) 'longitude': latLng.longitude,
      if (distance != null) 'distance': distance,
    };
    if (facilities != null) {
      facilities.data.asMap().forEach((index, element) {
        if (element.checked) {
          query['facilities[$index]'] = element.id;
        }
      });
    }
    printTest(query.toString());
    return await sl<MyDio>()
        .getData(endPoint: searchEP, queryParameters: query);
  }
}

import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';

import '../../source/network/endpoints.dart';
import '../../source/network/my_dio.dart';

class UpdateBookingRepository {
  Future<ApiResults> UpdateBookingData(
    int booking_id,
      String type,
  ) async {
    return await sl<MyDio>().postData(endPoint: updateBookingStatus, data: {
      'booking_id':booking_id,
      'type':type,
    });
  }
}

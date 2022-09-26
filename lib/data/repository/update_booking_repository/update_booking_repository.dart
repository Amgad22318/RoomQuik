import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';

import '../../../constants/constants.dart';
import '../../source/network/endpoints.dart';
import '../../source/network/my_dio.dart';

class UpdateBookingRepository {
  Future<ApiResults> updateBookingData(
    int bookingId,
    BookingStatus type,
  ) async {
    return await sl<MyDio>().postData(endPoint: updateBookingStatusEP, data: {
      'booking_id': bookingId,
      'type': type.name,
    });
  }
}

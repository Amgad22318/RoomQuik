import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/api_result_handler.dart';

import '../../../constants/constants.dart';
import '../../source/network/endpoints.dart';
import '../../source/network/my_dio.dart';

class BookingRepository {
  Future<ApiResults> getBookingData(
    int count,
    BookingStatus type,
  ) async {
    return await sl<MyDio>().getData(endPoint: getBookingsEP, queryParameters: {
      'count': count,
      'type': type.name,
    });
  }
}

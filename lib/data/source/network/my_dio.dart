import 'dart:io';

import 'package:algoriza_team_6_realestate_app/data/source/local/my_shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../../constants/constant_methods.dart';
import '../../di/di.dart';
import '../local/my_shared_preferences_keys.dart';
import 'api_result_handler.dart';

class MyDio {
  late Dio dio;

  MyDio() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: 'http://api.mahmoudtaha.com/api/',
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
    );
    dio = Dio(baseOptions);
    printTest('dio');
  }

  Future<ApiResults> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "token": sl<MySharedPref>().getString(key: MySharedKeys.apiToken),
    };
    try {
      var response = await dio.get(endPoint, queryParameters: queryParameters);

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');
      printResponse('response:    $response');
      return ApiSuccess(response.data, response.statusCode);
    } on SocketException {
      return ApiFailure("لا يوجد اتصال بالانترنت");
    } on FormatException {
      return ApiFailure("حدث خطأ في صيغة البيانات");
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        // return ApiFailure(e.response!.data['message']);
        return ApiFailure(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        // print('check your connection');
        return ApiFailure("تأكد من اتصالك بالانترنت");
      } else if (e.type == DioErrorType.receiveTimeout) {
        // print('unable to connect to the server');
        return ApiFailure("غير قادر علي الاتصال بالسيرفر");
      } else {
        return ApiFailure("حدث خطأ حاول مرة اخري");
      }
    } catch (e) {
      return ApiFailure("حدث خطأ حاول مرة اخري");
    }
  }

  Future<ApiResults> postData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool formData = true,
    String? token,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      "token": sl<MySharedPref>().getString(key: MySharedKeys.apiToken),
    };

    try {
      var response = await dio.post(
        endPoint,
        data: formData ? FormData.fromMap(data ?? {}) : data,
        queryParameters: queryParameters,
      );
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('body:    $data');
      printResponse('response:    $response');
      return ApiSuccess(response.data, response.statusCode);
    } on SocketException {
      return ApiFailure("لا يوجد اتصال بالانترنت");
    } on FormatException {
      return ApiFailure("حدث خطأ في صيغة البيانات");
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        // return ApiFailure(e.response!.data['message']);
        return ApiFailure(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        // print('check your connection');
        return ApiFailure("تأكد من اتصالك بالانترنت");
      } else if (e.type == DioErrorType.receiveTimeout) {
        // print('unable to connect to the server');
        return ApiFailure("غير قادر علي الاتصال بالسيرفر");
      } else {
        return ApiFailure("حدث خطأ حاول مرة اخري");
      }
    } catch (e) {
      return ApiFailure("$eحدث خطأ حاول مرة اخري ");
    }
  }
}

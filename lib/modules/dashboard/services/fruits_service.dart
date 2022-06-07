import 'package:flutter_take_home_test/lib.dart';

import 'package:dio/dio.dart';

class FruitsService {
  final Dio _dio = Dio();

  FruitsService() {
    _dio.options.connectTimeout = connectionTimeout;
    _dio.options.receiveTimeout = connectionReadTimeout;
    _dio.interceptors.add(Logging());
  }

  Future<Response> getFruits() async {
    _dio.options.baseUrl = baseUrl;
    _dio.options.responseType = ResponseType.json;

    try {
      var response = await _dio.post(apiGetFruits, data: {
        "imageReferences": true,
        "referenceId": referenceId,
      });
      return response;
    } on DioError catch (e) {
      return dioCatchError(e);
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// This file holds the functions to be used in interceptors to include logging
class LoggingInterceptor {
  /// Error Interceptor for logging in information
  printError(
    DioError dioError,
  ) {
    log("<-- ${dioError.message} ${dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path}");
    log("${dioError.response != null ? dioError.response!.data : 'Unknown Error'}");
    log("<-- End error");
  }

  /// Prints Successful response
  printSuccess(Response response) {
    log("<-- ${response.statusCode} ${response.requestOptions.baseUrl + response.requestOptions.path}");
    log("Response: ${jsonEncode(response.data)}");
    debugPrint("<-- END HTTP");
  }

  /// Prints request
  ///
  /// Prints body if it has body
  /// Prints headers, even if does not have headers
  printRequest(RequestOptions options) {
    log("--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}");
    log("Headers:");
    options.headers.forEach((k, v) => debugPrint('$k: $v'));
    log("queryParameters:");
    options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    log("Body: ${options.data}");
    log("--> END ${options.method.toUpperCase()}");

    return options;
  }
}

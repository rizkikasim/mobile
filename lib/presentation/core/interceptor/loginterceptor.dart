import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            _printRequestLog(options);
            return handler.next(options);
          },
          onResponse: (response, handler) {
            _printResponseLog(response);
            return handler.next(response);
          },
          onError: (DioException e, handler) {
            _printErrorLog(e);
            return handler.next(e);
          },
        ),
      );
    }
  }

  void _printRequestLog(RequestOptions options) {
    debugPrint(
      '╔════════════════════════════════════════════════════════════════════════╗',
    );
    debugPrint(
      '║                                  API Request                             ║',
    );
    debugPrint(
      '╠════════════════════════════════════════════════════════════════════════╣',
    );
    debugPrint('║ Method: ${options.method.padRight(7)} ${options.uri}');
    debugPrint('║ Headers:');
    options.headers.forEach((key, value) {
      debugPrint('║   $key: $value');
    });
    if (options.data != null) {
      try {
        debugPrint('║ Request Body:');
        debugPrint('║   ${_prettifyJson(options.data)}');
      } catch (e) {
        debugPrint('║ Request Body: ${options.data}');
      }
    }
    debugPrint(
      '╚════════════════════════════════════════════════════════════════════════╝',
    );
  }

  void _printResponseLog(Response response) {
    debugPrint(
      '╔════════════════════════════════════════════════════════════════════════╗',
    );
    debugPrint(
      '║                                 API Response                             ║',
    );
    debugPrint(
      '╠════════════════════════════════════════════════════════════════════════╣',
    );
    debugPrint('║ URL: ${response.requestOptions.uri}');
    debugPrint('║ Status: ${response.statusCode} ${response.statusMessage}');
    debugPrint('║ Response Body:');
    try {
      debugPrint('║   ${_prettifyJson(response.data)}');
    } catch (e) {
      debugPrint('║   ${response.data}');
    }
    debugPrint(
      '╚════════════════════════════════════════════════════════════════════════╝',
    );
  }

  void _printErrorLog(DioException e) {
    debugPrint(
      '╔════════════════════════════════════════════════════════════════════════╗',
    );
    debugPrint(
      '║                                  API Error                               ║',
    );
    debugPrint(
      '╠════════════════════════════════════════════════════════════════════════╣',
    );
    debugPrint('║ URL: ${e.requestOptions.uri}');
    debugPrint('║ Type: ${e.type}');
    debugPrint('║ Message: ${e.message}');
    if (e.response != null) {
      debugPrint('║ Status Code: ${e.response?.statusCode}');
      debugPrint('║ Response Body:');
      try {
        debugPrint('║   ${_prettifyJson(e.response?.data)}');
      } catch (ex) {
        debugPrint('║   ${e.response?.data}');
      }
    }
    debugPrint(
      '╚════════════════════════════════════════════════════════════════════════╝',
    );
  }

  String _prettifyJson(dynamic json) {
    if (json == null) return 'null';
    try {
      final object = (json is String) ? jsonDecode(json) : json;
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(object);
    } catch (e) {
      return json.toString();
    }
  }
}

import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = options.baseUrl;
    options.connectTimeout = const Duration(seconds: 30);
    options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
  }
}

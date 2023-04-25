import 'package:dio/dio.dart';

class DioErrorHandleInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: Add unauthorized Error Handling
  }
}

class DioResponseHandleInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: Other fancy stuffs here
  }
}

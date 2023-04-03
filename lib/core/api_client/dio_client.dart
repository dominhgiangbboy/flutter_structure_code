import 'package:dio/dio.dart';
import 'package:flutter_default_structure/core/api_client/restful_client.dart';

class DioClient implements RestfulClient {
  final Dio dio;
  DioClient(this.dio);
  @override
  Future delete(String url) {
    throw UnimplementedError();
  }

  @override
  Future get(String url) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future post(String url, Map<String, dynamic> body) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put(String url, Map<String, dynamic> body) {
    // TODO: implement put
    throw UnimplementedError();
  }
}

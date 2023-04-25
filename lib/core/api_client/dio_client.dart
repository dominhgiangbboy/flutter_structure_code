import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_default_structure/core/api_client/restful_client.dart';
import 'package:flutter_default_structure/core/base_models/base_response_api.dart';
import 'package:flutter_default_structure/core/error_handler/failure_case.dart';

class DioClient<T> implements RestfulClient<T> {
  final Dio dio;
  DioClient(this.dio);
  @override
  Future<T> delete(String url) {
    throw UnimplementedError();
  }

  @override
  Future<T> get(String url) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<T, Failure>> post(String url, {required Map<String, dynamic> data, required dynamic Function(Map<String, dynamic>) decode}) async {
    try {
      Response<Map<String, dynamic>> response = await dio.post(url, data: data);
      final BaseResponseApi<T> result = BaseResponseApi.fromJson(response.data!, decode);
      return Left(result.data);
    } on DioError catch (e) {
      return Right(ServerFailure(message: e.message.toString()));
    } catch (e) {
      return Right(ModelFailure(message: e.toString()));
    }
  }

  @override
  Future<T> put(String url, Map<String, dynamic> body) {
    // TODO: implement put
    throw UnimplementedError();
  }
}

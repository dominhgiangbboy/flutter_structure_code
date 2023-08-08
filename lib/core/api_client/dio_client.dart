import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quickcare_employee_app/core/api_client/restful_client.dart';
import 'package:quickcare_employee_app/core/base_models/base_response_api.dart';
import 'package:quickcare_employee_app/core/error_handler/failure_case.dart';

class DioClient<T> implements RestfulClient<T> {
  final Dio dio;
  DioClient(this.dio);

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
  Future<Either<T, Failure>> get(String url, {required Map<String, dynamic> params, required T Function(Map<String, dynamic> p1) decode}) async {
    try {
      Response<Map<String, dynamic>> response = await dio.get(url, queryParameters: params);
      final BaseResponseApi<T> result = BaseResponseApi.fromJson(response.data!, decode);
      return Left(result.data);
    } on DioError catch (e) {
      return Right(ServerFailure(message: e.message.toString()));
    } catch (e) {
      return Right(ModelFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<T, Failure>> delete(String url, {required Map<String, dynamic> params, required T Function(Map<String, dynamic> p1) decode}) async {
    try {
      Response<Map<String, dynamic>> response = await dio.delete(url, queryParameters: params);
      final BaseResponseApi<T> result = BaseResponseApi.fromJson(response.data!, decode);
      return Left(result.data);
    } on DioError catch (e) {
      return Right(ServerFailure(message: e.message.toString()));
    } catch (e) {
      return Right(ModelFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<T, Failure>> put(String url, {required Map<String, dynamic> params, required T Function(Map<String, dynamic> p1) decode}) async {
    try {
      Response<Map<String, dynamic>> response = await dio.put(url, queryParameters: params);
      final BaseResponseApi<T> result = BaseResponseApi.fromJson(response.data!, decode);
      return Left(result.data);
    } on DioError catch (e) {
      return Right(ServerFailure(message: e.message.toString()));
    } catch (e) {
      return Right(ModelFailure(message: e.toString()));
    }
  }
}
